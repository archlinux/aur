# Maintainer: Simon Wilper <sxw@chronowerks.de>

pkgbase=cutelyst
pkgname=('cutelyst' 'cutelyst-docs')
pkgver=3.0.0
pkgrel=1
pkgdesc='A Web Framework built on top of Qt, using the simple approach of Catalyst (Perl) framework.'
arch=('i686' 'x86_64')
url="http://cutelyst.org"
license=('LGPL2.1')
depends=('qt6-base')
makedepends=('pkgconf' 'cmake' 'doxygen' 'graphviz')
source=("https://github.com/cutelyst/cutelyst/archive/v${pkgver}.tar.gz")

build() {
  mkdir -p "$srcdir/${pkgname}-${pkgver}/build"
  cd "$srcdir/${pkgname}-${pkgver}"

  cd build
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DPLUGIN_UWSGI=off \
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
}
sha512sums=('1bb719949caed7ad6cf5f6bf1ace4e4a9531970cc4f1572e19a86913797e871d447790d676777b46baa35d7a5897111cd3f313b1c8a5010e072f2680191e4e7b')
