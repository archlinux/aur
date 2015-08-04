# $Id$
# Original Community Repo
# =======================
# Maintainer: Guillaume ALAUX <guillaume@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: fancris3 <fancris3 at gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

# Modifications to Use Bzr Trunk Source, and Maintainer Modifications
# ===================================================================
# Maintainer: James Harvey <jamespharvey20@gmail.com>
#    * This .PKGFILE as closely as possible matches community's terminator 0.97-2



# This PKGBUILD tracks terminator-trunk's PKGBUILD, which has no modifications by this maintainer
# All modifications are performed by optional patches, which are configured in the next lines to be applied, but can be turned off by commenting (adding a # at the beginning of) the lines below
# These modifications were rejected by upstream, despite bringing terminator toward expected behavior

# Upstream has middle mouse paste, and right mouse open context menu.
# This patch reverses these
_install_middle_mouse_patch=1



pkgname=terminator-trunk-mod
_pkgname=terminator
pkgver=0.97.r1589
pkgrel=1
pkgdesc='Terminal emulator that supports tabs and grids (bzr trunk, maintainer mods'
arch=('any')
url='http://gnometerminator.blogspot.fr/p/introduction.html'
license=('GPL2')
# Note: the package named 'vte3' is actually vte for GTK 3
# and terminator seems to require vte for GTK 2
depends=('vte' 'pygtk' 'xdg-utils' 'python2-notify' 'python2-keybinder2')
makedepends=('desktop-file-utils' 'gettext' 'intltool' 'bzr')
provides=('terminator')
conflicts=('terminator' 'terminator-trunk')
install=terminator.install
source=("${_pkgname}::bzr+https://code.launchpad.net/~gnome-terminator/terminator/trunk"
        'middle_mouse.patch')
md5sums=('SKIP'
         'ca634c424ff4b4fa174e17d46f81e863')

pkgver() {
   cd ${srcdir}/${_pkgname}
   echo $(tail -n 1 terminatorlib/version.py | sed "s|^APP_VERSION = '||" | sed "s|'$||").r$(bzr revno "${srcdir}/${_pkgname}")
}

prepare() {
   cd ${srcdir}/${_pkgname}
   if [ -n "$_install_middle_mouse_patch" ]; then
      echo "Installing middle_mouse.patch..."
      patch -p1 -i ${srcdir}/middle_mouse.patch
   else
      echo "NOT installing middle_mouse.patch"
   fi
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
