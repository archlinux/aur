# Maintainer: Tom Zander

pkgname=flowee
pkgver=2026.05.2
options=(!lto)
pkgrel=1
pkgdesc="Flowee provides the shortest path to Bitcoin Cash"
arch=('x86_64' 'aarch64')
url="https://flowee.org/"
license=('GPL3')
depends=('boost-libs' 'libevent' 'openssl')
makedepends=('boost' 'cmake' 'pkgconf')
optdepends=('miniupnpc' 'qt6-base')
optmakedepends=('qt6-tools')
provides=('flowee-hub' 'flowee-libs')
backup=("etc/flowee/flowee.conf"
    "etc/flowee/indexer.conf"
    "etc/flowee/rest-service.conf"
    "etc/flowee/bitcore-proxy.conf"
    "etc/flowee/walletStore.conf"
)
install=flowee.install
source=("https://bitcoincashcode.org/Flowee/thehub/archive/$pkgver.tar.gz"
    "flowee.logrotate")

sha256sums=("764d68246bce6cecef34b6aac1c2b87675ebe4ddaf0f5f88ab8721324e79711f"
    "0438e1a44523aeb3bbecd60fd920ca7b2aacd267b5cf988ab77a44eb7c03929e")

build() {
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release -Dbuild_apps=ON -DCMAKE_INSTALL_PREFIX=$pkgdir/usr/ ../thehub
  echo '#define GIT_COMMIT_ID "d19571fc"' > include/build.h
  echo '#define BUILD_DATE "2026-05-25 18:07:12 +0200"' >> include/build.h
  make
}

package() {
  cd build
  make install
  cd "$pkgdir"
  mv usr/etc .
  chmod 775 etc/flowee
  install -Dm 664 "$srcdir/thehub/support/flowee.conf" -t "$pkgdir/etc/flowee"
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
  install -Dm 644 "$srcdir/thehub/support/wallet-store-server.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm 644 "$srcdir/thehub/support/walletStore.conf" -t "$pkgdir/etc/flowee"
}
