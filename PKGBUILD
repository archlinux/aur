# Maintainer: 99oblivius <99oblivius at proton dot me>
pkgname=spacecal-for-monado
pkgver=1.0.0
pkgrel=1
pkgdesc="VR Tracking Space Calibrator for Monado/WiVRn"
arch=('x86_64' 'aarch64')
url="https://github.com/99oblivius/spacecal-for-monado"
license=('GPL-3.0-only')
depends=('gtk4' 'libadwaita' 'openxr' 'monado')
makedepends=('cargo' 'git')
optdepends=('libcanberra: audio feedback during calibration')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bb6950f184c4252830afb93068b2c90a09272829ddc796b13d74b3f73c58efb4')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --lib --frozen
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
