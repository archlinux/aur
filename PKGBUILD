# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: American_Jesus <american.jesus.pt AT gmail DOT com>
# Contributor: Suhaimi Ghazali <serdotlinecho AT gmail DOT com>
#
_pkgname="mconnect"
pkgname="${_pkgname}-git"
pkgver=409.210b435
pkgrel=2
pkgdesc="KDE Connect protocol implementation in Vala/C for non-KDE desktops"
arch=('i686' 'x86_64')
depends=('gtk3' 'libgee' 'gnutls' 'json-glib' 'libnotify')
makedepends=('at-spi2-atk' 'git' 'vala' 'json-glib' 'glib2' 'gobject-introspection' 'meson')
url="https://github.com/bboozzoo/mconnect"
license=('GPL2')
install="${pkgname}.install"
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!emptydirs')
source=("mconnect::git+${url}.git#branch=master"
        'mconnect_utils.patch')
sha256sums=('SKIP'
            '11a8e281a405e3d49c0b504dae03fcd33d1dbb5d278609d0163ecfec88b1ae1d')

pkgver() {
    cd "${_pkgname}"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
    cd "${_pkgname}"
    mkdir build
    patch -Np1 --input="${srcdir}/mconnect_utils.patch"
}

build() {
    cd "${_pkgname}"
    arch-meson build --prefix=/usr/
    ninja -C build
}

package() {
    cd "${_pkgname}"
    DESTDIR="${pkgdir}" ninja -C build install

    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
} 

# vim: set ts=4 sw=4 et syn=sh ft=sh:
