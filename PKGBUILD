# Maintainer: Cleboost <clement.balarot@gmail.com>
pkgname=codegraph-rs-git
pkgver=r0.g0000000
pkgrel=1
pkgdesc="Local-first code intelligence: tree-sitter knowledge graph + MCP server (git)"
arch=('x86_64' 'aarch64')
url="https://github.com/Cleboost/codegraph-rs"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo' 'git' 'gcc')
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
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release -p codegraph
}

check() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --workspace
}

package() {
    cd "$pkgname"
    install -Dm755 target/release/codegraph "$pkgdir/usr/bin/codegraph"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
