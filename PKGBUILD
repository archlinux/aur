# Maintainer: Quentin Glidic <sardemff7@eventd.org>

pkgname=eventd
pkgver=0.23.0
_pkgdir=${pkgname}-${pkgver}
pkgrel=4
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
    fe4905d79c8312686c11db28783364b84216289fd1a7fa58db3137135047dc9e
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
