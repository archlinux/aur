# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=mhwaveedit
pkgname="${_pkgname}-git"
pkgver=1.4.24.r149.8a24f6a
pkgrel=1
pkgdesc="A simple and fast GTK2 audio editor (git version)"
arch=('x86_64')
url="https://github.com/magnush/mhwaveedit"
license=('GPL2')
depends=('gtk2' 'hicolor-icon-theme' 'sdl')
makedepends=('alsa-lib' 'git' 'ladspa' 'libpulse' 'libsamplerate' 'libsndfile'
             'jack')
groups=('pro-audio')
provides=("${_pkgname}" "${_pkgname}=${pkgver//.r*/}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://salsa.debian.org/multimedia-team/${_pkgname}.git/")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  local ver=$(grep ^MHW_VERSION configure | cut -d = -f 2)
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"

  ./configure \
    --prefix=/usr \
    --with-double-samples \
    --without-arts \
    --without-esound \
    --without-oss
  make
}

package() {
  depends+=('libasound.so' 'libjack.so' 'libpulse.so' 'libsamplerate.so' 'libsndfile.so')
  cd "${srcdir}/${_pkgname}"

  make DESTDIR="${pkgdir}/" install
}
