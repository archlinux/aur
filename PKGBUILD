# Contributor: mrxx <mrxx at cyberhome dot at>
# Contributor: Radek Podgorny <radek at podgorny dot cz>
# Contributor: Loïc Guitaut <flink at belfalas dot eu>
# Contributor: Nicolas Doualot <packages at slubman dot info>

pkgname=litecoin-qt
pkgver=0.21.4
pkgrel=3
arch=('x86_64')
url="https://www.litecoin.org/"
license=('MIT')
pkgdesc="Peer-to-peer network based digital currency (Qt)"
depends=('boost-libs' 'db4.8' 'fmt' 'libevent' 'miniupnpc' 'openssl' 'qrencode' 'qt5-base' 'sqlite' 'zeromq')
makedepends=('boost' 'qt5-tools')
provides=('litecoin')
conflicts=('litecoin')
source=("https://download.litecoin.org/litecoin-${pkgver}/src/litecoin-${pkgver}.tar.gz"{,.asc}
        "0001-upnp-add-compatibility-for-miniupnpc-2.2.8.patch"
        "0001-fix-boost-1.84-filesystem-deprecations.patch"
        "0002-fix-missing-headers-for-gcc-15.patch"
        "0003-Fix-_FORTIFY_SOURCE-flag.patch"
        "0004-remove-boost-system.patch"
        "$pkgname.desktop"
        "litecoin128.png")
sha256sums=('ba0922213f69c1b1a1d6c3441c5ea3696b538437533555ab74268f075f0de5d3'
            'SKIP'
            '8f4354356b66f92b52a85d91c19d576e7cb637957380c052404794a70d9f8383'
            'f9de747281f6003739d9ac736684771b061e9d63f2ea90404c08187595e57619'
            'bd5ecad7133a98bcb5387fa298a296cde8985d92b5a84eed06c19ec93e8b7ab4'
            '0ca550e3967ee880f8e24b77fc58ff22451f2966d056b4554184104c3ca5dbb5'
            '7d427d1ae3f0f8d848e7baf4210448bdede90b83c3ca6948f48eb4eb115b4db5'
            'cfc53dc9028745358235698ddd562d3e6b4a3ea9f896f5efc1aa8cd81f595559'
            '79fb205581c1e6df9758b56e2b527350f23124677036bc68176d088c4a28af8d')
validpgpkeys=(
  'D35621D53A1CC6A3456758D03620E9D387E55666'  # David Burkett
)

prepare() {
  patch -d litecoin-${pkgver} -p1 < 0001-upnp-add-compatibility-for-miniupnpc-2.2.8.patch
  patch -d litecoin-${pkgver} -p1 < 0001-fix-boost-1.84-filesystem-deprecations.patch
  patch -d litecoin-${pkgver} -p1 < 0002-fix-missing-headers-for-gcc-15.patch
  patch -d litecoin-${pkgver} -p1 < 0003-Fix-_FORTIFY_SOURCE-flag.patch
  patch -d litecoin-${pkgver} -p1 < 0004-remove-boost-system.patch
}

build() {
  cd "litecoin-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr --with-gui=qt5
  make
}

package() {
  install -Dm644 litecoin-qt.desktop "$pkgdir"/usr/share/applications/litecoin.desktop
  install -Dm644 litecoin128.png "$pkgdir"/usr/share/pixmaps/litecoin128.png

  cd "litecoin-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
