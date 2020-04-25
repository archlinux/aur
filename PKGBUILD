# Maintainer: Tom Zander

pkgname=flowee
pkgver=2020.03.2
pkgrel=1
pkgdesc="Flowee Bitcoin products"
arch=('x86_64')
url="https://flowee.org/"
license=('GPL')
depends=('boost-libs' 'libevent' 'openssl')
makedepends=('boost' 'cmake' 'pkgconf')
optdepends=('miniupnpc')
provides=('flowee-hub')
backup=("etc/flowee/flowee.conf")
install=flowee.install
source=("https://gitlab.com/FloweeTheHub/thehub/-/archive/$pkgver/thehub-$pkgver.tar.gz"
    "flowee.logrotate"
    "flowee.conf"
    "logs.conf")

sha256sums=("87c8be480629133a9c65a7bca3121c4a47e2673f8307e92e7ea26d493b771cd5"
    "aff02b3312c88113fe7316152c15f1545233dc8c2062ee8c36d2dbcad4a9f5bf"
    "bc14acf0d1b4064553756a1e81c0b943e842296f2a2af6442e480b846392e6bc"
    "2c94fbbccd6981a22951e4696f72d26aa0b5f7ea32aa48e46a0b6ded909fc3db")

build() {
  mkdir -p build
  cd build
  cmake -Dbuild_tests=true -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=$pkgdir/usr/ ../thehub-$pkgver
  make
}

check() {
    cd build/testing
    make check
}

package() {
  cd build
  make install
  cd "$pkgdir"
  mv usr/etc .
  chmod 775 etc/flowee
  mv etc/flowee/flowee.conf etc/flowee/flowee-example.conf
  install -Dm 664 "$srcdir/flowee.conf" -t "$pkgdir/etc/flowee"
  install -Dm 664 "$srcdir/logs.conf" -t "$pkgdir/etc/flowee"
  install -Dm 644 "$srcdir/thehub-$pkgver/support/thehub.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm 644 "$srcdir/thehub-$pkgver/support/indexer.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm 664 "$srcdir/thehub-$pkgver/support/indexer.conf" -t "$pkgdir/etc/flowee"
}
