# Maintainer: Adrian Valcarcel-Schott <avalsch at pm dot me>

pkgname=schemat
pkgver=0.5.13
pkgrel=1
pkgdesc='Code formatter for Scheme, Lisp, and any S-expressions'
arch=('x86_64' 'aarch64')
url='https://github.com/raviqqe/schemat'
license=('Unlicense')
depends=('glibc' 'libgcc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('ec494b80beb7709e875345729c1984d21b479efaca5c76d6eb7becd964c809569dff8a1b3e2b70faf6511c7ec893c6b14e910ae8f5dbe25e45b70e9fa97db8c3')

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
