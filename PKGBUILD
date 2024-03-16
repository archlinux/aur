# Maintainer: Wilhelm Schuster <aur [aT] rot13 dot io>

pkgname=klipper-estimator
_pkgname=${pkgname/-/_}
pkgver=3.7.0
pkgrel=1
pkgdesc="A tool for estimating the time a print will take on a 3D printer running Klipper firmware"
url="https://github.com/Annex-Engineering/klipper_estimator"
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
license=("custom:MIT")
options=("!lto")
makedepends=(cargo)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Annex-Engineering/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('a6b8030e9da20a8d0e49e35107b9f4960ba7722d962f91f2eef24e4b61a1119f80d35274eef47edaa1ca21ee0815ecc7c0a16e297732d82275af02859ad51da5')

prepare() {
  cd "$_pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable

  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  # The build expects git metadata to generate the version string, but building
  # from .tar.gz we don't have that so fall back onto defining it via an
  # environment variable.
  export TOOL_VERSION=${pkgver}
  cargo build --frozen --release --all-features
}

package() {
  cd "$_pkgname-$pkgver"

  install -Dm0755 target/release/$_pkgname -T "${pkgdir}/usr/bin/$pkgname"
  install -Dm0644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm0644 compat/CuraPostProcessing/KlipperEstimator.py "${pkgdir}/usr/lib/cura/plugins/PostProcessingPlugin/scripts/KlipperEstimator.py"
  install -Dm0755 contrib/klipper_estimator.sh "${pkgdir}/usr/share/klipper-estimator/contrib/klipper_estimator.sh"
}
