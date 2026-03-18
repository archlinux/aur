# Maintainer: 99oblivius <99oblivius at proton dot me>
pkgname=spacecal-for-monado
pkgver=1.0.0
pkgrel=2
pkgdesc="VR Tracking Space Calibrator for Monado/WiVRn"
arch=('x86_64' 'aarch64')
url="https://github.com/99oblivius/spacecal-for-monado"
license=('GPL-3.0-only')
depends=('gtk4' 'libadwaita' 'openxr' 'monado')
makedepends=('cargo' 'git')
optdepends=('libcanberra: audio feedback during calibration')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('41cf4076d2fb37ac12f0fdd9c27b4e86147ab326115f9c83cf7bad257cd05c8f')

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
