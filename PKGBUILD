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
pkgver=0.47.0
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

sha256sums_x86_64=('48b79aeb93e3129c3c57bad6ac9485ad1790654500af78ca66cd4ecb3e593938'
                  '07563bb624e30d6e94b553eca58143e2bc5919047c5f748c600acaa78c3a934a'
                  'bf5f775b6974e4e187a60f6617701f1e73f9c353731ed185ddd8839e534dc290'
                  '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0'
                  'SKIP'
                  'SKIP')

sha256sums_aarch64=('1b6375a2a56a45926b69f480b6d1706c44dee648d6d45b974a694da8070982ae'
                   '60701e292c6a2da49c18de4721d12a8384ead25fdb69a57a74110199ed252164'
                   'd80f42aa6c18d333e42822b7a9f235b9983d2ceffc14064c264c75a2b1d2f733'
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
