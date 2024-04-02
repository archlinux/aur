# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: ValHue <vhuelamo at gmail dot com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Daniel Isenmann <daniel@archlinux.org>
pkgname="python2-gimp"
_pkgname="gimp"
pkgver="2.10.36"
pkgrel="1"
pkgdesc='Python 2 plugins support for GIMP'
url='https://www.gimp.org/'
arch=('x86_64')
license=('GPL-3.0-only' 'LGPL-3.0-only')
depends=('gimp<2.99' 'pygtk')
makedepends=('gtk-doc' 'intltool' 'autoconf')
source=("https://download.gimp.org/pub/gimp/v${pkgver%.*}/${_pkgname}-${pkgver}.tar.bz2")
sha512sums=('dbe6152ea6ff99cca59bbf2c88a64fb4ff6b529d98ace7723eadf5dfb0e10d9cbaf2de1e0d5251e9ecf9abca73da9ae1a501f229997802fd4077fb9594f4ba66')



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
    PYTHON=/usr/bin/python2 ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/bin \
        --enable-python \
        --without-aa

    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    make -C plug-ins/pygimp
}

package() {
    cd ${_pkgname}-${pkgver}
    make -C plug-ins/pygimp DESTDIR="${pkgdir}" install
}
