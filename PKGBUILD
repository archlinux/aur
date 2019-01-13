# Maintainer: Quentin Glidic <sardemff7@eventd.org>

pkgname=eventd
pkgver=0.25.0
_pkgdir=${pkgname}-${pkgver}
pkgrel=1
pkgdesc="A small daemon to act on remote or local events"
arch=(
    aarch64
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
    'libxkbcommon>=0.4.1'
    libxkbcommon-x11
    util-linux
    xcb-util
    xcb-util-wm
)
makedepends=(
    git
    meson
    pkg-config
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
    7fb800d3a7cd12ece785fafd604b29abc1f97c009c5f08ef5a2ccb3497339c55
)

build() {
    local params=(
        --prefix=/usr
        -Dsystemd=true
        -Dintrospection=false
        -Dnd-wayland=false
        -Dim=false
        -Dsound=false
    )

    cd "${srcdir}"/${_pkgdir}
    meson "${srcdir}"/build "${params[@]}"
    ninja -C "${srcdir}"/build
}

check() {
    # Workaround until next release
    LC_ALL=C \
    ninja -C "${srcdir}"/build test
}

package() {
    DESTDIR="${pkgdir}" \
    ninja -C "${srcdir}"/build install
}
