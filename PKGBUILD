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
pkgver=0.49.0
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

sha256sums_x86_64=('8e400fa447384a844a6294eb9cfa1d75924c07639f8bb4f0a307a609b27b3b00'
                  '734f205fc33cafdb31083ca397a99c679c5ef61cfe750595c2d6b4e1349ae6b8'
                  '1ba72811a69e412be6c3b2e335160d2b9cc143816b3bdbdff2c7e98089d7d32c'
                  '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0'
                  'SKIP'
                  'SKIP')

sha256sums_aarch64=('7c5eab52f18ba1a6e789710188bcbc92e4f94a1dbde33f9058563a1f6c1c18d8'
                   '84286aa51412715f580841b34fd4b4abd0928132fa9baad8fe0513ef9d7d9435'
                   'a913e7f4250da0cdb88f8ebf2e14336ea03b799145baa08531c17d5c38de37f1'
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
