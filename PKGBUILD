# This package is based on libva-intel-driver-g45-h265 just with the hybrid codec flag
pkgname=libva-intel-driver-hybrid-g45-h265
pkgver=2.4.1
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
  xorgproto
)
replaces=(libva-driver-intel)
optdepends=('intel-hybrid-codec-driver: Provides codecs with partial HW acceleration')
conflicts=('libva-intel-driver' 'libva-intel-driver-hybrid')
provides=('libva-intel-driver' 'libva-intel-driver-hybrid')
source=(https://bitbucket.org/alium/g45-h264/downloads/intel-driver-g45-h264-$pkgver.tar.gz)
sha256sums=('SKIP')

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
