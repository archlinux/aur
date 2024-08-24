# Maintainer: a821

pkgname=litecoin-daemon
pkgver=0.21.3
pkgrel=2
arch=('x86_64')
url="https://www.litecoin.org/"
license=('MIT')
pkgdesc="Peer-to-peer digital currency (includes litecoind and litecoin-cli)"
depends=('boost-libs' 'db4.8' 'fmt' 'libevent' 'miniupnpc' 'openssl' 'sqlite' 'zeromq')
makedepends=('boost')
conflicts=('litecoin-qt' 'litecoin-bin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/litecoin-project/litecoin/archive/refs/tags/v${pkgver}.tar.gz"
    0001-upnp-add-compatibility-for-miniupnpc-2.2.8.patch)
sha256sums=('e08642fb1d4ca3891981e6fd39f8c9fbc995d0db8b6b1c3f8f8671de8e120f9a'
            '8f4354356b66f92b52a85d91c19d576e7cb637957380c052404794a70d9f8383')

prepare() {
    patch -d litecoin-${pkgver} -p1 < 0001-upnp-add-compatibility-for-miniupnpc-2.2.8.patch
}

build() {
    cd litecoin-${pkgver}
    ./autogen.sh
    ./configure --prefix=/usr --without-gui
    make
}

package() {
    cd litecoin-${pkgver}
    # make DESTDIR="${pkgdir}" install # for standard install
    install -Dm755 -t "$pkgdir/usr/bin" src/litecoin{d,-cli}
    install -Dm644 -t "$pkgdir/usr/share/man/man1" doc/man/litecoin{d,-cli}.1
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ts=4 sw=4 et:
