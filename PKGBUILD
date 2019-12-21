# This package is based on libva-intel-driver just with the hybrid codec flag
# Maintainer: DetMittens
# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=libva-intel-driver
pkgver=2.4.0
pkgrel=1
pkgdesc='VA-API implementation for Intel G45 and HD Graphics family'
arch=(x86_64)
url=https://01.org/linuxmedia/vaapi
license=(MIT)
depends=(
  libva
  libdrm
)
makedepends=(
  git
  meson
)
replaces=(libva-driver-intel)
optdepends=('intel-hybrid-codec-driver: Provides codecs with partial HW acceleration')
conflicts=('libva-intel-driver')
provides=('libva-intel-driver')
source=(git+https://github.com/intel/intel-vaapi-driver.git#tag=d595d01d6421eae30824538fa6d150701ed077df)
sha256sums=('SKIP')

pkgver() {
  cd intel-vaapi-driver

  git describe --tags
}

prepare() {
  cd intel-vaapi-driver

  # Only relevant if intel-gpu-tools is installed,
  # since then the shaders will be recompiled
  sed -i '1s/python$/&2/' src/shaders/gpp.py
}

build() {
  arch-meson -Denable_hybrid_codec=true intel-vaapi-driver build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm 644 intel-vaapi-driver/COPYING -t "${pkgdir}"/usr/share/licenses/libva-intel-driver
}

# vim: ts=2 sw=2 et:
