# Maintainer: Alexander Nicholi <me@nicholatian.com>

pkgname=mingw-w64-unilib
pkgver=1.2.1
pkgrel=1
pkgdesc='unilib, the ANSI C support library (MinGW-W64)'
arch=('any')
url="https://github.com/aquefir/{$pkgname#mingw-w64-}"
license=('BSD')
makedepends=(mingw-w64-gcc)
depends=(mingw-w64-crt)
options=(!libtool !buildflags)
provides=("$pkgname")
conflicts=("$pkgname")
_symver=1.1.0
source=("https://github.com/aquefir/${pkgname#mingw-w64-}/releases/download/v$pkgver/${pkgname#mingw-w64-}-$pkgver.tar.bz2")
source=("https://github.com/aquefir/${pkgname#mingw-w64-}/archive/v${_symver}-$pkgver.tar.gz")
sha1sums=('2f95b63cd63161bcfb11bd5e238978ad4ff02c09')

_subprojects='arr chkmath decl endian err himem log str'

build() {
  cd "$srcdir/${pkgname#mingw-w64-}-${_symver}-$pkgver"

  for _subproj in ${_subprojects}; do
    cd "${_subproj}"
    make -j$(($(nproc) * 2)) release TP=Win64
    cd ..
  done
}

package() {
  cd "$srcdir/${pkgname#mingw-w64-}-${_symver}-$pkgver"

  cd log
  make -i install PREFIX="${pkgdir}/usr/agb-armv4t-eabi" TP=Win64
  cd ..
  for _subproj in ${_subprojects}; do
    cd "${_subproj}"
    make install PREFIX="${pkgdir}/usr/agb-armv4t-eabi" TP=Win64
    cd ..
  done
}
