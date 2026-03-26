#! /bin/bash

＃笔记：
#当脚本提示您提供专用配置链接时，请复制并使用您自己的 Gist 的原始链接！
# 
#注意：
#当脚本提示您提供专属配置链接时，请使用您自己的Gist的RAW链接！



＃必需的。
#
#如果您无法直接访问 GitHub（例如，由于网络限制），请在此处设置代理 URL 前缀。
#请注意，前缀也会添加到所有规则 URL 的开头。
#
#否则，请留空！！！
#
＃例子：
# GLOBAL_GITHUB_PROXY_URL="https://my_github_proxy_url_prefix.com"
GLOBAL_GITHUB_PROXY_URL= " "



＃必需的。
#
#如果订阅过程失败，请修改此参数。（更多信息请参见 https://github.com/immortalwrt/homeproxy/pull/189。）
#
#否则，请留空！！！
#
#示例：SUBSCRIPTION_USER_AGENT="Mozilla/5.0 (Windows NT 10.0; Win64; x64)"
订阅用户代理= “



＃选修的。
#
#如果已定义，脚本将调用嵌入式 homeproxy 订阅脚本，以自动完成代理服务的订阅过程。
订阅网址=(
  #更改为您自己的订阅网址。
  " https://abc.com?subscribe=123#Your_custom_proxy_server_name_01 "
  " https://xyz.com?subscribe=456#Your_custom_proxy_server_name_02 "
）



＃必需的。
RULESET_URLS=(
  #
  # "您的节点名称|
  # URL1
  # URL2
  # URL3
  # /绝对路径/文件/路径/file1.json
  # /绝对路径/文件/路径/file2.srs
  # ...
  #

  #可选：如果您不需要任何广告规则，请删除整个“reject_out”定义。
  " reject_out|
  https://raw.githubusercontent.com/privacy-protection-tools/anti-ad.github.io/master/docs/anti-ad-sing-box.srs​
  
  #
  #
  #   ----------------- 规则集开始 -----------------
  #
  #

  “ PROXY_SERVER_01_US|
  /etc/homeproxy/ruleset/MyProxy.json
  https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/refs/heads/sing/geo/geosite/google@cn.srs
  https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/refs/heads/sing/geo/geosite/google-gemini.srs
  https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/refs/heads/sing/geo/geosite/google-trust-services.srs
  https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/refs/heads/sing/geo/geosite/google-trust-services@cn.srs
  https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/refs/heads/sing/geo/geosite/google-play.srs
  https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/refs/heads/sing/geo/geosite/google-play@cn.srs
  https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/refs/heads/sing/geo/geosite/googlefcm.srs
  https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/refs/heads/sing/geo/geosite/google.srs
  https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/refs/heads/sing/geo/geoip/google.srs​

  “ PROXY_SERVER_02_US|
  /etc/homeproxy/ruleset/MyAI.json
  https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/refs/heads/sing/geo/geosite/openai.srs
  https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/refs/heads/sing/geo/geosite/bing.srs
  https://raw.githubusercontent.com/KaringX/karing-ruleset/sing/geo/geoip/ai.srs
  https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/refs/heads/sing/geo/geosite/telegram.srs
  https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/refs/heads/sing/geo/geoip/telegram.srs
  https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/refs/heads/sing/geo/geosite/discord.srs​
  
  " PROXY_SERVER_02_SG_带后缀或不带后缀|
  https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/refs/heads/sing/geo/geosite/twitch.srs
  https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/refs/heads/sing/geo/geosite/amazon.srs
  https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/refs/heads/sing/geo/geosite/amazon@cn.srs
  https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/refs/heads/sing/geo/geosite/amazontrust.srs​
  
  “ PROXY_SERVER_02_US_IPv6_AsBackup|
  https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/refs/heads/sing/geo/geosite/twitter.srs
  https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/refs/heads/sing/geo/geosite/x.srs
  https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geoip/twitter.srs
  https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/refs/heads/sing/geo/geosite/tiktok.srs​
 
  #可选：如果您不需要任何国内规则，请删除整个“direct_out”定义。
  直接输出|
  /etc/homeproxy/ruleset/MyDirect.json
  https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/refs/heads/sing/geo/geosite/microsoft@cn.srs
  https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/refs/heads/sing/geo/geosite/azure@cn.srs
  https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/refs/heads/sing/geo/geosite/apple-cn.srs
  https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/refs/heads/sing/geo/geoip/cn.srs
  https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/refs/heads/sing/geo/geosite/cn.srs​
  
  #
  #
  #   ----------------- 规则集结束 -----------------
  #
  #

）



＃必需的。
DNS_SERVERS=(
  # "您的 DNS 服务器名称|
  #卫生部
  #美国交通部
  # UDP
  #有关更多信息，请参阅 https://sing-box.sagernet.org/configuration/dns/server。
  # ...
  # “
  #
  
  “ PROXY_SERVER_01_US|
  https://dns.google/dns-query​
  
  “ PROXY_SERVER_02_US|
  https://dns.google/dns-query​
  
  " PROXY_SERVER_02_SG_带后缀或不带后缀|
  https://1.1.1.1/dns-query​
  
  “ PROXY_SERVER_02_US_IPv6_AsBackup|
  2001:4860:4860:0000:0000:0000:0000:8888 "
  
  "默认 DNS 服务器|
  https://dns.google/dns-query
  https://cloudflare-dns.com/dns-query
  https://doh.opendns.com/dns-query​
）
