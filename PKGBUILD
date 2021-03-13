# Maintainer: Michał Sałaban <michal@salaban.info>
pkgname=cardano-node
pkgver=1.25.1
pkgrel=2
pkgdesc='The core component that is used to participate in a Cardano decentralised blockchain.'
license=('Apache')
arch=('any')
url='https://github.com/input-output-hk/cardano-node'
_ghc_version="8.10.4"       # 8.10.3 fails to compile
# NOTE: The build process includes resolution, download and compilation of required libraries.
# However, if you have corresponding haskell-* packages present in the system, the build
# will most likely fail trying to use the installed lib.
# This is probably configurable but I'm not experienced in Haskell. Suggestions are welcome.
makedepends=('cabal-install-bin' 'ghc>=8.10.4')
depends=('libsodium')
_config_build="5367762"
source=("https://github.com/input-output-hk/${pkgname}/archive/${pkgver}.zip"
        "https://hydra.iohk.io/build/${_config_build}/download/1/mainnet-config.json"
        "https://hydra.iohk.io/build/${_config_build}/download/1/mainnet-byron-genesis.json"
        "https://hydra.iohk.io/build/${_config_build}/download/1/mainnet-shelley-genesis.json"
        "https://hydra.iohk.io/build/${_config_build}/download/1/mainnet-topology.json"
        "https://hydra.iohk.io/build/${_config_build}/download/1/testnet-config.json"
        "https://hydra.iohk.io/build/${_config_build}/download/1/testnet-byron-genesis.json"
        "https://hydra.iohk.io/build/${_config_build}/download/1/testnet-shelley-genesis.json"
        "https://hydra.iohk.io/build/${_config_build}/download/1/testnet-topology.json"
        "cardano-node.sysusers"
        "cardano-node.tmpfiles"
        "cardano-node.service"
        "cardano-node-testnet.service")
sha256sums=("946da22e8fbbc587713c6006b70c2e02b3a26c8c173545afe6c15b8b78b25e08"
        "9999052dc926506d350cfca2bcfd291e50b48cc7f5215a154c344ad7ad7d70eb"
        "4f28b3b437b2c4f6ee26cc70964b3a5f1a274b0b3909c31535091c00316c13aa"
        "59cd3932c6dd792bc5020ca3336064a8faabde4e4a8dc7d143ff4df6eec36961"
        "7ac2184ff55d1272e87d579550501b7e4fc61b9cf016179ca026516fff365730"
        "9ed2437e3fe4d65cd865468089dac0460c3a6afd805d5176b2e70f47e4a7e057"
        "dca3139e907bb943bfeff5f186f3fc71217ff12cabde93a926277c6ddd647d87"
        "4e309ad1f7b19d5c442b9250326ef55a70581c5d1bc0f7a056d18ebff31bcfa6"
        "cbcf919b1d2d656ea7512f8ecb12e3c3e3a8db137925abff52d647427f2b154f"
        "703f9b033c299b652b2d3228ee6ef4a9c09b7e846ff4b366a2aca68960370234"
        "1f1260d222715047855cd84e82019d3564456145346b9a5712b533fe2970373c"
        "612025b4071734ab29e90f5cc71cff2868abe4f333d7f60c25d4b5c7f236f43c"
        "a5582d3b712330d0f37fc1488c06f4e2cb75176ffe382c74db9e6c75c3f95f9d")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cabal configure
  echo "package cardano-crypto-praos" >> ${srcdir}/${pkgname}-${pkgver}/cabal.project.local
  echo "  flags: -external-libsodium-vrf" >> ${srcdir}/${pkgname}-${pkgver}/cabal.project.local
  cabal clean
  cabal update
  cabal build all
}

package() {
  install -D -m0644 "${srcdir}/cardano-node.sysusers" "${pkgdir}/usr/lib/sysusers.d/cardano-node.conf"
  install -D -m0644 "${srcdir}/cardano-node.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/cardano-node.conf"
  install -D -m0644 "${srcdir}/cardano-node.service" "${pkgdir}/usr/lib/systemd/system/cardano-node.service"
  install -D -m0644 "${srcdir}/cardano-node-testnet.service" "${pkgdir}/usr/lib/systemd/system/cardano-node-testnet.service"

  install -D -m0644 "mainnet-config.json" "${pkgdir}/var/lib/cardano-node/config/mainnet-config.json"
  install -D -m0644 "mainnet-byron-genesis.json" "${pkgdir}/var/lib/cardano-node/config/mainnet-byron-genesis.json"
  install -D -m0644 "mainnet-shelley-genesis.json" "${pkgdir}/var/lib/cardano-node/config/mainnet-shelley-genesis.json"
  install -D -m0644 "mainnet-topology.json" "${pkgdir}/var/lib/cardano-node/config/mainnet-topology.json"
  install -D -m0644 "testnet-config.json" "${pkgdir}/var/lib/cardano-node/config/testnet-config.json"
  install -D -m0644 "testnet-byron-genesis.json" "${pkgdir}/var/lib/cardano-node/config/testnet-byron-genesis.json"
  install -D -m0644 "testnet-shelley-genesis.json" "${pkgdir}/var/lib/cardano-node/config/testnet-shelley-genesis.json"
  install -D -m0644 "testnet-topology.json" "${pkgdir}/var/lib/cardano-node/config/testnet-topology.json"

  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m0755 "dist-newstyle/build/x86_64-linux/ghc-${_ghc_version}/cardano-cli-${pkgver}/x/cardano-cli/build/cardano-cli/cardano-cli" "${pkgdir}/usr/bin/cardano-cli"
  install -D -m0755 "dist-newstyle/build/x86_64-linux/ghc-${_ghc_version}/cardano-node-${pkgver}/x/cardano-node/build/cardano-node/cardano-node" "${pkgdir}/usr/bin/cardano-node"
}
