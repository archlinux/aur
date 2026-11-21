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
pkgver=0.47.1
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

sha256sums_x86_64=('6d235744243ddbd2e8d61aa19cd464d90d930640fcdc06f4185756c41d31c2d7'
                  'b2d95ef2282e60d55ee2a1074055fb099d92d046e1fa100f41f6732829d19bcc'
                  '1164687a9fa358b70a2dcbd8cbf0c77721706139d04d654597f770c46a30466b'
                  '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0'
                  'SKIP'
                  'SKIP')

sha256sums_aarch64=('acb01c81562b68d4c49163a6ed1f72f7d6a73f70612472aca5f1e5998b862199'
                   '692aff3c25f9f041b12c027907e7f1a910ee01fa55c376ae061977a3ce102c4e'
                   '6eb2740797ec9774a56055cc6848e67638c516cfa3eca337cec087f82134e345'
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
