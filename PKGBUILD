# Maintainer: Michał Sałaban <michal@salaban.info>
pkgname=cardano-wallet
_version=2021-03-04
pkgver=20210304
pkgrel=1
pkgdesc='HTTP server & command-line for managing UTxOs and HD wallets in Cardano.'
license=('Apache')
arch=('any')
url='https://github.com/input-output-hk/cardano-wallet'
makedepends=('cabal-install-bin' 'ghc-8.6=8.6.5')
source=("https://github.com/input-output-hk/${pkgname}/archive/v${_version}.zip"
        "arch-ghc.patch")
sha256sums=("84fcf0aee57d575c35a29b12d084019df5e0e7bee968d4db92ebdb2fa32c933a"
        "4212a64f158529417cb06eaeaffb893fa41457fbe5edd310242f9aec54f2e2ff")

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
}
