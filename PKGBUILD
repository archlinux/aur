# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=spice-gtk
pkgname=$_pkgname-git
pkgver=0.42.3.g7471e3e
pkgrel=1
pkgdesc='SPICE client library using GLib and GTK+'
arch=('x86_64')
url="https://www.spice-space.org/"
license=('LGPL2.1')
depends=('polkit' 'pixman' 'libcacard' 'libepoxy' 'gtk3' 'opus' 'libjpeg-turbo' 'json-glib' 'phodav' 'gst-plugins-base-libs' 'gobject-introspection'
         'spice-protocol-git' 'usbredir-git')
makedepends=('git' 'meson' 'python-six' 'python-pyparsing' 'vala' 'wayland-protocols')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://gitlab.freedesktop.org/spice/$_pkgname.git"
        "git+https://gitlab.freedesktop.org/spice/spice-common.git"
        "git+https://gitlab.com/keycodemap/keycodemapdb.git")
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd $_pkgname
    git describe --always | sed 's|^v||;s|-|.|g'
}

prepare() {
    cd $_pkgname
    sed -i "3 s|url = ..|url = ${srcdir}|;6 s|url = https://gitlab.com/keycodemap|url = ${srcdir}|;s|.git$||" .gitmodules
    git -c protocol.file.allow=always submodule update --init
}

build() {
    mkdir build
    cd $_pkgname
    arch-meson ../build
    ninja -v -C ../build
}

package() {
    cd $_pkgname
    DESTDIR="${pkgdir}/" ninja -C ../build install
}
