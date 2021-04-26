# Maintainer: Cebtenzzre <cebtenzzre (AT) gmail (DOT) com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Blisfull <narthana.epa@gmail.com>
# Contributor: SahibBommelig <sahib@online.de>

_pkgname=rmlint
pkgbase=${_pkgname}-develop-git
pkgname=(rmlint-develop-git rmlint-shredder-develop-git)
pkgver=2.10.1.r210.g1ab4d8ae
pkgrel=1
url="https://github.com/sahib/rmlint"
license=('GPL3')
arch=('x86_64')
makedepends=('binutils' 'dconf' 'desktop-file-utils' 'gettext' 'git'
             'gtksourceview3' 'json-glib' 'libelf' 'librsvg' 'python-cairo'
             'python-gobject' 'python-requests' 'python-sphinx' 'scons'
             'util-linux-libs' 'xdg-utils')
provides=("${_pkgname}=${pkgver}")
conflicts=("$_pkgname")
source=("git+https://github.com/sahib/${_pkgname}.git#branch=develop")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"
    scons config
    scons -j4 DEBUG=1 --prefix="$pkgdir"/usr --actual-prefix=/usr
}

package_rmlint-develop-git() {
    pkgdesc="Tool to remove duplicates and other lint, being much faster than fdupes"
    depends=('binutils' 'json-glib' 'libelf' 'util-linux-libs')

    cd "$_pkgname"
    scons DEBUG=1 --prefix="$pkgdir"/usr install --actual-prefix=/usr

    rm -rf "$pkgdir"/usr/share/{glib-2.0,icons,applications}
    rm -rf "$pkgdir"/usr/lib
}

package_rmlint-shredder-develop-git() {
    pkgdesc="Graphical user interface for rmlint"
    depends=('dconf' 'gtksourceview3' 'librsvg' 'python-cairo' 'python-gobject'
             'rmlint-develop-git' 'xdg-utils')

    cd "$_pkgname"
    scons DEBUG=1 --prefix="$pkgdir"/usr install --actual-prefix=/usr

    rm -rf "$pkgdir"/usr/{bin,share/locale,share/man}
    rm "$pkgdir"/usr/share/glib-2.0/schemas/gschemas.compiled
}
