# Maintainer: Sean Gillespie <sean@mistersg.net>
# Contributer: Ian Huang <imyxhuang@gmail.com>
# Contributer: MartorSkull <livemartor@gmail.com>
pkgname=cardano-node-bin
pkgver=11.0.1
pkgrel=1
pkgdesc="The core component that is used to participate in a Cardano 
decentralised blockchain (binary package)."
arch=("x86_64")
url="https://github.com/input-output-hk/cardano-node"
license=("Apache-2.0")
depends=("cardano-conf")
makedepends=("git")
provides=("cardano-node=${pkgver}")
conflicts=("cardano-node")
options=(!debug !strip)
install=cardano-node-bin.install
source=(
  "https://github.com/IntersectMBO/cardano-node/releases/download/$pkgver/cardano-node-$pkgver-linux-amd64.tar.gz"
  "cardano-dist::git+https://github.com/sgillespie/cardano-db-sync-dist#commit=db6d3395102eeb02ebd3c54bf2e6c107a6b0ec36")
sha256sums=('40e88a543564251338c4888ef79fde51d2306c18b48ac308c9eab3220e3a13f0'
            '0e6cfbd2a7dac91d04081868ad91feb89c80d90076b5f3129b2aa51bf00df1d6')

check() {
  "${srcdir}/bin/cardano-node" version | grep -q "$pkgver"
  "${srcdir}/bin/cardano-cli" version > /dev/null
}

package() {
  # install systemd service
  install -D -m0644 "${srcdir}/cardano-dist/init/cardano-node.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/cardano-node.conf"
  install -D -m0644 "${srcdir}/cardano-dist/init/cardano-node@.service" \
    "${pkgdir}/usr/lib/systemd/system/cardano-node@.service"

  # install executable binaries
  find . -executable -type f | while read f; do
    install -D -m0755 "$f" "${pkgdir}/usr/bin/$f"
  done

}

