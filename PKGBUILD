pkgname=coin-or-bcp
pkgver=1.4.4
pkgrel=1
pkgdesc="Parallel framework for implementing branch, cut, and price algorithms for solving mixed integer programs"
arch=('i686' 'x86_64')
url="https://projects.coin-or.org/Bcp"
license=('EPL')
groups=('coin-or')
depends=('coin-or-vol' 'coin-or-cgl')
makedepends=()
source=("http://www.coin-or.org/download/source/Bcp/Bcp-$pkgver.tgz")
sha256sums=('8b490ad35c28a79806f84dacbdc36d602ce0a3a4e32c3575f99495c6e6b4906e')

prepare() {
  cd "$srcdir/Bcp-$pkgver"
  curl -L https://github.com/coin-or/Bcp/commit/e581a2dd4b55352eb318c15e8281b3cc9d8abe23.patch | patch -p1
}

build() {
  cd "$srcdir/Bcp-$pkgver"
  ./configure --prefix=/usr \
              --with-osi-lib="$(pkg-config --libs osi)" \
              --with-osi-incdir="/usr/include/coin/" \
              --with-clp-lib="$(pkg-config --libs clp)" \
              --with-clp-incdir="/usr/include/coin/" \
              --with-cgl-lib="$(pkg-config --libs cgl)" \
              --with-cgl-incdir="/usr/include/coin/" \
              --with-vol-lib="$(pkg-config --libs vol)" \
              --with-vol-incdir="/usr/include/coin/" \
              --with-coinutils-lib="$(pkg-config --libs coinutils)" \
              --with-coinutils-incdir="/usr/include/coin/"
  make
}

check() {
  cd "$srcdir/Bcp-$pkgver"
  make test
}

package() {
  cd "$srcdir/Bcp-$pkgver"
  PKG_CONFIG_LIBDIR="${pkgdir}/usr/lib/pkgconfig/" \
  make DESTDIR="$pkgdir" install
}

