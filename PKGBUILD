# Maintainer: Michał Sałaban <michal@salaban.info>
pkgname=cardano-node
pkgver=1.30.1
pkgrel=2
pkgdesc='The core component that is used to participate in a Cardano decentralised blockchain.'
license=('Apache')
arch=('any')
url='https://github.com/input-output-hk/cardano-node'
_ghc_version="`ghc --numeric-version`"
# NOTE: The build process includes resolution, download and compilation of required libraries.
# However, if you have corresponding haskell-* packages present in the system, the build
# will most likely fail trying to use the installed lib.
# This is probably configurable but I'm not experienced in Haskell. Suggestions are welcome.
makedepends=('git' 'cabal-install-bin' 'ghc>=8.10.4')
depends=('libsodium')
#
# The latest build is reachable via the following redirection link:
# https://hydra.iohk.io/job/Cardano/cardano-node/cardano-deployment/latest-finished/download/1/index.html
_config_build="7654130"
#
backup=("etc/conf.d/cardano-node"
        "var/lib/cardano-node/config/mainnet-config.json"
        "var/lib/cardano-node/config/mainnet-topology.json"
        "var/lib/cardano-node/config/testnet-config.json"
        "var/lib/cardano-node/config/testnet-topology.json")
source=("git+https://github.com/input-output-hk/${pkgname}.git#tag=${pkgver}"
        "https://hydra.iohk.io/build/${_config_build}/download/1/mainnet-config.json"
        "https://hydra.iohk.io/build/${_config_build}/download/1/mainnet-byron-genesis.json"
        "https://hydra.iohk.io/build/${_config_build}/download/1/mainnet-shelley-genesis.json"
        "https://hydra.iohk.io/build/${_config_build}/download/1/mainnet-alonzo-genesis.json"
        "https://hydra.iohk.io/build/${_config_build}/download/1/mainnet-topology.json"
        "https://hydra.iohk.io/build/${_config_build}/download/1/testnet-config.json"
        "https://hydra.iohk.io/build/${_config_build}/download/1/testnet-byron-genesis.json"
        "https://hydra.iohk.io/build/${_config_build}/download/1/testnet-shelley-genesis.json"
        "https://hydra.iohk.io/build/${_config_build}/download/1/testnet-alonzo-genesis.json"
        "https://hydra.iohk.io/build/${_config_build}/download/1/testnet-topology.json"
        "cardano-node.sysusers"
        "cardano-node.tmpfiles"
        "cardano-node.service"
        "cardano-node.confd"
        "cardano-node-testnet.service"
        "cardano-node-testnet.confd")
sha256sums=('SKIP'
            '1dc62fc62669e9c991d09e85c884f2aceaff486b6cb9037af8400a1bda950b68'
            '4f28b3b437b2c4f6ee26cc70964b3a5f1a274b0b3909c31535091c00316c13aa'
            '59cd3932c6dd792bc5020ca3336064a8faabde4e4a8dc7d143ff4df6eec36961'
            '7333bfafe311589fa09e8bf59a47ec0d85a1959f00748cc0800591d2c7646408'
            '7ac2184ff55d1272e87d579550501b7e4fc61b9cf016179ca026516fff365730'
            '2d19651f9abdcdc8b6f00e9e06e3f857b23fd73d0096a39df256e66807ad4380'
            'dca3139e907bb943bfeff5f186f3fc71217ff12cabde93a926277c6ddd647d87'
            '4e309ad1f7b19d5c442b9250326ef55a70581c5d1bc0f7a056d18ebff31bcfa6'
            '7333bfafe311589fa09e8bf59a47ec0d85a1959f00748cc0800591d2c7646408'
            'cbcf919b1d2d656ea7512f8ecb12e3c3e3a8db137925abff52d647427f2b154f'
            '703f9b033c299b652b2d3228ee6ef4a9c09b7e846ff4b366a2aca68960370234'
            '3212902b0d2bb0e6bacba0feeafd261516b9f6ab5f37f876a8c37239a1947542'
            '6db0b3bb81063f410499a6688a1abbbc5d63af165310ef709924985e5c0d1c4d'
            '7e2e7a8422b8da7b82919752ca96904e84d130425495e647d648793218644f38'
            'ec16edc07aa35dccd5fb6894b964ab304cd7a8c1cc65eed22aa569e9105c7982'
            '07a3dde7fb51f3f84bb51e7c15993dfefa337571ed509cc3588e73c54f606282')

prepare() {
  cd "${srcdir}/${pkgname}"
  cabal configure
  echo "package cardano-crypto-praos" >> ${srcdir}/${pkgname}/cabal.project.local
  echo "  flags: -external-libsodium-vrf" >> ${srcdir}/${pkgname}/cabal.project.local
  cabal clean
  cabal update
}

build() {
  cd "${srcdir}/${pkgname}"
  cabal build all
}

package() {
  install -D -m0644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -D -m0644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  install -D -m0644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -D -m0644 "${srcdir}/${pkgname}.confd" "${pkgdir}/etc/conf.d/${pkgname}"

  install -D -m0644 "mainnet-config.json" "${pkgdir}/var/lib/cardano-node/config/mainnet-config.json"
  install -D -m0644 "mainnet-byron-genesis.json" "${pkgdir}/var/lib/${pkgname}/config/mainnet-byron-genesis.json"
  install -D -m0644 "mainnet-shelley-genesis.json" "${pkgdir}/var/lib/${pkgname}/config/mainnet-shelley-genesis.json"
  install -D -m0644 "mainnet-alonzo-genesis.json" "${pkgdir}/var/lib/${pkgname}/config/mainnet-alonzo-genesis.json"
  install -D -m0644 "mainnet-topology.json" "${pkgdir}/var/lib/${pkgname}/config/mainnet-topology.json"
  install -D -m0644 "testnet-config.json" "${pkgdir}/var/lib/${pkgname}/config/testnet-config.json"
  install -D -m0644 "testnet-byron-genesis.json" "${pkgdir}/var/lib/${pkgname}/config/testnet-byron-genesis.json"
  install -D -m0644 "testnet-shelley-genesis.json" "${pkgdir}/var/lib/${pkgname}/config/testnet-shelley-genesis.json"
  install -D -m0644 "testnet-alonzo-genesis.json" "${pkgdir}/var/lib/${pkgname}/config/testnet-alonzo-genesis.json"
  install -D -m0644 "testnet-topology.json" "${pkgdir}/var/lib/${pkgname}/config/testnet-topology.json"

  install -D -m0644 "${srcdir}/${pkgname}-testnet.service" "${pkgdir}/usr/share/${pkgname}/${pkgname}-testnet-example.service"
  install -D -m0644 "${srcdir}/${pkgname}-testnet.confd" "${pkgdir}/usr/share/${pkgname}/${pkgname}-testnet-example.confd"

  cd "${srcdir}/${pkgname}"
  install -D -m0755 "dist-newstyle/build/x86_64-linux/ghc-${_ghc_version}/cardano-cli-${pkgver}/x/cardano-cli/build/cardano-cli/cardano-cli" "${pkgdir}/usr/bin/cardano-cli"
  install -D -m0755 "dist-newstyle/build/x86_64-linux/ghc-${_ghc_version}/cardano-node-${pkgver}/x/cardano-node/build/cardano-node/cardano-node" "${pkgdir}/usr/bin/cardano-node"
}
