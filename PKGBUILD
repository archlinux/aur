# Maintainer: George Shammas <george@shamm.as>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Guillaume ALAUX <guillaume@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: fancris3 <fancris3 at gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

# Bug report to get these patches upstream and where
# this repository was found:
# https://bugs.launchpad.net/terminator/+bug/1301605


_pkgname=terminator
pkgname="${_pkgname}-tmux-git"
pkgver=r2621.a079048
pkgbase=termiantor-tmux-git
pkgrel=1
pkgdesc='Terminal emulator that supports tabs, grids, and patched with tmux -CC support'
arch=('any')
url='https://gnometerminator.blogspot.com/p/introduction.html'
license=('GPL2')
depends=('gsettings-desktop-schemas' 'libkeybinder3' 'libnotify' 'python2-cairo' 'python2-dbus' 'python2-psutil' 'python2-gobject' 'vte3' 'xdg-utils')
conflits=('terminator' 'terminator-git')
provides=('terminator' 'terminator-git')
makedepends=('intltool')
source=("${_pkgname}::git+git://github.com/manno/terminator.git#branch=tmux"
        "001-custom_commands.patch")
sha512sums=('SKIP'
            'db1e3bbc911afaedd07dae0d34301b15ae28ecec54f7ce10a9c0fd6e2ebd6eaac643e8b6c2a01942f76ba51a41c39eb164fa83e3c78f13ef8441c253a5408d4d')

pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${_pkgname}"

    # python2 fix
    for file in terminatorlib/{,plugins/}*.py; do
        sed -i 's_#!/usr/bin/python_#!/usr/bin/python2_' $file
        sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' $file
    done

    # fix run without gconf
    sed -i 's/except ImportError:/except ValueError:/' terminatorlib/config.py

    # patch the custom commands plugin
    patch -Np1 -i "${srcdir}/001-custom_commands.patch"
}

build() {
    cd "${srcdir}/${_pkgname}"

    python2 setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}"

    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1

    rm -f "${pkgdir}/usr/share/icons/hicolor/icon-theme.cache"
}

