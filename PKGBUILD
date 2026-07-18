# Maintainer: CallMeAlphabet
pkgname=fasthex
pkgver=r1
pkgrel=1
pkgdesc="fasthex, a very fast hex dumper, builds from source"
arch=('x86_64')
url="https://github.com/CallMeAlphabet/fasthex"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=('fasthex')
conflicts=('fasthex-bin')
source=("fasthex::git+https://github.com/CallMeAlphabet/fasthex.git#tag=latest")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/fasthex"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/fasthex"
    cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
    cd "$srcdir/fasthex"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$srcdir/fasthex"
    install -Dm755 "target/release/fasthex" "$pkgdir/usr/bin/fasthex"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
