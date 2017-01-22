# $Id: PKGBUILD 196553 2016-11-22 17:47:29Z anthraxx $
# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=xv
pkgver=3.10a
pkgrel=22
pkgdesc="A nice image viewer"
arch=('i686' 'x86_64')
url="http://www.trilon.com/xv/"
license=('custom')
depends=('libpng' 'libx11' 'libtiff' 'jasper')
makedepends=('libxt')
options=('!emptydirs')
source=(ftp://ftp.trilon.com/pub/xv/${pkgname}-${pkgver}.tar.gz \
        http://downloads.sourceforge.net/sourceforge/png-mng/xv-3.10a-jumbo-patches-20070520.tar.gz \
        http://www.sonic.net/~roelofs/code/xv-3.10a-enhancements.20070520-20081216.diff \
        license.txt xv-3.10a-libpng15.patch)
sha1sums=('092f8eb100f16d6b91c88b126c2b2b998eb09b99'
          'd00308c1687d9d803d26ef40c73d19a0f593c626'
          '40bfb0889b820e0f9d3bd7d771144ec3458acc66'
          '4561344e8f2c30eee9c55b14a14f062d89d6e7b7'
          '3d19aa0c6ecc8b554081906babe0b4f9a6946da3')

prepare() {
  tar -cJf xv-${pkgver}-source.tar.xz xv-${pkgver}
  cd ${pkgname}-${pkgver}
  patch -p1 -i "${srcdir}/xv-3.10a-jumbo-fix-enh-patch-20070520.txt"
  patch -p1 -i "${srcdir}/xv-3.10a-enhancements.20070520-20081216.diff"
  patch -p0 -i "${srcdir}/xv-3.10a-libpng15.patch"
}

build() {
  cd ${pkgname}-${pkgver}
  make JP2KLIB=-ljasper
}

package() {
  cd ${pkgname}-${pkgver}
  install -d "${pkgdir}"/usr/{bin,lib,share/man/man1}
  make DESTDIR="${pkgdir}" PREFIX=/usr install
  install -D -m644 "${srcdir}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"

# installing source tarball (to comply with license)
  install -D -m644 "${srcdir}/xv-${pkgver}-source.tar.xz" "${pkgdir}/usr/share/doc/xv/xv-${pkgver}-source.tar.xz"
  ln -s "/usr/share/licenses/${pkgname}/license.txt" "${pkgdir}/usr/share/doc/xv/license.txt"
}
