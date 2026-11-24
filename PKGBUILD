# Maintainer: coffee <coffee@localhost>
#
# crw —— Rust 实现的 Firecrawl/Tavily 替代品（web scraper / crawler / search API + MCP server）
# 上游只发预编译二进制（GitHub Release 资产）和 docker 镜像，所以走 -bin 路线。
# 二进制是 static-pie 静态链接，运行时没有任何库依赖。
#
# 装完启动用户服务：
#   systemctl --user daemon-reload && systemctl --user enable --now crw
# 默认监听 127.0.0.1:3000（Firecrawl 兼容：POST /v1/scrape、/v1/search、/v1/crawl、GET /health）
# 配置在 /etc/crw/config.toml（pacman backup 文件，升级不会覆盖你的修改）

pkgname=crw-bin
pkgver=0.49.1
pkgrel=1
pkgdesc="Fast, lightweight Firecrawl/Tavily alternative in Rust — web scraper, crawler & search API with MCP server"
arch=('x86_64' 'aarch64')
url="https://github.com/fastcrw/crw"
license=('AGPL-3.0-only')
depends=()
provides=('crw')
conflicts=('crw' 'crw-git')
options=('!strip')
backup=('etc/crw/config.toml')

_rel="https://github.com/fastcrw/crw/releases/download/v$pkgver"
_lic="https://raw.githubusercontent.com/fastcrw/crw/v$pkgver/LICENSE"

source_x86_64=("$pkgname-$pkgver.tar.gz::$_rel/crw-linux-x64.tar.gz"
               "crw-server-$pkgver.tar.gz::$_rel/crw-server-linux-x64.tar.gz"
               "crw-mcp-$pkgver.tar.gz::$_rel/crw-mcp-linux-x64.tar.gz"
               "LICENSE::$_lic"
               "crw.service"
               "config.toml")

source_aarch64=("$pkgname-$pkgver.tar.gz::$_rel/crw-linux-arm64.tar.gz"
                "crw-server-$pkgver.tar.gz::$_rel/crw-server-linux-arm64.tar.gz"
                "crw-mcp-$pkgver.tar.gz::$_rel/crw-mcp-linux-arm64.tar.gz"
                "LICENSE::$_lic"
                "crw.service"
                "config.toml")

sha256sums_x86_64=('1ff597348da39c9c3281e0327ec3fbdaea57848a4380b47b2bf77b9fd4b1bba8'
                  '6b98bb20a719913461987ec4d10ebb3a5df592a00e1184b56011ec7b533ff5ee'
                  '5809e62b5bc29c27bf398a305234a920d66eea31d332f5140b157ba2e712a9a2'
                  '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0'
                  'SKIP'
                  'SKIP')

sha256sums_aarch64=('35105c734f262e3dcc6afe028dc3875be8f86970d81002151785e1e2e684e475'
                   'dd8230fa32e92bfb97f58b9a99a002d45b4fcab2b2bdb180161cd8cbb725fd36'
                   '4b9dfa1ae3689d695a35435c617cce5940674ab5d450284c185550a44c742015'
                   '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0'
                   'SKIP'
                   'SKIP')

package() {
    install -Dm755 crw        "$pkgdir/usr/bin/crw"
    install -Dm755 crw-server "$pkgdir/usr/bin/crw-server"
    install -Dm755 crw-mcp    "$pkgdir/usr/bin/crw-mcp"

    install -Dm644 config.toml "$pkgdir/etc/crw/config.toml"
    install -Dm644 crw.service "$pkgdir/usr/lib/systemd/user/crw.service"
    install -Dm644 LICENSE     "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
