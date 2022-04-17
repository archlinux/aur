# Maintainer: Wilhelm Schuster <aur [aT] rot13 dot io>

pkgname=klipper-estimator
_pkgname=${pkgname/-/_}
pkgver=2.0.2
pkgrel=1
pkgdesc="A tool for determining the time a print will take on a 3D printer running Klipper firmware"
url="https://github.com/Annex-Engineering/klipper_estimator"
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
license=("custom:MIT")
makedepends=(cargo)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Annex-Engineering/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('ae791d032a91df55faec7db22fd2a00aeb74f8b4e95a001ef729d07caa2310d9ae74d9b715535c14449671619bdcf02b23211cadfb8a66b7df9915db5a4af707')

prepare() {
  cd "$_pkgname-$pkgver"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  # The build expects git metadata to generate version string, building from
  # .tar.gz we don't have that so fall back onto defining an environment
  # variable.
  export TOOL_VERSION=${pkgver}
  cargo build --frozen --release --all-features
}

package() {
  cd "$_pkgname-$pkgver"

  install -Dm755 target/release/$_pkgname -T "${pkgdir}/usr/bin/$pkgname"
  install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 compat/CuraPostProcessing/KlipperEstimator.py "${pkgdir}/usr/lib/cura/plugins/PostProcessingPlugin/scripts/KlipperEstimator.py"
}
