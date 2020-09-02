# Maintainer: Simon Wilper <sxw@chronowerks.de>

pkgbase=cutelyst
pkgname=('cutelyst' 'cutelyst-docs')
pkgver=2.12.0
pkgrel=1
pkgdesc="A Web Framework built on top of Qt, using the simple approach of Catalyst (Perl) framework."
arch=('i686' 'x86_64')
url="http://cutelyst.org"
license=('LGPL2.1')
depends=('qt5-base' 'grantlee' 'uwsgi')
makedepends=('pkgconf' 'cmake' 'doxygen' 'graphviz')
source=("https://github.com/cutelyst/cutelyst/archive/v${pkgver}.tar.gz")
sha512sums=('435c165a9cf83a7c3f21a60d29c3435b170da8030960217fe2e8f2b324c5dc1be46e3d878b2448beaef8d290ff15b59463c4589614d9e509d4583f279e0b393a')

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
  cd "$srcdir/${pkgbase}-${pkgver}/Cutelyst"

  doxygen cutelyst.doxygen

  install -d -m755 ${pkgdir}/usr/share/doc/cutelyst/html/
  install -d -m755 ${pkgdir}/usr/share/doc/cutelyst/html/search/
  install -m644 html/*.* ${pkgdir}/usr/share/doc/cutelyst/html/
  install -m644 html/search/*.* ${pkgdir}/usr/share/doc/cutelyst/html/search/
}

package_cutelyst() {
  cd "$srcdir/${pkgname}-${pkgver}/build"
  make DESTDIR="$pkgdir/" install
}
