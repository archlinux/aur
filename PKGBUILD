# Maintainer: Simon Wilper <sxw@chronowerks.de>

pkgbase=cutelyst
pkgname=('cutelyst' 'cutelyst-docs')
pkgver=3.5.0
pkgrel=1
pkgdesc='A Web Framework built on top of Qt'
arch=('i686' 'x86_64')
url="http://cutelyst.org"
license=('LGPL')
depends=('qt5-base' 'grantlee')
makedepends=('pkgconf' 'cmake' 'doxygen' 'graphviz' 'qt5-tools')
source=("https://github.com/cutelyst/cutelyst/archive/v${pkgver}.tar.gz")

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
sha512sums=('6b31b2e0d4e975805218762d24b0ee670ba5daed5616e8928f6ec8340410256dcd311789a7462b656565f1d59e9d94ac59b0bbdbca9f104ddb0c3c4a7b815601')
