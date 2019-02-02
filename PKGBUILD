# This package is based on libva-intel-driver just with the hybrid codec flag
# Maintainer: DetMittens
# Contributor: Maxime Gauduin <alucryd@archlinux.org> Maintainer of libva-intel-driver in extra
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=libva-intel-driver-hybrid
pkgver=2.3.0
pkgrel=2
pkgdesc='VA-API implementation for Intel G45 and HD Graphics family'
arch=('x86_64')
url='https://01.org/linuxmedia/vaapi'
license=('MIT')
depends=('libva' 'libdrm')
makedepends=('git' 'meson')
replaces=('libva-driver-intel')
optdepends=('intel-hybrid-codec-driver: Provides codecs with partial HW acceleration')
conflicts=('libva-intel-driver')
provides=('libva-intel-driver')
source=("git+https://github.com/intel/intel-vaapi-driver.git#tag=${pkgver}"
        427.patch)
sha256sums=('SKIP'
            'e51eaf65b1bb09bf62a1b78668da0c268722387cb8eb3c05ec2d7462c651d1c0')

prepare() {
  cd intel-vaapi-driver
  # https://github.com/intel/intel-vaapi-driver/issues/419
  patch -Np1 -i ../427.patch

  # Only relevant if intel-gpu-tools is installed,
  # since then the shaders will be recompiled
  sed -i '1s/python$/&2/' src/shaders/gpp.py
  # Fix undefined variable in src/meson.build
  sed -i 's/2.2.0/2.2.0.0/' meson.build
}

build() {
  arch-meson -Denable_hybrid_codec=true intel-vaapi-driver build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm 644 intel-vaapi-driver/COPYING -t "${pkgdir}"/usr/share/licenses/libva-intel-driver-hybrid
}

# vim: ts=2 sw=2 et:
