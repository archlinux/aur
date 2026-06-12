# Maintainer: Albert Mikaelyan <tahvok at gmail dot com>
# Contributor: mrypsilon

pkgname=gridcoinresearchd
pkgver=5.5.1.0
pkgrel=1
pkgdesc="A cryptocurrency that rewards users for participating on the BOINC network (Daemon/CLI)"
makedepends=('cmake' 'boost')
depends=('db5.3' 'libzip' 'boost-libs' 'miniupnpc')
optdepends=('boinc: to earn Gridcoin rewards by doing computational research')
replaces=('gridcoinresearch-daemon')
conflicts=('gridcoinresearch-daemon')

arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://gridcoin.us"
license=('MIT')

_sourcename="Gridcoin-Research-${pkgver//_/-}"

source=("$pkgname-$pkgver.tar.gz::https://github.com/gridcoin-community/Gridcoin-Research/archive/${pkgver//_/-}.tar.gz")

sha256sums=('b165ec1f4bc3ec577557d0b6acc7594eb1992ffbb85092cc77857f0a1a57df6b')

# leaving in case needed for future patches
#prepare() {
#    cd "$srcdir/$_sourcename"
#    patch --strip=1 --input="../trafficgraphwidget.cpp.patch"
#}

build() {
  cmake \
      -B build \
      -S "$srcdir/$_sourcename" \
      -DCMAKE_INSTALL_PREFIX='/usr' \
      -DENABLE_GUI=OFF \
      -DSYSTEMBDB=ON \
      -DENABLE_TESTS=ON \
      -Wno-dev
  cmake --build build
}

check() {
  ctest --test-dir build
}

package_gridcoinresearchd() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$srcdir/$_sourcename/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
