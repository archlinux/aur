# $Id$
# Original Community Repo Maintainer: Guillaume ALAUX <guillaume@archlinux.org>
# Original Community Repo Contributor: Allan McRae <allan@archlinux.org>
# Original Community Repo Contributor: fancris3 <fancris3 at gmail.com>
# Original Community Repo Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Modifications to use trunk source Maintainer: James Harvey <jamespharvey20@gmail.com>

pkgname=terminator-trunk
_pkgname=terminator
pkgver=1568
pkgrel=1
pkgdesc='Terminal emulator that supports tabs and grids (trunk developmental version)'
arch=('any')
url='http://gnometerminator.blogspot.fr/p/introduction.html'
license=('GPL2')
# Note: the package named 'vte3' is actually vte for GTK 3
# and terminator seems to require vte for GTK 2
depends=('vte' 'pygtk' 'xdg-utils' 'python2-notify' 'python2-keybinder2')
makedepends=('bzr' 'desktop-file-utils' 'gettext' 'intltool')
provides=('terminator')
conflicts=('terminator')
install=terminator.install
source=("${_pkgname}::bzr+https://code.launchpad.net/~gnome-terminator/terminator/trunk")
md5sums=('SKIP')

pkgver() {
   bzr revno "${srcdir}/${_pkgname}"
}

build() {
    cd "${srcdir}/${_pkgname}"

    # python2 fix
    for file in terminatorlib/{,plugins/}*.py; do
        sed -i 's_#!/usr/bin/python_#!/usr/bin/python2_' $file
        sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' $file
    done

    python2 setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}"

    python2 setup.py install --skip-build --root="${pkgdir}"

    rm -f "${pkgdir}/usr/share/icons/hicolor/icon-theme.cache"
}
