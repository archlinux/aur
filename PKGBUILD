# Maintainer: Tom Zander

pkgname=flowee-git
pkgver=2020.08.2.r10.g0eea8e523
pkgrel=1
pkgdesc="Flowee Bitcoin products"
arch=('x86_64' 'aarch64')
url="https://flowee.org/"
license=('GPL')
depends=('boost-libs' 'libevent' 'openssl')
makedepends=('boost' 'cmake' 'pkgconf')
provides=('flowee-hub' 'flowee-libs')
backup=("etc/flowee/flowee.conf" "etc/flowee/rest-service.conf")
install=flowee.install
source=("git+https://gitlab.com/FloweeTheHub/thehub.git#branch=master"
    "flowee.logrotate"
    "flowee.conf"
    "logs.conf")

sha256sums=('SKIP'
    "0438e1a44523aeb3bbecd60fd920ca7b2aacd267b5cf988ab77a44eb7c03929e"
    "59c1928ddb33fed1d4bf35df8fecd1dbdda0b308eac943503a2e3afb8c64bc89"
    "2ed3fca395e3ca1011c51fb38f1fc574f890accf64f14cff02512199fe86b96f")

pkgver() {
  cd "$srcdir/thehub"
  git describe --long --tags | sed 's/v\(.*\)/\1/;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p build
  cd build
  cmake -Denable_gui=false -Dbuild_tests=true -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=$pkgdir/usr/ ../thehub
  make
}

check() {
    cd build/testing
    #make check
}

package() {
  cd build
  make install
  cd "$pkgdir"
  mv usr/etc .
  chmod 775 etc/flowee
  mv etc/flowee/flowee.conf etc/flowee/flowee-example.conf
  install -Dm 664 "$srcdir/flowee.conf" -t "$pkgdir/etc/flowee"
  install -Dm 644 "$srcdir/flowee.logrotate" "$pkgdir/etc/logrotate.d/flowee"
  install -Dm 664 "$srcdir/logs.conf" -t "$pkgdir/etc/flowee"
  install -Dm 644 "$srcdir/thehub/support/thehub.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm 644 "$srcdir/thehub/support/indexer.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm 664 "$srcdir/thehub/support/indexer.conf" -t "$pkgdir/etc/flowee"
  install -Dm 644 "$srcdir/thehub/support/rest-service.conf" -t "$pkgdir/etc/flowee"
  install -Dm 644 "$srcdir/thehub/support/rest-service.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm 644 "$srcdir/thehub/support/bitcore-proxy.conf" -t "$pkgdir/etc/flowee"
  install -Dm 644 "$srcdir/thehub/support/bitcore-proxy.service" -t "$pkgdir/usr/lib/systemd/system"
}
