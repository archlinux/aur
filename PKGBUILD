# Maintainer: Jasmin <theblazehen@gmail.com>
pkgname=jdwp-mcp-git
pkgver=r22.7f41d94
pkgrel=1
pkgdesc="MCP server enabling LLMs to debug Java applications via JDWP protocol"
arch=('x86_64')
url="https://github.com/navicore/jdwp-mcp"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=('jdwp-mcp')
conflicts=('jdwp-mcp')
source=("${pkgname}::git+https://github.com/navicore/jdwp-mcp.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CFLAGS+=' -ffat-lto-objects'
    cargo build --release
}

# check() - disabled due to upstream example tests being out of sync with lib
# check() {
#     cd "$pkgname"
#     export RUSTUP_TOOLCHAIN=stable
#     cargo test
# }

package() {
    cd "$pkgname"
    install -Dm755 target/release/jdwp-mcp "$pkgdir/usr/bin/jdwp-mcp"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
