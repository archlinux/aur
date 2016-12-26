# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Ionut Biru <ibiru@archlinux.org>

_pkgname=transmission
pkgname=transmission-cli-nodaemon
pkgver=2.92
pkgrel=2
pkgdesc="Fast, easy, and free BitTorrent client (CLI tools and web client). This version does not include the daemon and is for remote connection only (through cli or GUI)."
arch=('i686' 'x86_64')
url="https://www.transmissionbt.com/"
license=('MIT')
depends=('curl' 'libevent')
makedepends=('intltool')
conflicts=('transmission-cli')
provides=('transmission-cli')
source=("https://github.com/${_pkgname}/${_pkgname}-releases/raw/master/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('3a8d045c306ad9acb7bf81126939b9594553a388482efa0ec1bfb67b22acd35f')

prepare() {
    cd ${_pkgname}-${pkgver}
    rm -f m4/glib-gettext.m4
    autoreconf -fi
}

build() {
    cd ${_pkgname}-${pkgver}
    ./configure --prefix=/usr --enable-cli --disable-daemon
    make
}

package() {
    cd ${_pkgname}-${pkgver}

    for dir in cli utils; do
        make -C ${dir} DESTDIR="${pkgdir}" install
    done

    install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
}
