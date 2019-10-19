# Maintainer: Quentin Glidic <sardemff7@eventd.org>

pkgname=eventd-git
pkgver=0.27.0.r0.g5efcfe1a
_gitname=eventd
_pkgdir=${_gitname}
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
    libxkbcommon
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
    git+https://github.com/sardemff7/${_gitname}
    git+https://github.com/sardemff7/libnkutils
    git+https://github.com/sardemff7/libgwater
)
sha256sums=(
    SKIP
    SKIP
    SKIP
)

pkgver() {
    cd "${srcdir}"/${_pkgdir}
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}"/${_pkgdir}
    git submodule init
    git config submodule.libnkutils.url "${srcdir}/libnkutils"
    git config submodule.libgwater.url "${srcdir}/libgwater"
    git submodule update
}

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
    ninja -C "${srcdir}"/build test
}

package() {
    DESTDIR="${pkgdir}" \
    ninja -C "${srcdir}"/build install
}
