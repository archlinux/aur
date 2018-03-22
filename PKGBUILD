# Maintainer: Tom Zander

pkgname=flowee-git
pkgver=git
pkgrel=1
pkgdesc="Flowee the Hub"
arch=('i686' 'x86_64')
url="http://flowee.org/"
license=('GPL')
depends=('boost-libs' 'libevent' 'openssl')
makedepends=('boost' 'cmake')
optdepends=('zeromq: for backwards compatibility in the hub',
    'miniupnpc: allows the hub to open port-forwarding',
    'qt5-base: for the hub-gui',
    'qt5-quickcontrols2: builds the Point-of-Sales component')
provides=('flowee-hub')
backup=("etc/flowee/flowee.conf")
install=flowee.install
source=("git+https://github.com/floweethehub/hub.git#branch=master"
    "flowee.logrotate"
    "flowee.conf"
    "logs.conf")

sha256sums=('SKIP'
    "d09fe561ed2b5fa0abf40bb5bfce0d6294b3747f97b94b473d040bda7b212985"
    "c02e66610a93f1f8b302b5409aa094ec8fd842698f2f7b54d8645bebae3da98b"
    "635bf93ae346f7a8f4baf61d2d8316aa24647e87d23847876302330cb1e1191b")

pkgver() {
  cd "$srcdir/hub"
  git rev-parse --short HEAD
}

build() {
  mkdir -p build
  cd build
  cmake -Dmark_release=true -Dbuild_tests=true -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=$pkgdir/usr/ ../hub
  make -j1 univalue
  make
}

check() {
  ./build/testing/test/test_hub
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
  install -Dm 644 "$srcdir/hub/support/thehub.service" -t "$pkgdir/usr/lib/systemd/system"
}
