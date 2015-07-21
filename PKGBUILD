# $Id$
# Original Community Repo
# =======================
# Maintainer: Guillaume ALAUX <guillaume@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: fancris3 <fancris3 at gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

# Modifications to Use Bzr Trunk Source
# =====================================
# Maintainer: James Harvey <jamespharvey20@gmail.com>
#    * This .PKGFILE as closely as possible matches community's terminator 0.97-2

pkgname=terminator-trunk
_pkgname=terminator
pkgver=0.97.r1572
pkgrel=1
pkgdesc='Terminal emulator that supports tabs and grids (bzr trunk developmental version)'
arch=('any')
url='http://gnometerminator.blogspot.fr/p/introduction.html'
license=('GPL2')
# Note: the package named 'vte3' is actually vte for GTK 3
# and terminator seems to require vte for GTK 2
depends=('vte' 'pygtk' 'xdg-utils' 'python2-notify' 'python2-keybinder2')
makedepends=('desktop-file-utils' 'gettext' 'intltool' 'bzr')
provides=('terminator')
conflicts=('terminator')
install=terminator.install
source=("${_pkgname}::bzr+https://code.launchpad.net/~gnome-terminator/terminator/trunk")
md5sums=('SKIP')

pkgver() {
   cd ${srcdir}/${_pkgname}
# If terminator refuses to start for you, uncomment (remove the # on) the line below
   #bzr revert -r1572 > /dev/null 2>&1 && echo 0.97.r1572
# **AND** comment (add a # at the beginning of) the line below
   echo $(tail -n 1 terminatorlib/version.py | sed "s|^APP_VERSION = '||" | sed "s|'$||").r$(bzr revno "${srcdir}/${_pkgname}")
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
