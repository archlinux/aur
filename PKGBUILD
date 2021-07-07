# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
# Contributor: Simon Wilper <sxw@chronowerks.de>

pkgbase=cutelyst2-qt5
pkgname=('cutelyst2-qt5' 'cutelyst2-docs')
_realname=cutelyst
pkgver=2.14.2
pkgrel=1
pkgdesc='A Web Framework built on top of Qt, using the simple approach of Catalyst (Perl) framework.'
arch=('i686' 'x86_64')
url="http://cutelyst.org"
license=('LGPL2.1')
depends=('qt5-base' 'grantlee' 'uwsgi')
makedepends=('pkgconf' 'cmake' 'doxygen' 'graphviz')
source=("https://github.com/cutelyst/cutelyst/archive/v${pkgver}.tar.gz")

build() {
  mkdir -p "$srcdir/${_realname}-${pkgver}/build"
  cd "$srcdir/${_realname}-${pkgver}/build"

  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DPLUGIN_UWSGI=on \
    -DPLUGIN_VIEW_GRANTLEE=on \
    -DPLUGIN_CSRFPROTECTION=on \
    -DCMAKE_PREFIX_PATH=/usr/lib/cmake/Qt5/ \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ".."
  make
}

package_cutelyst2-docs() {
  pkgdesc="Doxygen HTML API Documentation"
  cd "$srcdir/${_realname}-${pkgver}"

  doxygen Cutelyst/cutelyst.doxygen

  install -d -m755 ${pkgdir}/usr/share/doc/cutelyst2/html/
  install -d -m755 ${pkgdir}/usr/share/doc/cutelyst2/html/search/
  install -m644 html/*.* ${pkgdir}/usr/share/doc/cutelyst2/html/
  install -m644 html/search/*.* ${pkgdir}/usr/share/doc/cutelyst2/html/search/
}

package_cutelyst2-qt5() {
  cd "$srcdir/${_realname}-${pkgver}/build"
  make DESTDIR="$pkgdir/" install
}

sha512sums=('3e192bb9d1925896e05488d7867bd36845d2fb0276fa4725ac841526095628994a339b1b92b6a9615d71788f01bb68af92ae131a55ce3aa6774f840fc80540ee')
