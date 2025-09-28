# Maintainer: Andrea Oggioni <AOggioni530@gmail.com>
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: damir <damir@archlinux.org>

_pkgname="mpfr"
pkgname="${_pkgname}-static"
_pkgver=4.2.2
pkgrel=1
pkgver="${_pkgver}"
pkgdesc='Multiple-precision floating-point library'
arch=(x86_64)
url='https://www.mpfr.org/'
license=(GPL3 LGPL3)

depends=(glibc
         gmp
	       ${_pkgname})

source=(https://ftp.gnu.org/gnu/mpfr/mpfr-${_pkgver}.tar.xz{,.sig})

sha512sums=(
  'eb9e7f51b5385fb349cc4fba3a45ffdf0dd53be6dfc74932dc01258158a10514667960c530c47dd9dfc5aa18be2bd94859d80499844c5713710581e6ac6259a9'
  'SKIP')

b2sums=(
  '6bbf5658e70fbb673a3b65246a6bac708d1571aa6943c6742efd92f468ac71e6f0fe351b757f7133440ea312d9a5fc3549acd89d54f4d975c58bdc204d7b21ec'
  'SKIP')

validpgpkeys=('07F3DBBECC1A39605078094D980C197698C3739D'
              'A534BE3F83E241D918280AEB5831D11A0D4DB02A') # Vincent Lefevre <vincent@vinc17.net>

options=(debug)

prepare() {
  cd "${_pkgname}-${_pkgver}" || ls

  # patch -p1 < "$srcdir"/patches.diff
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
