# Maintainer: Michał Sałaban <michal@salaban.info>
pkgname=cardano-wallet
_version=2022-01-18
pkgver=20220118
pkgrel=1
pkgdesc='HTTP server & command-line for managing UTxOs and HD wallets in Cardano.'
license=('Apache')
arch=('any')
url='https://github.com/input-output-hk/cardano-wallet'
makedepends=('cabal-install' 'ghc')
source=("https://github.com/input-output-hk/${pkgname}/archive/v${_version}.zip"
        "arch.patch")
sha256sums=('ba787374cbf3fe393293b8036344411a16ae460199d4a2281bd8880cf3a30f3d'
            '08a7bb907e7e4ba7421f693832ff23da71eb11a4b964c86b92feb0ba80360c68')

pkgver() {
    echo ${_version} | sed s/-//g
}

prepare() {
  cd "${srcdir}/${pkgname}-${_version}"
  patch -p1 < ${srcdir}/arch.patch
  cabal update
  cabal configure
  echo "package cardano-crypto-praos" >> ${srcdir}/${pkgname}-${_version}/cabal.project.local
  echo "  flags: -external-libsodium-vrf" >> ${srcdir}/${pkgname}-${_version}/cabal.project.local
}

build() {
  cd "${srcdir}/${pkgname}-${_version}"
  cabal build all
  rm -rf ./arch-build
  mkdir ./arch-build
  cabal install cardano-wallet --install-method=copy --installdir=./arch-build
}

package() {
  cd "${srcdir}/${pkgname}-${_version}"
  install -D -m0755 "arch-build/cardano-wallet" "${pkgdir}/usr/bin/cardano-wallet"
}
