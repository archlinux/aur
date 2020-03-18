# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Daniel Isenmann <daniel@archlinux.org>

pkgname=python2-gimp
_pkgname=gimp
pkgver=2.10.18
pkgrel=1
pkgdesc='Python 2 plugins support for GIMP'
url='https://www.gimp.org/'
arch=('x86_64')
license=('LGPL')
depends=('gimp' 'pygtk')
makedepends=('gtk-doc' 'intltool')
source=(https://download.gimp.org/pub/gimp/v${pkgver%.*}/${_pkgname}-${pkgver}.tar.bz2)
sha256sums=('65bfe111e8eebffd3dde3016ccb507f9948d2663d9497cb438d9bb609e11d716')

prepare() {
  cd ${_pkgname}-${pkgver}
  sed -i 's/^libgimpui = .*/ libgimpui = -lgimpui-2.0/
          s/^libgimpconfig = .*/ libgimpconfig = -lgimpconfig-2.0/
          s/^libgimpwidgets = .*/ libgimpwidgets = -lgimpwidgets-2.0/
          s/^libgimp = .*/ libgimp = -lgimp-2.0/
          s/^libgimpcolor = .*/ libgimpcolor = -lgimpcolor-2.0/
          s/^libgimpbase = .*/ libgimpbase = -lgimpbase-2.0/
          s/^libgimpmath = .*/ libgimpmath = -lgimpmath-2.0/
          s/^libgimpthumb = .*/ libgimpthumb = -lgimpthumb-2.0/' plug-ins/pygimp/Makefile.am
  autoreconf -fi  
}

build() {
  cd ${_pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/bin \
    --enable-python
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make -C plug-ins/pygimp
}

package() {
  cd ${_pkgname}-${pkgver}
  make -C plug-ins/pygimp DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
