# Maintainer: Adi Hascal <adi.hascal+aur at gmail dot com>
pkgname=cargo-xwin-git
pkgver=v0.17.3.r2.c1b29c7
pkgrel=1
pkgdesc='Cross compile Cargo project to Windows msvc target with ease'
arch=('x86_64')
url="https://github.com/rust-cross/cargo-xwin"
license=('MIT')
makedepends=('git' 'cargo')
optdepends=('clang: for C/C++ dependencies' 'llvm: for assembly dependencies')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/rust-cross/cargo-xwin')
md5sums=('SKIP')
options=(!lto)

pkgver() {
        cd "$srcdir/${pkgname%-git}"
        printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
        cd "$srcdir/${pkgname%-git}"
        cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
        cd "$srcdir/${pkgname%-git}"
        cargo build --release --frozen
}

package() {
        cd "$srcdir/${pkgname%-git}"
        install -Dm0755 target/release/cargo-xwin "$pkgdir/usr/bin/cargo-xwin"
        install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
