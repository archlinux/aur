# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: damir <damir@archlinux.org>

_pkgname="mpfr"
pkgname="${_pkgname}-static"
_pkgver=4.1.1
_patchver=1
pkgrel=1
pkgver="${_pkgver}.p${_patchver}"
#pkgver=$_pkgver
pkgdesc='Multiple-precision floating-point library'
arch=(x86_64)
url='https://www.mpfr.org/'
license=(GPL3 LGPL3)
depends=(glibc gmp)
source=(https://ftp.gnu.org/gnu/mpfr/mpfr-${_pkgver}.tar.xz{,.sig}
        patches.diff) # wget https://www.mpfr.org/mpfr-4.1.1/allpatches -O patches.diff
sha512sums=('be468749bd88870dec37be35e544983a8fb7bda638eb9414c37334b9d553099ea2aa067045f51ae2c8ab86d852ef833e18161d173e414af0928e9a438c9b91f1'
            'SKIP'
            'aa98173d59a24d0f59acff0c2143db5623746db3f6445e300a018a124b35a6b57d631c357a9a890f23c748591f621a95d3a801bed7341b6c8b6ddcc86ecfb107')
b2sums=('ce20baee2f060acb28b877ffe6fc40c5619cf6af231bd54ca6cfb3e42ef2d74a4ffbab96cf0b5dd6a162e558099a54701d42f34f5bf2256f256fe6f5ae2505d0'
        'SKIP'
        'd6bed1d6fca2319db457096a81aca060c1bd934fcdf9c5f98ba44920a7e97c2a5e9c539ec554feb723fb98c84096e1cb615c0d973133c67f3c2097edc1c5b803')
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
