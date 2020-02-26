# Maintainer: Simon Wilper <sxw@chronowerks.de>

pkgbase=cutelyst
pkgname=('cutelyst' 'cutelyst-docs')
pkgver=2.10.0
pkgrel=1
pkgdesc="A Web Framework built on top of Qt, using the simple approach of Catalyst (Perl) framework."
arch=('i686' 'x86_64')
url="http://cutelyst.org"
license=('LGPL2.1')
depends=('qt5-base' 'grantlee' 'uwsgi')
makedepends=('pkgconf' 'cmake' 'doxygen' 'graphviz')
source=("https://github.com/cutelyst/cutelyst/archive/v${pkgver}.tar.gz")
sha512sums=('51c792394049740c491cc469a1897da2dfa5dc8d31320adc2fabef82dadf687cb8667624cd1a24621140b90692bed8684d545a4397fd85485416b5dcccff881f')

build() {
  mkdir -p "$srcdir/${pkgname}-${pkgver}/build"
  cd "$srcdir/${pkgname}-${pkgver}"

  cd build
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DPLUGIN_UWSGI=on \
    -DPLUGIN_VIEW_GRANTLEE=on \
    -DPLUGIN_CSRFPROTECTION=on \
    -DCMAKE_INSTALL_PREFIX=/usr ".."
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
