# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Thomas Crescenzi <xsq1104 at aol dot com>

set -u
pkgname='kat5200'
pkgver='0.8.0'
pkgrel='1'
pkgdesc='an emulator for the Atari 5200 console and Atari 8-bit computers'
arch=('i686' 'x86_64')
url='http://kat5200.jillybunch.com/'
license=('GPL')
depends=('zlib' 'sdl2' 'sdl2_image' 'guichan')
_verwatch=("${url}downloads.html" '\s\+Version\s\([0-9\.]\+\)\s*' 'f')
#_verwatch[1]='\s\+<li><a href="downloads/kat5200-\([0-9\.]\+\)\.tar\.gz.*'
source=("${url}downloads/${pkgname}-${pkgver}.tar.gz")
sha256sums=('8292910fe30a3868dc52a293b35c8873d72c13cbd80200d9d389da9ace199b2b')

prepare() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  #CPPFLAGS="${CPPFLAGS} -I/usr/include/SDL" \ # 0.6.3
  ./configure --prefix='/usr'
  set +u
}

build() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  local _nproc="$(nproc)"; _nproc=$((_nproc>8?8:_nproc))
  nice make -s -j "${_nproc}"
  set +u
}

check() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -j1 -k check
  set +u
}

package() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  #make prefix=${pkgdir}/usr install
  make -j1 DESTDIR="${pkgdir}" install
  set +u
}
set +u

# vim:set ts=2 sw=2 et:
