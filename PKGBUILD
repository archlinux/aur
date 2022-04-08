# Maintainer: Simon Wilper <sxw@chronowerks.de>

pkgbase=cutelyst
pkgname=('cutelyst' 'cutelyst-docs')
pkgver=3.3.0
pkgrel=2
pkgdesc='A Web Framework built on top of Qt'
arch=('i686' 'x86_64')
url="http://cutelyst.org"
license=('LGPL')
depends=('qt5-base' 'grantlee')
makedepends=('pkgconf' 'cmake' 'doxygen' 'graphviz' 'qt5-tools')
source=("https://github.com/cutelyst/cutelyst/archive/v${pkgver}.tar.gz")
sha512sums=('d5e65303dbf1c82b88cfc8c0c3c82e88b53b4b8e2bf35f2dc95b04dcf445112122d5eef756c04bfcd20633557c33118e6eec1e8e71d6bda32645f599759d16f4')

build() {
  mkdir -p "$srcdir/${pkgname}-${pkgver}/build"
  cd "$srcdir/${pkgname}-${pkgver}"

  cd build
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DPLUGIN_UWSGI=off \
    -DPLUGIN_VIEW_GRANTLEE=on \
    -DPLUGIN_CSRFPROTECTION=on \
    -DCMAKE_INSTALL_PREFIX=/usr ".."
  make
}

package_cutelyst-docs() {
  pkgdesc="Doxygen HTML API Documentation"
  cd "$srcdir/${pkgbase}-${pkgver}"

  doxygen Cutelyst/cutelyst.doxygen

  install -d -m755 ${pkgdir}/usr/share/doc/cutelyst/html/
  install -d -m755 ${pkgdir}/usr/share/doc/cutelyst/html/search/
  install -m644 html/*.* ${pkgdir}/usr/share/doc/cutelyst/html/
  install -m644 html/search/*.* ${pkgdir}/usr/share/doc/cutelyst/html/search/
}

package_cutelyst() {
  cd "$srcdir/${pkgname}-${pkgver}/build"
  make DESTDIR="$pkgdir/" install

  install -d -m755 "${pkgdir}/usr/share/qtcreator/templates/wizards/"
  cp -r "${srcdir}/${pkgname}-${pkgver}/qtcreator/cutelyst" "${pkgdir}/usr/share/qtcreator/templates/wizards/"
}
