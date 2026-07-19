# Maintainer: CallMeAlphabet
pkgname=fastcount
pkgver=r1
pkgrel=1
pkgdesc="fastcount, an incredibly fast, incredibly useless counter, builds from source"
arch=('x86_64')
url="https://github.com/CallMeAlphabet/fastcount"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=('fastcount')
conflicts=('fastcount-bin')
source=("fastcount::git+https://github.com/CallMeAlphabet/fastcount.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/fastcount"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/fastcount"
    cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
    cd "$srcdir/fastcount"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$srcdir/fastcount"
    install -Dm755 "target/release/fastcount" "$pkgdir/usr/bin/fastcount"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
