# Maintainer: Quentin Glidic <sardemff7@eventd.org>

pkgname=eventd
pkgver=0.22.0
_pkgdir=${pkgname}-${pkgver}
pkgrel=2
pkgdesc="A small daemon to act on remote or local events"
arch=(
    i686
    x86_64
)
url="https://www.eventd.org"
license=(
    GPL3
    LGPL3
    MIT
)
depends=(
    'cairo>=1.12.0'
    gdk-pixbuf2
    'glib2>=2.40.0'
    glib-networking
    pango
    libsystemd
    libxcb
    util-linux
    xcb-util
    xcb-util-wm
)
makedepends=(
    'meson>=0.39.1'
    ninja
    libxslt
    docbook-xsl
)
optdepends=(
    'avahi: DNS-SD support'
    'gssdp: SSDP support'
    'librsvg: SVG images support'
    'libsoup: WebSocket support'
)
options=(
    !strip
)
source=(
    https://www.eventd.org/download/${pkgname}/${pkgname}-${pkgver}.tar.xz
)
sha256sums=(
    c643dde927f1e938898a0196021f3e0f3c6cc369bd133c8ab9d70b333ecc2fa4
)

build() {
    local params=(
        --prefix=/usr
        -Denable-systemd=true
        -Denable-introspection=false
        -Denable-nd-wayland=false
        -Denable-im=false
        -Denable-sound=false
    )

    cd "${srcdir}"/${_pkgdir}
    meson "${srcdir}"/build "${params[@]}"
    ninja -C "${srcdir}"/build
}

check() {
    ninja -C "${srcdir}"/build test
}

package() {
    DESTDIR="${pkgdir}" \
    ninja -C "${srcdir}"/build install
}
