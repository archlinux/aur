# Maintainer: CallMeAlphabet
pkgname=timeit
pkgver=r1
pkgrel=1
pkgdesc="timeit, a precise command timing utility, builds from source"
arch=('x86_64')
url="https://github.com/CallMeAlphabet/timeit"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=('timeit')
conflicts=('timeit-bin')
source=("timeit::git+https://github.com/CallMeAlphabet/timeit.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/timeit"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/timeit"
    cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
    cd "$srcdir/timeit"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$srcdir/timeit"
    install -Dm755 "target/release/timeit" "$pkgdir/usr/bin/timeit"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
