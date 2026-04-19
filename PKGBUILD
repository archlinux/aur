# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=tsql-git
_pkgname="${pkgname%-git}"
pkgver=0.6.0.r0.g63e5891
pkgrel=1
pkgdesc='A modern PostgreSQL and MongoDB manager TUI'
arch=(x86_64 aarch64)
url='https://github.com/fcoury/tsql'
license=('MIT')
makedepends=(cargo tree-sitter)
options=(!lto)
provides=('tsql')
conflicts=('tsql' 'tsql-bin')
source=("$_pkgname::git+$url.git#branch=master")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen
}

package() {
    cd "$_pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/README.md" README.md
}

