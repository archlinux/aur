# Maintainer: a821

pkgname=litecoin-daemon
pkgver=0.21.4
pkgrel=2
arch=('x86_64')
url="https://www.litecoin.org/"
license=('MIT')
pkgdesc="Peer-to-peer digital currency (includes litecoind and litecoin-cli)"
depends=('boost-libs' 'db4.8' 'fmt' 'libevent' 'miniupnpc' 'openssl' 'sqlite' 'zeromq')
makedepends=('boost')
conflicts=('litecoin-qt' 'litecoin-bin')
source=("https://download.litecoin.org/litecoin-${pkgver}/src/litecoin-${pkgver}.tar.gz"{,.asc}
    0001-fix-boost-1.84-filesystem-deprecations.patch
    0001-upnp-add-compatibility-for-miniupnpc-2.2.8.patch
    0002-fix-missing-headers-for-gcc-15.patch
    0003-Fix-_FORTIFY_SOURCE-flag.patch
)
sha256sums=('ba0922213f69c1b1a1d6c3441c5ea3696b538437533555ab74268f075f0de5d3'
            'SKIP'
            'f9de747281f6003739d9ac736684771b061e9d63f2ea90404c08187595e57619'
            '8f4354356b66f92b52a85d91c19d576e7cb637957380c052404794a70d9f8383'
            'bd5ecad7133a98bcb5387fa298a296cde8985d92b5a84eed06c19ec93e8b7ab4'
            '0ca550e3967ee880f8e24b77fc58ff22451f2966d056b4554184104c3ca5dbb5')
validpgpkeys=(
  'D35621D53A1CC6A3456758D03620E9D387E55666'  # David Burkett
)

prepare() {
    patch -d litecoin-${pkgver} -p1 < 0001-upnp-add-compatibility-for-miniupnpc-2.2.8.patch
    patch -d litecoin-${pkgver} -p1 < 0001-fix-boost-1.84-filesystem-deprecations.patch
    patch -d litecoin-${pkgver} -p1 < 0002-fix-missing-headers-for-gcc-15.patch
    patch -d litecoin-${pkgver} -p1 < 0003-Fix-_FORTIFY_SOURCE-flag.patch
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
