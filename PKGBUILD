# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
_pkgname='Smriti'
pkgname='smriti'
pkgver=1.0.0
pkgrel=2
pkgdesc='Keep track of the commands your memory missed'
arch=('x86_64')
url="https://github.com/aspasht/$pkgname"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8737b248cd1b12413a7589c820dd280f14e84c1eaa806a752134e48fd1633683')
makedepends=('rustup' 'glibc' 'gcc-libs')
depends=('sqlite')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    mv "$_pkgname-$pkgver" "$pkgname-$pkgver"
    cd "$pkgname-$pkgver"
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$pkgname-$pkgver"
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname"
    install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$_pkgname"
}
