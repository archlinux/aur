# Maintainer: Sean Gillespie <sean@mistersg.net>
pkgname=cardano-db-sync-bin
pkgver=13.7.2.1
pkgrel=1
pkgdesc="A Cardano chain indexer that stores block and transactions in a PostgreSQL database"
arch=("x86_64")
url="https://github.com/IntersectMBO/cardano-db-sync"
license=('Apache-2.0')
makedepends=("git")
depends=("cardano-conf" "cardano-node-bin")
provides=("cardano-db-sync=${pkgver}")
conflicts=("cardano-db-sync")
options=(!debug !strip)
install=cardano-db-sync-bin.install

source=(
  "https://github.com/IntersectMBO/cardano-db-sync/releases/download/$pkgver/cardano-db-sync-$pkgver-linux.tar.gz"
  "cardano-dist::git+https://github.com/sgillespie/cardano-db-sync-dist#commit=db6d3395102eeb02ebd3c54bf2e6c107a6b0ec36"
)
sha256sums=('e1d94e868e7abcf26d506d921787add698e65ca7d90491d8d4fd7f1af6770bf1'
            '0e6cfbd2a7dac91d04081868ad91feb89c80d90076b5f3129b2aa51bf00df1d6')

check() {
  "${srcdir}/bin/cardano-db-sync" version | grep -s "$pkgver"
}

package() {
  # Create required directories
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/cardano-db-sync/schema"

  # Install systemd service
  install -D -m0644 "${srcdir}/cardano-dist/init/cardano-db-sync.tmpfiles" \
    "${pkgdir}/usr/lib/tmpfiles.d/cardano-db-sync.conf"
  install -D -m0644 "${srcdir}/cardano-dist/init/cardano-db-sync@.service" \
    "${pkgdir}/usr/lib/systemd/system/cardano-db-sync@.service"

  # copy migrations
  install -D -m0644 "${srcdir}/schema/"* "${pkgdir}/usr/share/cardano-db-sync/schema/"

  # install executable binaries
  install -D -m0755 "${srcdir}/bin/"{cardano-db-sync,cardano-db-tool,cardano-smash-server} \
    "${pkgdir}/usr/bin"

}
