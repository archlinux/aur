# Maintainer: Adrian Valcarcel-Schott <avalsch at pm dot me>

pkgname=schemat
pkgver=0.5.10
pkgrel=1
pkgdesc='Code formatter for Scheme, Lisp, and any S-expressions'
arch=('x86_64' 'aarch64')
url='https://github.com/raviqqe/schemat'
license=('Unlicense')
depends=('glibc' 'libgcc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('ad3866c9b7530b0343da851b1d6fceb8c6a90937c75de960177d8c82647dc56d6991a98090f801de4e53b6d4ba6df8b230ce056707362cd31ff51f98b378e1f9')

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
