# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=seq66
pkgname="${_pkgname}-git"
pkgver=0.98.3.r773.0e0722f6
pkgrel=1
pkgdesc="A live-looping sequencer with an Qt graphical interface (git version)"
arch=('i686' 'x86_64')
url="https://github.com/ahlstromcj/seq66"
license=('GPL2')
depends=('qt5-base')
makedepends=('git' 'alsa-lib' 'jack' 'liblo')
groups=('pro-audio')
provides=("${_pkgname}" "${_pkgname}=${pkgver//.r*/}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/ahlstromcj/${_pkgname}.git"
        'seq66-destdir.patch')
md5sums=('SKIP'
         'b0acb87040cef1ff9ddaff9154be6632')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  local ver=$(tail -n 1 VERSION)
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  # some install commands do not respect DESTDIR properly
  patch -p1 -r -N -i "${srcdir}"/seq66-destdir.patch
}

build() {
  cd "${srcdir}/${_pkgname}"

  ./bootstrap
  ./configure --prefix=/usr --enable-rtmidi
  make
}

package() {
  depends+=('libasound.so' 'libjack.so' 'liblo.so')
  cd "${srcdir}/${_pkgname}"

  make DESTDIR="${pkgdir}" install
}
