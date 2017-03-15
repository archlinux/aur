# Maintainer: Simon Wilper <sxw@chronowerks.de>

pkgbase=cutelyst
pkgname=('cutelyst' 'cutelyst-docs')
pkgver=1.5.0
pkgrel=1
pkgdesc="A Web Framework built on top of Qt, using the simple approach of Catalyst (Perl) framework."
arch=('i686' 'x86_64')
url="http://cutelyst.org"
license=('LGPL2.1')
depends=('qt5-base' 'uwsgi' 'grantlee')
makedepends=('cmake' 'doxygen' 'graphviz')
source=("https://github.com/cutelyst/cutelyst/archive/v${pkgver}.tar.gz")
md5sums=('ea7c850f34f3bfbe810232abc2158c51')

build() {
  mkdir -p "$srcdir/${pkgname}-${pkgver}/build"
  cd "$srcdir/${pkgname}-${pkgver}"

  # uwsgi expects plugins under lib/uwsgi not lib/uwsgi/plugins
  sed -i.orig -E -e 's@(UWSGI_PLUGINS_DIR) ".+?" (.+)$@\1 "/usr/lib/uwsgi" \2@' CMakeLists.txt

  cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ".."
  make
}

package_cutelyst-docs() {
  pkgdesc="Doxygen HTML API Documentation"
  cd "$srcdir/${pkgbase}-${pkgver}/build"

  make docs

  install -d -m755 ${pkgdir}/usr/share/doc/cutelyst/html/
  install -m644 apidox/* ${pkgdir}/usr/share/doc/cutelyst/html/
}

package_cutelyst() {
  cd "$srcdir/${pkgname}-${pkgver}/build"
  make DESTDIR="$pkgdir/" install
}

