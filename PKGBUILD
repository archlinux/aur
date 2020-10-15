# Maintainer: Alexander Nicholi <me@nicholatian.com>
pkgname=agb-armv4t-eabi-unilib
pkgver=1.2.1
pkgrel=1
epoch=
pkgdesc='unilib, the ANSI C support library (GBA)'
arch=('any')
url="https://github.com/aquefir/$pkgname"
license=('BSD')
depends=()
makedepends=('slick>=1.1.0')
provides=("$pkgname")
conflicts=("$pkgname")
_symver=1.1.0
source=("https://github.com/aquefir/${pkgname#agb-armv4t-eabi-}/archive/v${_symver}-$pkgver.tar.gz")
sha1sums=('SKIP')

_subprojects='arr chkmath decl endian err himem log str'

build() {
  cd "$srcdir/${pkgname#agb-armv4t-eabi-}-${_symver}-$pkgver"
  # install log headers for err circular dependency
  #cd log
  #make install PREFIX="${pkgdir}/usr/agb-armv4t-eabi" TP=GBA
  #cd ..
  for _subproj in ${_subprojects}; do
    cd "${_subproj}"
    make -j$(($(nproc) * 2)) release TP=GBA
    cd ..
  done
}

package() {
  cd "$srcdir/${pkgname#agb-armv4t-eabi-}-${_symver}-$pkgver"

  cd log
  make -i install PREFIX="${pkgdir}/usr/agb-armv4t-eabi" TP=GBA
  cd ..
  for _subproj in ${_subprojects}; do
    cd "${_subproj}"
    make install PREFIX="${pkgdir}/usr/agb-armv4t-eabi" TP=GBA
    cd ..
  done
}
