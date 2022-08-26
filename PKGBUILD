# Maintainer: Wilhelm Schuster <aur [aT] rot13 dot io>

pkgname=klipper-estimator
_pkgname=${pkgname/-/_}
pkgver=2.0.4
pkgrel=1
pkgdesc="A tool for determining the time a print will take on a 3D printer running Klipper firmware"
url="https://github.com/Annex-Engineering/klipper_estimator"
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
license=("custom:MIT")
makedepends=(cargo)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Annex-Engineering/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('de0f3472379f839d0b2b34a98eabc838af5a7ba61160fed7d57e83f94a8b154be2a6e626b262384c197f9423b44628e3a3793caf9edccd34e71faec561f9c217')

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
