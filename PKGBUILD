# Maintainer: Wilhelm Schuster <aur [aT] rot13 dot io>

pkgname=klipper-estimator
_pkgname=${pkgname/-/_}
pkgver=3.7.3
pkgrel=1
pkgdesc="A tool for estimating the time a print will take on a 3D printer running Klipper firmware"
url="https://github.com/Annex-Engineering/klipper_estimator"
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
license=("custom:MIT")
options=("!lto")
makedepends=(cargo)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Annex-Engineering/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('b1f1c324d9ba2946f30afb6f2c0d47f242da5088bcbba37ddf992106843033ef6e93eb8110512e1634d682b8181642a815c45e7662fab52082ab00956d025fea')

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
