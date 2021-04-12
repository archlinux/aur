# Maintainer:  Peter Mattern <pmattern at arcor dot de>

_pkgname=virt-viewer
pkgname=$_pkgname-git
pkgver=9.0.219.g15fbaa3
pkgrel=1
pkgdesc='A lightweight interface for interacting with the graphical display of virtualized guest OS'
arch=('i686' 'x86_64')
url='https://virt-manager.org'
license=('GPL')
depends=('gtk-vnc' 'libvirt-glib' 'spice-gtk' 'gobject-introspection')
makedepends=('git' 'intltool' 'spice-protocol')
provides=("$_pkgname" 'virtviewer')
conflicts=("$_pkgname" 'virtviewer')
source=(
    "git+https://gitlab.com/$_pkgname/$_pkgname.git"
    "drop-header.patch"
    )
sha256sums=(
    "SKIP"
    "SKIP")

pkgver() {
    cd $_pkgname
    git describe --always | sed "s/^v//;s/-/./g"
}

build() {
    cd $_pkgname
    patch -p1 < "${srcdir}/drop-header.patch"
    meson builddir -Dprefix=/usr
    cd builddir
    ninja -j8
}

package() {
    cd $_pkgname/builddir
    meson install --destdir $pkgdir
}
