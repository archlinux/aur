# Maintainer: Cleboost <clement.balarot@gmail.com>
pkgname=codegraph-rs-git
pkgver=r350.g5c59daf
pkgrel=1
pkgdesc="Local-first code intelligence: tree-sitter knowledge graph + MCP server (git)"
arch=('x86_64' 'aarch64')
url="https://github.com/Cleboost/codegraph-rs"
license=('MIT')
depends=('gcc-libs' 'sqlite')
makedepends=('rust' 'cargo' 'git')
provides=('codegraph')
conflicts=('codegraph' 'codegraph-rs-bin')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_HOME="$srcdir/.cargo"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_HOME="$srcdir/.cargo"
    export CARGO_TARGET_DIR=target
    export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
    export CFLAGS+=" -ffat-lto-objects"
    export RUSTFLAGS+=" --remap-path-prefix=$srcdir=/build"
    cargo build --frozen --release -p codegraph
}

package() {
    cd "$pkgname"
    install -Dm755 target/release/codegraph "$pkgdir/usr/bin/codegraph"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
