# Maintainer: Adrian Valcarcel-Schott <avalsch at pm dot me>

pkgname=schemat
pkgver=0.5.16
pkgrel=1
pkgdesc='Code formatter for Scheme, Lisp, and any S-expressions'
arch=('x86_64' 'aarch64')
url='https://github.com/raviqqe/schemat'
license=('Unlicense')
depends=('glibc' 'libgcc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('43d8feead251446e8324ab8745554a003aeca27d21d8e01d4e0deb49a9ccc34bb15cad3674537134f5542c1c1299ed341dea7c4ebf3918bb880e3f228e3b5aff')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"

    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" UNLICENSE
}
