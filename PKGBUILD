# Maintainer: Quentin Glidic <sardemff7@eventd.org>

pkgname=eventd-git
pkgver=0.20.0.r0.gb20d45a
_gitname=eventd
_pkgdir=${_gitname}
pkgrel=1
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
    'cairo>=1.14.0'
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
    libxslt
    docbook-xsl
)
optdepends=(
    'avahi: DNS-SD support'
    'gssdp: SSDP support'
    'librsvg: SVG images support'
    'libsoup: WebSocket support'
)
provides=(
    eventd
)
conflicts=(
    eventd
)
options=(
    !strip
)
source=(
    git://github.com/sardemff7/${_gitname}
)
sha256sums=(
    SKIP
)

pkgver() {
    cd "${srcdir}"/${_pkgdir}
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}"/${_pkgdir}
    git submodule update --init
    autoreconf --install
}

build() {
    local params=(
        --prefix=/usr
        --enable-systemd
        --disable-introspection
        --disable-nd-wayland
        --disable-im
        --disable-sound
    )

    cd "${srcdir}"/${_pkgdir}
    ./configure "${params[@]}"

    make
}

check() {
    cd "${srcdir}"/${_pkgdir}
    make check
}

package() {
    cd "${srcdir}"/${_pkgdir}
    make DESTDIR="${pkgdir}" install
}
