# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=spice
pkgname=$_pkgname-git
pkgver=0.15.0.78.gb24e2ea6
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
        "git+https://gitlab.freedesktop.org/spice/spice-common.git"
        'spice-common_detect-pyparsing.patch')
sha256sums=('SKIP'
            'SKIP'
            'ae77744c7df2805b0c9fd248be4c03b1a685165c08da112a5a41eaab8454f962')

pkgver() {
    cd $_pkgname
    git describe --always | sed 's|^v||;s|-|.|g'
}

prepare() {
    cd $_pkgname
    # referring git submodules by relative paths doesn't seem to work in clean chroots
    sed -i "s|url = ..|url = ${srcdir}|;s|.git$||" .gitmodules
    git submodule update --init
    # spice-common#5: a failure to detect recent versions of pyparsing was fixed, but git submodules uses a commit lacking the fix
    cd subprojects/spice-common
    patch -p1 < ${srcdir}/spice-common_detect-pyparsing.patch
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
