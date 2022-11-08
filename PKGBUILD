# Maintainer: Wilhelm Schuster <aur [aT] rot13 dot io>

pkgname=klipper-estimator
_pkgname=${pkgname/-/_}
pkgver=3.0.0
pkgrel=1
pkgdesc="A tool for estimating the time a print will take on a 3D printer running Klipper firmware"
url="https://github.com/Annex-Engineering/klipper_estimator"
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
license=("custom:MIT")
makedepends=(cargo)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Annex-Engineering/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('951af6dc4a02a36d9675aab297bc47ea20e915467dc97e2cfa018d2fa8c1b1fc39f5355e1f06c36d092d431977b7ee8bb4894a076cba7ca01191a28e1d6867c4')

prepare() {
  cd "$_pkgname-$pkgver"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  # The build expects git metadata to generate the version string, but building
  # from .tar.gz we don't have that so fall back onto defining an environment
  # variable.
  export TOOL_VERSION=${pkgver}
  cargo build --frozen --release --all-features
}

package() {
  cd "$_pkgname-$pkgver"

  install -Dm755 target/release/$_pkgname -T "${pkgdir}/usr/bin/$pkgname"
  install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 compat/CuraPostProcessing/KlipperEstimator.py "${pkgdir}/usr/lib/cura/plugins/PostProcessingPlugin/scripts/KlipperEstimator.py"
  install -Dm755 contrib/klipper_estimator.sh "${pkgdir}/usr/share/klipper-estimator/contrib/klipper_estimator.sh"
}
