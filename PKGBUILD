# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: damir <damir@archlinux.org>

_pkgname="mpfr"
pkgname="${_pkgname}-static"
_pkgver=4.2.0
_patchver=9
pkgrel=1
pkgver="${_pkgver}.p${_patchver}"
pkgdesc='Multiple-precision floating-point library'
arch=(x86_64)
url='https://www.mpfr.org/'
license=(GPL3 LGPL3)
depends=(glibc
	 gmp
         "${_pkgname}=${pkgver}")
source=(https://ftp.gnu.org/gnu/mpfr/mpfr-${_pkgver}.tar.xz{,.sig}
        patches.diff) # wget https://www.mpfr.org/mpfr-4.2.0/allpatches -O patches.diff
sha512sums=(
  '58e843125884ca58837ae5159cd4092af09e8f21931a2efd19c15de057c9d1dc0753ae95c592e2ce59a727fbc491af776db8b00a055320413cdcf2033b90505c'
  'SKIP'
  'cb83f38abc6c51590fafc9d0ef28061796ef39bbf911f393291670b4748a733cb5335746b6c166c30e4ddeb6b16c7a2904ee5c28c82b68a1307f42c605083534')
b2sums=(
  'dd88ae3a6a910ad8faeb791b49c3b1085de5d0d4c49c637c124bf4d9bc79fb621d0d1d69e07d0642b9b678f6d355a5830d083dfd189e1e91d0e04c970c10bd64'
  'SKIP'
  'a1f85dba4f0d69c64a76cd2287edc4f05f109a809b28a2b004f40564bed33aaa01bcbca02062a5c0634ef18bc39427679ef9e278e8f1f31aa01fae9912489e86')
validpgpkeys=('07F3DBBECC1A39605078094D980C197698C3739D'
              'A534BE3F83E241D918280AEB5831D11A0D4DB02A') # Vincent Lefevre <vincent@vinc17.net>
options=(debug)

prepare() {
  cd "${_pkgname}-${_pkgver}" || ls

  patch -p1 < "$srcdir"/patches.diff
  autoreconf -fiv
}

build() {
  cd "${_pkgname}-${_pkgver}" || ls
  ./configure --prefix=/usr \
              --enable-thread-safe \
              --enable-static \
              --disable-shared \
              --enable-cxx \
              CFLAGS=-fPIC \
              CPPFLAGS=-DPIC
  make
}

check() {
  cd "${_pkgname}-${_pkgver}" || ls
  make check
  make check-exported-symbols
}

package() {
  cd "${_pkgname}-${_pkgver}" || ls
  make DESTDIR="$pkgdir" install
  rm -rf "${pkgdir}/usr/include"
  rm -rf "${pkgdir}/usr/lib/pkgconfig"
  rm -rf "${pkgdir}/usr/share"
}
