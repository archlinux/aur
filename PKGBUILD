# Maintainer: Morgane Glidic <sardemff7@eventd.org>

pkgname=eventd
pkgver=0.29.0
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
    'glib2>=2.66.0'
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
    'libsoup3: WebSocket support'
)
options=(
    !strip
)
source=(
    https://www.eventd.org/download/${pkgname}/${pkgname}-${pkgver}.tar.xz
)
sha256sums=(
    25919f1934a2c809b0dbc035a74f28b726aec50386e0c441795ecd02abcbe23e
)

build() {
    local params=(
        --prefix=/usr
        -Dsystemd=true
        -Dgobject-introspection=false
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
