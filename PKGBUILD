# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=spice-gtk
pkgname="${_pkgname}"-git
pkgver=0.42.3.g7471e3e
pkgrel=1
pkgdesc='SPICE client library using GLib and GTK+'
arch=('x86_64' 'aarch64')
url='https://www.spice-space.org/'
license=('LGPL-2.1-only')
depends=('libepoxy' 'phodav' 'libcacard' 'gst-plugins-base-libs' 'gtk3' 'json-glib' 'libjpeg-turbo' 'pixman' 'opus'
         'spice-protocol-git' 'usbredir-git')
makedepends=('git' 'meson' 'vala' 'wayland-protocols' 'python-pyparsing' 'glib2-devel' 'gobject-introspection' 'gi-docgen')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://gitlab.freedesktop.org/spice/${_pkgname}.git"
        "git+https://gitlab.freedesktop.org/spice/spice-common.git"
        "git+https://gitlab.com/keycodemap/keycodemapdb.git")
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd ${_pkgname}
    git describe --always | sed 's|^v||;s|-|.|g'
}

prepare() {
    cd ${_pkgname}
    git submodule init
    git submodule set-url subprojects/spice-common "${srcdir}"/spice-common
    git submodule set-url subprojects/keycodemapdb "${srcdir}"/keycodemapdb
    git -c protocol.file.allow=always submodule update subprojects/spice-common subprojects/keycodemapdb
}

build() {
    rm -Rf build && mkdir build
    cd ${_pkgname}
    arch-meson ../build
    ninja -v -C ../build
}

package() {
    cd ${_pkgname}
    DESTDIR="${pkgdir}/" ninja -C ../build install
}
