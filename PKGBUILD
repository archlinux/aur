# Maintainer: Tom Zander

pkgname=flowee
pkgver=2019.10.1
pkgrel=1
pkgdesc="Flowee Bitcoin products"
arch=('x86_64')
url="https://flowee.org/"
license=('GPL')
depends=('boost-libs' 'libevent' 'openssl')
makedepends=('boost' 'cmake' 'autoconf' 'automake' 'pkgconf')
provides=('flowee-hub')
backup=("etc/flowee/flowee.conf")
install=flowee.install
source=("git+https://gitlab.com/FloweeTheHub/thehub.git#branch=2019.10"
    "flowee.logrotate"
    "flowee.conf"
    "logs.conf")

sha256sums=('SKIP'
    "aff02b3312c88113fe7316152c15f1545233dc8c2062ee8c36d2dbcad4a9f5bf"
    "bc14acf0d1b4064553756a1e81c0b943e842296f2a2af6442e480b846392e6bc"
    "784a4cdc77d1767299ab10119288c21b478b205d560ae86bc9782b04ae2f82fc")

build() {
  mkdir -p build
  cd build
  cmake -Dbuild_tests=true -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=$pkgdir/usr/ ../thehub
  make -j1 univalue leveldb
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
  install -Dm 644 "$srcdir/thehub/support/thehub.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm 644 "$srcdir/thehub/support/indexer.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm 664 "$srcdir/thehub/support/indexer.conf" -t "$pkgdir/etc/flowee"
}
