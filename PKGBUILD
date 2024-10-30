# Maintainer: a821

pkgname=litecoin-daemon
pkgver=0.21.4
pkgrel=1
arch=('x86_64')
url="https://www.litecoin.org/"
license=('MIT')
pkgdesc="Peer-to-peer digital currency (includes litecoind and litecoin-cli)"
depends=('boost-libs' 'db4.8' 'fmt' 'libevent' 'miniupnpc' 'openssl' 'sqlite' 'zeromq')
makedepends=('boost')
conflicts=('litecoin-qt' 'litecoin-bin')
source=("https://download.litecoin.org/litecoin-${pkgver}/src/litecoin-${pkgver}.tar.gz"{,.asc}
    0001-fix-boost-1.84-filesystem-deprecations.patch
    0001-upnp-add-compatibility-for-miniupnpc-2.2.8.patch)
sha256sums=('ba0922213f69c1b1a1d6c3441c5ea3696b538437533555ab74268f075f0de5d3'
            'SKIP'
            'f9de747281f6003739d9ac736684771b061e9d63f2ea90404c08187595e57619'
            '8f4354356b66f92b52a85d91c19d576e7cb637957380c052404794a70d9f8383')
validpgpkeys=(
  'D35621D53A1CC6A3456758D03620E9D387E55666'  # David Burkett
)

prepare() {
    patch -d litecoin-${pkgver} -p1 < 0001-upnp-add-compatibility-for-miniupnpc-2.2.8.patch
    patch -d litecoin-${pkgver} -p1 < 0001-fix-boost-1.84-filesystem-deprecations.patch
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
