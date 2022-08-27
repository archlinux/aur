# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=spice
pkgname=$_pkgname-git
pkgver=0.15.0.93.ga225ebe9
pkgrel=1
pkgdesc='SPICE server'
arch=('x86_64')
url="https://www.spice-space.org"
license=('LGPL2.1')
depends=('pixman' 'opus' 'libjpeg-turbo' 'glib2' 'libsasl' 'lz4')
makedepends=('git' 'meson' 'spice-protocol-git' 'python-six' 'python-pyparsing' 'libcacard')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://gitlab.freedesktop.org/spice/$_pkgname.git"
        "git+https://gitlab.freedesktop.org/spice/spice-common.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
    cd $_pkgname
    git describe --always | sed 's|^v||;s|-|.|g'
}

prepare() {
    cd $_pkgname
    # referring git submodules by relative paths doesn't seem to work in clean chroots
    sed -i "s|url = ..|url = ${srcdir}|;s|.git$||" .gitmodules
    git submodule update --init
}

build() {
    mkdir build
    cd $_pkgname
    arch-meson ../build -D gstreamer=no
    ninja -v -C ../build
}

package() {
    cd $_pkgname
    DESTDIR="${pkgdir}/" ninja -C ../build install
}
