# Contributor: mrxx <mrxx at cyberhome dot at>
# Contributor: Radek Podgorny <radek at podgorny dot cz>
# Contributor: Loïc Guitaut <flink at belfalas dot eu>
# Contributor: Nicolas Doualot <packages at slubman dot info>

pkgname=litecoin-qt
pkgver=0.21.3
pkgrel=1
arch=('x86_64')
url="https://www.litecoin.org/"
license=('MIT')
pkgdesc="Peer-to-peer network based digital currency (Qt)"
depends=('boost-libs' 'db4.8' 'fmt' 'libevent' 'miniupnpc' 'openssl' 'qrencode' 'qt5-base' 'sqlite' 'zeromq')
makedepends=('boost' 'qt5-tools')
provides=('litecoin')
conflicts=('litecoin')
source=("https://download.litecoin.org/litecoin-${pkgver}/src/litecoin-${pkgver}.tar.gz"
        "0001-upnp-add-compatibility-for-miniupnpc-2.2.8.patch"
        "$pkgname.desktop"
        "litecoin128.png")
sha256sums=('e08642fb1d4ca3891981e6fd39f8c9fbc995d0db8b6b1c3f8f8671de8e120f9a'
            '8f4354356b66f92b52a85d91c19d576e7cb637957380c052404794a70d9f8383'
            'cfc53dc9028745358235698ddd562d3e6b4a3ea9f896f5efc1aa8cd81f595559'
            '79fb205581c1e6df9758b56e2b527350f23124677036bc68176d088c4a28af8d')

prepare() {
  patch -d litecoin-${pkgver} -p1 < 0001-upnp-add-compatibility-for-miniupnpc-2.2.8.patch
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
