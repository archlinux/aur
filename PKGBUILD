# Maintainer: aarto <aarto@aur.archlinux.org>
pkgname=limbo
pkgver=0.0.9
pkgrel=1
pkgdesc='Limbo is a work-in-progress, in-process OLTP database management system, compatible with SQLite.'
url='https://github.com/tursodatabase/limbo'
license=('MIT')
arch=('x86_64')
makedepends=(cargo mimalloc)
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://github.com/tursodatabase/limbo/releases/download/v$pkgver/source.tar.gz")
sha256sums=('25f459dff33b4bafc4bc2f6e9fd05193a78faf5b079745620b69c5ef9f44ec67')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export RUSTFLAGS='-l mimalloc'
    cargo build --frozen --release -p limbo
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
