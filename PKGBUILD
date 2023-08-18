# Maintainer: Tom Zander

pkgname=flowee
pkgver=2023.08.0
pkgrel=1
pkgdesc="Flowee provides the shortest path to Bitcoin Cash"
arch=('x86_64' 'aarch64')
url="https://flowee.org/"
license=('GPL3')
depends=('boost-libs' 'libevent' 'openssl')
makedepends=('boost' 'cmake' 'pkgconf')
optdepends=('miniupnpc')
provides=('flowee-hub' 'flowee-libs')
backup=("etc/flowee/flowee.conf" "etc/flowee/rest-service.conf")
install=flowee.install
source=("https://codeberg.org/Flowee/thehub/archive/$pkgver.tar.gz"
    "flowee.logrotate"
    "flowee.conf")

sha256sums=("9eb113291a477d6545269734a8fefaa766fda3f1e52f250da294a0e12c1a1559"
    "0438e1a44523aeb3bbecd60fd920ca7b2aacd267b5cf988ab77a44eb7c03929e"
    "59c1928ddb33fed1d4bf35df8fecd1dbdda0b308eac943503a2e3afb8c64bc89")

build() {
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release -Dbuild_apps=ON -DCMAKE_INSTALL_PREFIX=$pkgdir/usr/ ../thehub
  echo '#define GIT_COMMIT_ID "7aba8ac"' > include/build.h
  echo '#define BUILD_DATE "2023-08-17 21:35:51 +0200"' >> include/build.h
  make
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
  install -Dm 664 "$srcdir/thehub/support/logs.conf" -t "$pkgdir/etc/flowee"
  install -Dm 644 "$srcdir/thehub/support/thehub.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm 644 "$srcdir/thehub/support/indexer.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm 664 "$srcdir/thehub/support/indexer.conf" -t "$pkgdir/etc/flowee"
  install -Dm 644 "$srcdir/thehub/support/indexer.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm 644 "$srcdir/thehub/support/rest-service.conf" -t "$pkgdir/etc/flowee"
  install -Dm 644 "$srcdir/thehub/support/rest-service.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm 644 "$srcdir/thehub/support/bitcore-proxy.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm 644 "$srcdir/thehub/support/bitcore-proxy.conf" -t "$pkgdir/etc/flowee"
}
