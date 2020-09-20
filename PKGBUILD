# Maintainer: Tom Zander

pkgname=flowee
pkgver=2020.06.2
pkgrel=1
pkgdesc="Flowee Bitcoin products"
arch=('x86_64')
url="https://flowee.org/"
license=('GPL3')
depends=('boost-libs' 'libevent' 'openssl')
makedepends=('boost' 'cmake' 'pkgconf')
optdepends=('miniupnpc')
provides=('flowee-hub' 'flowee-libs')
backup=("etc/flowee/flowee.conf")
install=flowee.install
source=("https://gitlab.com/FloweeTheHub/thehub/-/archive/$pkgver/thehub-$pkgver.tar.gz"
    "flowee.logrotate"
    "flowee.conf")

sha256sums=("debdbaa37ae67a3ee45e6e6af66ce650b629b575eb60b6bf158076e5c740b13a"
    "aff02b3312c88113fe7316152c15f1545233dc8c2062ee8c36d2dbcad4a9f5bf"
    "bc14acf0d1b4064553756a1e81c0b943e842296f2a2af6442e480b846392e6bc")

build() {
  mkdir -p build
  cd build
  cmake -Denable_gui=false -Dbuild_tests=true -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=$pkgdir/usr/ ../thehub-$pkgver
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
  install -Dm 664 "$srcdir/thehub-$pkgver/support/logs.conf" -t "$pkgdir/etc/flowee"
  install -Dm 644 "$srcdir/thehub-$pkgver/support/thehub.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm 644 "$srcdir/thehub-$pkgver/support/indexer.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm 664 "$srcdir/thehub-$pkgver/support/indexer.conf" -t "$pkgdir/etc/flowee"
  install -Dm 644 "$srcdir/thehub-$pkgver/support/indexer.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm 644 "$srcdir/thehub-$pkgver/support/rest-service.conf" -t "$pkgdir/etc/flowee"
  install -Dm 644 "$srcdir/thehub-$pkgver/support/rest-service.service" -t "$pkgdir/usr/lib/systemd/system"
}
