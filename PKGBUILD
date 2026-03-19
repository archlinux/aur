# Maintainers: James Spencer <james.s.spencer@gmail.com>
#              Darjan Krijan [https://disc-kuraudo.eu]

pkgname=cubegui
_version=4.9
_patch=.1
pkgver=${_version}${_patch}
pkgrel=1
pkgdesc="Performance report explorer for displaying a multi-dimensional performance space."
arch=('i686' 'x86_64')
url="http://www.scalasca.org/software/cube-4.x/download.html"
license=('BSD')
depends=('qt5-base' "cubelib>=${pkgver}")
options=('staticlibs')
source=(http://apps.fz-juelich.de/scalasca/releases/cube/${_version}/dist/${pkgname}-${pkgver}.tar.gz)
md5sums=('2fc831a9ac771fcd044a4de9c427972a')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -e "s/mksec/µs/g" -e "s/\([a-z]\)sec/\1s/g" -i src/GUI-qt/display/PrecisionWidget.cpp
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --with-qt=/usr/bin
  sed -i -e 's/--as-needed,//' Makefile build-frontend/Makefile
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
