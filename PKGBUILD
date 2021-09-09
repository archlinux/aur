# Maintainer: Michał Sałaban <michal@salaban.info>
pkgname=cardano-wallet
_version=2021-09-09
pkgver=20210909
pkgrel=1
pkgdesc='HTTP server & command-line for managing UTxOs and HD wallets in Cardano.'
license=('Apache')
arch=('any')
url='https://github.com/input-output-hk/cardano-wallet'
makedepends=('cabal-install-bin' 'ghc')
source=("https://github.com/input-output-hk/${pkgname}/archive/v${_version}.zip")
sha256sums=('868247f4a628d0d53ebfcd11bb0969ac2f22aa5579349484b1f3907497d11200')

pkgver() {
    echo ${_version} | sed s/-//g
}

build() {
  cd "${srcdir}/${pkgname}-${_version}"
  cabal update
  cabal configure
  echo "package cardano-crypto-praos" >> ${srcdir}/${pkgname}-${_version}/cabal.project.local
  echo "  flags: -external-libsodium-vrf" >> ${srcdir}/${pkgname}-${_version}/cabal.project.local
  rm -rf ./arch-build
  mkdir ./arch-build
  cabal install cardano-wallet --install-method=copy --installdir=./arch-build
}

package() {
  cd "${srcdir}/${pkgname}-${_version}"
  install -D -m0755 "arch-build/cardano-wallet" "${pkgdir}/usr/bin/cardano-wallet"
}
