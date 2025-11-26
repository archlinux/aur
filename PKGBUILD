# Maintainer: Simon Wilper <sxw@chronowerks.de>

pkgbase=cutelyst
pkgname=('cutelyst' 'cutelyst-docs')
pkgver=5.0.1
pkgrel=1
pkgdesc='A Web Framework built on top of Qt'
arch=('i686' 'x86_64')
url="http://cutelyst.org"
license=('LGPL')
depends=('qt6-base')
makedepends=('pkgconf' 'cmake' 'doxygen' 'graphviz' 'qt6-tools')
source=("https://github.com/cutelyst/cutelyst/archive/v${pkgver}.tar.gz")

build() {
  mkdir -p "$srcdir/${pkgname}-${pkgver}/build"
  cd "$srcdir/${pkgname}-${pkgver}"

  cd build
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
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
sha256sums=('38c059da13bfd1d0002eafb033e2d4a452b644f6a0c6cb909acad3495b31bd23')
