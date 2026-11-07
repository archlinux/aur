# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=spice
pkgname="${_pkgname}"-git
pkgver=0.15.1.1.ga5d1d957
pkgrel=1
pkgdesc='SPICE server'
arch=('x86_64' 'aarch64')
url='https://www.spice-space.org'
license=('LGPL-2.1-only')
depends=('pixman' 'gst-plugins-base-libs' 'opus' 'libjpeg-turbo')
makedepends=('git' 'meson' 'python-pyparsing' 'glib2-devel' 'libcacard' 'spice-protocol-git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://gitlab.freedesktop.org/spice/${_pkgname}.git"
        "git+https://gitlab.freedesktop.org/spice/spice-common.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
    cd ${_pkgname}
    git describe --always | sed 's|^v||;s|-|.|g'
}

prepare() {
    cd ${_pkgname}
    git submodule init
    git submodule set-url subprojects/spice-common "${srcdir}"/spice-common
    git -c protocol.file.allow=always submodule update subprojects/spice-common
}

build() {
    rm -Rf build && mkdir build
    cd ${_pkgname}
    arch-meson ../build
    ninja -v -C ../build
}

package() {
    cd ${_pkgname}
    DESTDIR="${pkgdir}"/ ninja -C ../build install
}
