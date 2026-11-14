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
pkgver=0.44.0
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

sha256sums_x86_64=('a17d56549f21c302c1fcf007f11b662a7d9f92bba4cea5d41c82ade4a87cea2a'
                   '220d751f52bebb210a58594db83885e8a739fe68a38e6e5c9a49fc5ca8a82ef6'
                   '1f92cf0a864c98bb781fac8b949236aebf80a3f2138e605652c74f015973883c'
                   '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0'
                   'SKIP'
                   'SKIP')

sha256sums_aarch64=('0a27b82f2a947715a9fec029c030eeb57ecbec36928ba6ca07ca22de294c8c2d'
                    '4a2f612244ba038906ebe4b00170ddc40d2e62fca5ab8f18f3df8fa45e04f64a'
                    '18db37a318e0f7a362f2e62b47459f6c0beab87f745b05e61457a2fd8e81a1d4'
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
