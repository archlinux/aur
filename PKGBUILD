# Maintainer: Michał Sałaban <michal@salaban.info>
pkgname=cardano-wallet
_version=2021-01-12
pkgver=20210112
pkgrel=1
pkgdesc='HTTP server & command-line for managing UTxOs and HD wallets in Cardano.'
license=('Apache')
arch=('any')
url='https://github.com/input-output-hk/cardano-wallet'
makedepends=('cabal-install-bin' 'ghc-8.6=8.6.5')
source=("https://github.com/input-output-hk/${pkgname}/archive/v${_version}.zip"
        "arch-ghc.patch")
sha256sums=("6d0862bef1841735ca165e760ef7e56b9c00ec3f06e3f688fb30440ceb88208d"
        "20999e088367d17af437b4843c6c011acf19b82141dff1e3a11d58f66411b86b")

pkgver() {
    echo ${_version} | sed s/-//g
}

build() {
  cd "${srcdir}/${pkgname}-${_version}"
  cabal update
  rm -rf ./arch-build
  mkdir ./arch-build
  patch -p1 < ../arch-ghc.patch
  cabal install cardano-wallet --install-method=copy --installdir=./arch-build
}

package() {
  cd "${srcdir}/${pkgname}-${_version}"
  install -D -m0755 "arch-build/cardano-wallet" "${pkgdir}/usr/bin/cardano-wallet"
  install -D -m0755 "arch-build/shelley-test-cluster" "${pkgdir}/usr/bin/shelley-test-cluster"
}
