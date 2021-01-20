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
source=("https://github.com/input-output-hk/${pkgname}/archive/${pkgver}.zip")
md5sums=('d483c6d27bccc7b463f0b27ed83ec87f')

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
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm0755 "dist-newstyle/build/x86_64-linux/ghc-${_ghc_version}/cardano-cli-${pkgver}/x/cardano-cli/build/cardano-cli/cardano-cli" "$pkgdir/usr/bin/cardano-cli"
  install -Dm0755 "dist-newstyle/build/x86_64-linux/ghc-${_ghc_version}/cardano-node-${pkgver}/x/cardano-node/build/cardano-node/cardano-node" "$pkgdir/usr/bin/cardano-node"
}
