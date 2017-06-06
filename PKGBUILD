# Maintainer: Quentin Glidic <sardemff7@eventd.org>

pkgname=session-nanny-git
pkgver=0.r15.g5e5c80c
_gitname=session-nanny
_pkgdir=${_gitname}
pkgrel=1
pkgdesc="A small daemon to act on remote or local events"
arch=(
    i686
    x86_64
)
url="https://github.com/sardemff7/session-nanny/"
license=(
    GPL3
)
depends=(
    'glib2>=2.40.0'
)
makedepends=(
    'meson>=0.39.1'
    pkg-config
    ninja
    vala
)
optdepends=(
)
provides=(
    session-nanny
)
conflicts=(
    session-nanny
)
options=(
    !strip
)
source=(
    git+https://github.com/sardemff7/${_gitname}
)
sha256sums=(
    SKIP
)

pkgver() {
    cd "${srcdir}"/${_pkgdir}
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    local params=(
        --prefix=/usr
        -Dsystemduserunitdir=/usr/lib/systemd/user
        -Ddbussessionservicedir=/usr/share/dbus-1/services
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
