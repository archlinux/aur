# Maintainer: Ian Huang <imyxhuang@gmail.com>
# Maintainer: MartorSkull <livemartor@gmail.com>
pkgname=cardano-node-bin
pkgver=1.35.4
pkgrel=1
pkgdesc="The core component that is used to participate in a Cardano \
decentralised blockchain (binary package)."
arch=("x86_64")
url="https://github.com/input-output-hk/cardano-node"
license=("Apache")
provides=("cardano-node=${pkgver}")
conflicts=("cardano-node")
install=cardano-node-bin.install
source=(
  "https://update-cardano-mainnet.iohk.io/cardano-node-releases/cardano-node-${pkgver}-linux.tar.gz"
  "cardano-node.sysusers"
  "cardano-node.tmpfiles"
  "cardano-node.service"
  "cardano-node.confd"
  "cardano-node-testnet.service"
  "cardano-node-testnet.confd")
sha256sums=('6fba3a9dc34f96d320841bb90842d9c3d7d9f91a38bd34aad589f19d97bd8b28'
            '782696d794db3c41cc96e301ed76c8108ac01cbd3347233eb9c4d4f970071633'
            '3212902b0d2bb0e6bacba0feeafd261516b9f6ab5f37f876a8c37239a1947542'
            '6db0b3bb81063f410499a6688a1abbbc5d63af165310ef709924985e5c0d1c4d'
            'd35f0e5e71ba476a4ee800898c892c22dedcc02eb4457f12ae68252740a8eeec'
            'ec16edc07aa35dccd5fb6894b964ab304cd7a8c1cc65eed22aa569e9105c7982'
            '0a57c08cb631db16f2ca38f29d30229d45cab91176a1b376aaa629dab9d063d7')

package() {
  # install systemd service
  install -D -m0644 "${srcdir}/cardano-node.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/cardano-node.conf"
  install -D -m0644 "${srcdir}/cardano-node.tmpfiles" \
    "${pkgdir}/usr/lib/tmpfiles.d/cardano-node.conf"
  install -D -m0644 "${srcdir}/cardano-node.service" \
    "${pkgdir}/usr/lib/systemd/system/cardano-node.service"
  install -D -m0644 "${srcdir}/cardano-node.confd" \
    "${pkgdir}/etc/conf.d/cardano-node"
  # and the testnet ones
  install -D -m0644 "${srcdir}/cardano-node-testnet.service" \
    "${pkgdir}/usr/lib/systemd/system/cardano-node-testnet.service"
  install -D -m0644 "${srcdir}/cardano-node-testnet.confd" \
    "${pkgdir}/etc/conf.d/cardano-node-testnet"

  # install configuration directory
  mkdir -p "${pkgdir}/var/lib/cardano-node"
  cp -r ./configuration "${pkgdir}/var/lib/cardano-node/config"

  # install executable binaries
  find . -executable -type f | while read f; do
    install -D -m0755 "$f" "${pkgdir}/usr/bin/$f"
  done

}

