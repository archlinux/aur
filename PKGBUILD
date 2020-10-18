# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
_pkgname="Shortwave"
pkgname="shortwave"
pkgver="1.1.1"
pkgrel="7"
epoch="1"
pkgdesc="Find and listen to internet radio stations."
arch=('any')
url="https://gitlab.gnome.org/World/${_pkgname}"
license=('GPL3')
depends=('gst-plugins-bad' 'libhandy0' 'libsoup' 'gtk3')
makedepends=('cargo' 'git' 'gobject-introspection' 'gst-plugins-base-libs' 'libdazzle' 'meson' 'rust')
options=('!emptydirs')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/-/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        "handy.patch"
)
sha256sums=('b391b4d10658e9ba180442ca2d769173a278f19beb498c7251a6b4a62b7c678b'
            '01bbac29d6aacf6bedbfc49632db24f05c7df9e52aecd2143a42e41df9f097d9')

prepare() {
    cd "${_pkgname}-${pkgver}"
    patch -Np1 -i ../handy.patch
}

build() {
    cd "${_pkgname}-${pkgver}"
    arch-meson builddir --prefix=/usr
    ninja -C builddir
}

check() {
    cd "${_pkgname}-${pkgver}"
    ninja -C builddir test
}

package() {
    cd "${_pkgname}-${pkgver}"
    DESTDIR="${pkgdir}" ninja -C builddir install

    install -D -m644 COPYING.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set ts=4 sw=4 et syn=sh ft=sh:
