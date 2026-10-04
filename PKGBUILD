# Maintainer: Adrian Valcarcel-Schott <avalsch at pm dot me>

pkgname=schemat
pkgver=0.5.9
pkgrel=1
pkgdesc='Code formatter for Scheme, Lisp, and any S-expressions'
arch=('x86_64' 'aarch64')
url='https://github.com/raviqqe/schemat'
license=('Unlicense')
depends=('glibc' 'libgcc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('31afe1b7a527a6247d4fe80ad5199da61bc388c296a0283de641b478d643a2b866f8d2ba09c6416317dbe61628de93f58743b6b79ef95eb2fc0c6ad10a52e5d0')

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
