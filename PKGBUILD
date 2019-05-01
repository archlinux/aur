# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=libva-intel-driver-next-git
_pkgname=libva-intel-driver
pkgver=2.3.0.10.2018.r2639.gce593cf4
pkgrel=1
pkgdesc='VA-API implementation for Intel G45 and HD Graphics family'
arch=('x86_64')
url='https://01.org/linuxmedia/vaapi'
license=('MIT')
depends=('libva' 'libdrm')
makedepends=('git' 'meson')
provides=('libva-intel-driver')
conflicts=('libva-intel-driver')
replaces=('libva-driver-intel')
source=('git+https://github.com/intel/intel-vaapi-driver.git#branch=v2.3-branch')
md5sums=('SKIP')

pkgver() {
    cd intel-vaapi-driver
    _ver="$(cat NEWS | grep -m1 ersion | grep -o "[[:digit:]]*" | paste -sd'.')"
    echo "${_ver}.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"

}

prepare() {
  cd intel-vaapi-driver

  # Only relevant if intel-gpu-tools is installed,
  # since then the shaders will be recompiled
  sed -i '1s/python$/&2/' src/shaders/gpp.py

  # Fix undefined variable in src/meson.build
  sed -i 's/2.2.0/2.2.0.0/' meson.build
}

build() {
  arch-meson intel-vaapi-driver build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm 644 intel-vaapi-driver/COPYING -t "${pkgdir}"/usr/share/licenses/libva-intel-driver
}

