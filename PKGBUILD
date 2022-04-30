# Maintainers: James Spencer <james.s.spencer@gmail.com>
#              Darjan Krijan <darjan_krijan@gmx.de>

pkgname=cubegui
_version=4.7
_patch=
pkgver=${_version}${_patch}
pkgrel=1
pkgdesc="Performance report explorer for displaying a multi-dimensional performance space."
arch=('i686' 'x86_64')
url="http://www.scalasca.org/software/cube-4.x/download.html"
license=('BSD')
depends=('qt5-base' 'cubelib=4.7')
options=('staticlibs')
source=(http://apps.fz-juelich.de/scalasca/releases/cube/${_version}/dist/${pkgname}-${pkgver}.tar.gz)
md5sums=('c99da41343348d13abab0832503f24b4')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -e "s/mksec/µs/g" -e "s/\([a-z]\)sec/\1s/g" -i src/GUI-qt/display/PrecisionWidget.cpp
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  sed -i -e 's/--as-needed,//' Makefile build-frontend/Makefile
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
