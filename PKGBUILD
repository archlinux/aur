# Maintainer: CallMeAlphabet
pkgname=fastwc
pkgver=r1
pkgrel=1
pkgdesc="fastwc, a fast wc rewrite, builds from source"
arch=('x86_64')
url="https://github.com/CallMeAlphabet/fastwc"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=('fastwc')
conflicts=('fastwc-bin')
source=("fastwc::git+https://github.com/CallMeAlphabet/fastwc.git#tag=latest")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/fastwc"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/fastwc"
    cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
    cd "$srcdir/fastwc"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$srcdir/fastwc"
    install -Dm755 "target/release/fastwc" "$pkgdir/usr/bin/fastwc"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
