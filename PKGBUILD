# Maintainer: Albert Mikaelyan <tahvok at gmail dot com>

pkgname=gridcoinresearchd
pkgver=3.5.8.9
pkgrel=1
pkgdesc="GridCoin is a cryptocurrency that helps science via BOINC - daemon"
depends=('boost-libs' 'libzip' 'miniupnpc' 'curl' 'boinc')
makedepends=('boost' 'db')

replaces=('gridcoinresearch-daemon')
conflicts=('gridcoinresearch-daemon')

arch=('i686' 'x86_64' 'armv7h')
url="http://gridcoin.us"
license=('custom:gridcoin')

_sourcename="Gridcoin-Research-$pkgver"

source=("gridcoinresearch-${pkgver}.tar.gz::https://github.com/gridcoin/Gridcoin-Research/archive/${pkgver}.tar.gz"
        '0001-Openssl-1.1.0-185.patch')

sha256sums=('7e637f6a7d9b10d3df3bb183611d8094dadb1e884c1e5fba860adfb338686d60'
            '6aec7fc3612444cdf5b837c82177268f29aba4f9b6bb4a8c47a7d6fca831b42c')

prepare() {
  mkdir -p "$srcdir/$_sourcename/src/obj"

  chmod 755 "$srcdir/$_sourcename/src/leveldb/build_detect_platform"

  cd "$srcdir/$_sourcename"
  patch -Np1 -i "$srcdir/0001-Openssl-1.1.0-185.patch"
}

build() {
  cd "$srcdir/$_sourcename/src"

  make -f makefile.unix DEBUGFLAGS="" USE_UPNP=1
}

package() {
  cd "$srcdir/$_sourcename/src"

  install -Dm755 gridcoinresearchd "$pkgdir/usr/bin/gridcoinresearchd"
  install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

