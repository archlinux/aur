# Maintainer: Dmitry Kharitonov <arch[at]nano-model[dot]com>
# Contributor: Jonathan Biegert <azrdev@googlemail.com>
# Contributor: Tobias Breitwieser <tobias@breitwieser.biz>
# Contributor: Stefan Betz <info@stefan-betz.net>

pkgname=peervpn
pkgver=0.044
_pkgver=${pkgver//./-}
pkgrel=4
pkgdesc="An open source peer-to-peer VPN"
url="http://www.peervpn.net"
arch=('i686' 'x86_64' 'armv5tel' 'armv6l' 'armv7h' 'aarch64')
license=('GPL3')
depends=('openssl')
backup=('etc/peervpn/peervpn.conf')
source=("http://www.peervpn.net/files/peervpn-${_pkgver}.tar.gz"
        "peervpn@.service"
        "openssl-1.1.patch")
sha256sums=('4402d5ce956d95ff85b8aeb455d984b9eb9c2e6a058d2580c8e90da12fed8392'
            '9acf8c1e69817e2eaf2f8b1f2ee61419d3b6bc9684b643bfccb9c0440d01dc8b'
            '09f25292ac6ed183306d2b6ccffe218744baf7e80457b5a091903c301dcef26a')

prepare() {
    cd "$pkgname-${_pkgver}/libp2psec"
    patch -p1 < "${srcdir}/openssl-1.1.patch"
}

build() {
    cd "$pkgname-${_pkgver}"
    ln -sfn ../peervpn@.service .
    #unset LDFLAGS
    make
}

package() {
    cd "$pkgname-${_pkgver}"
    install -Dm0600 peervpn.conf "$pkgdir/etc/peervpn/peervpn.conf"
    install -Dm0775 peervpn "$pkgdir/usr/bin/peervpn"
    install -Dm0644 peervpn@.service "$pkgdir/usr/lib/systemd/system/peervpn@.service"
}


