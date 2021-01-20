# Maintainer: Michał Sałaban <michal@salaban.info>
pkgname=cardano-node
pkgver=1.24.2
pkgrel=1
pkgdesc='The core component that is used to participate in a Cardano decentralised blockchain.'
license=('Apache')
arch=('any')
url='https://github.com/input-output-hk/cardano-node'
_ghc_version='8.10.2'   # NOTE: ghc-libs=8.10.3 contain bugs and fail to build with 
makedepends=('cabal-install-bin' 'ghc=8.10.2' 'ghc-static=8.10.2')
depends=('libsodium')
_config_build="5367762"
source=("https://github.com/input-output-hk/${pkgname}/archive/${pkgver}.zip"
        "https://hydra.iohk.io/build/${_config_build}/download/1/mainnet-config.json"
        "https://hydra.iohk.io/build/${_config_build}/download/1/mainnet-byron-genesis.json"
        "https://hydra.iohk.io/build/${_config_build}/download/1/mainnet-shelley-genesis.json"
        "https://hydra.iohk.io/build/${_config_build}/download/1/mainnet-topology.json"
        "cardano-node.sysusers"
        "cardano-node.tmpfiles"
        "cardano-node.service")
sha256sums=("c3ebea2f25630583bebd659dccad01c24897663206248fa0deacefc6d34c4b7d"
        "9999052dc926506d350cfca2bcfd291e50b48cc7f5215a154c344ad7ad7d70eb"
        "4f28b3b437b2c4f6ee26cc70964b3a5f1a274b0b3909c31535091c00316c13aa"
        "59cd3932c6dd792bc5020ca3336064a8faabde4e4a8dc7d143ff4df6eec36961"
        "7ac2184ff55d1272e87d579550501b7e4fc61b9cf016179ca026516fff365730"
        "88a39a787d801a0f318968612fb781efdb86961d984ac01a13f7e22151d8150f"
        "bedb3eaf9a6315485f54e4021b46d936708b6e199b2e2d1e344eebfff783b237"
        "61ace7b736fb74a367c64f43735c3aca623cc004470995d5114181dde766216b")

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

  install -D -m0644 "mainnet-config.json" "${pkgdir}/var/lib/cardano-node/config/mainnet-config.json"
  install -D -m0644 "mainnet-byron-genesis.json" "${pkgdir}/var/lib/cardano-node/config/mainnet-byron-genesis.json"
  install -D -m0644 "mainnet-shelley-genesis.json" "${pkgdir}/var/lib/cardano-node/config/mainnet-shelley-genesis.json"
  install -D -m0644 "mainnet-topology.json" "${pkgdir}/var/lib/cardano-node/config/mainnet-topology.json"

  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m0755 "dist-newstyle/build/x86_64-linux/ghc-${_ghc_version}/cardano-cli-${pkgver}/x/cardano-cli/build/cardano-cli/cardano-cli" "${pkgdir}/usr/bin/cardano-cli"
  install -D -m0755 "dist-newstyle/build/x86_64-linux/ghc-${_ghc_version}/cardano-node-${pkgver}/x/cardano-node/build/cardano-node/cardano-node" "${pkgdir}/usr/bin/cardano-node"
}
