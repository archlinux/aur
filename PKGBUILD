# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=seq66
pkgname="${_pkgname}-git"
pkgver=0.99.0.r0.g3102ace6
pkgrel=1
pkgdesc="A live-looping sequencer with a Qt graphical interface (git version)"
arch=('i686' 'x86_64')
url="https://github.com/ahlstromcj/seq66"
license=('GPL2')
depends=('qt5-base')
makedepends=('git' 'alsa-lib' 'jack' 'liblo')
groups=('pro-audio')
provides=("${_pkgname}" "${_pkgname}=${pkgver//.r*/}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/ahlstromcj/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  local ver=$(tail -n 1 VERSION)

  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${_pkgname}"

  ./bootstrap
  ./configure --prefix=/usr --enable-rtmidi
  make -j $[$(nproc) - 1]
}

package() {
  depends+=('libasound.so' 'libjack.so' 'liblo.so')
  cd "${srcdir}/${_pkgname}"

  make DESTDIR="${pkgdir}" install
}
