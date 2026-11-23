# Maintainer: Adrian Valcarcel-Schott <avalsch at pm dot me>

pkgname=schemat
pkgver=0.5.15
pkgrel=1
pkgdesc='Code formatter for Scheme, Lisp, and any S-expressions'
arch=('x86_64' 'aarch64')
url='https://github.com/raviqqe/schemat'
license=('Unlicense')
depends=('glibc' 'libgcc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('7ac1cc9df09a8ab425098cdc48c8942dd0bf3db24510ed2a487139c6959ea3f7cffa27c06f681fc9102be5d33460bfa18ebea925510308a49dd9c93db9b964eb')

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
