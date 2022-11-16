# Maintainer: Serge K <arch@phnx47.net>

# https://github.com/phnx47/pkgbuilds

_pkgbin=chain-desktop-wallet
pkgname=cro-chain-desktop
pkgdesc='Crypto.com DeFi Desktop Wallet'
license=('Apache')
url='https://github.com/crypto-com/chain-desktop-wallet'
pkgver=1.3.5
pkgrel=1
arch=('x86_64')
makedepends=('yarn' 'fnm')
provides=('cro-chain-desktop')
conflicts=('cro-chain-desktop-bin')
source=("${_pkgbin}-${pkgver}.tar.gz::https://github.com/crypto-com/chain-desktop-wallet/archive/refs/tags/v${pkgver}.tar.gz"
        "chain-desktop-wallet.desktop")
sha512sums=('2aa23d712eb3e71be7969d0070bbbe809869c3a4377eef89308163e7727a6ed3215cb7479fb3149e3daaf88c91d1aebbaf74cec0ff0709815d79a3b790341db2'
            '396b7e061b2e701d10951f006a5ff0814bf71d1d513698d491c4e41748a165d6ceef020e455c889891cd445e6d3ecbaebe3d080420efd3607035a91ac857e065')

build() {
  cd ${_pkgbin}-${pkgver}

  eval "$(fnm env --shell bash)"
  fnm use --install-if-missing
  yarn install
  yarn electron:build
}

package() {
  install -Dm644 "${_pkgbin}.desktop" "${pkgdir}/usr/share/applications/${_pkgbin}.desktop"

  cd ${_pkgbin}-${pkgver}

  install -dm755 "${pkgdir}/opt"
  cp -r "dist/linux-unpacked" "${pkgdir}/opt/${_pkgbin}"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgbin}/${_pkgbin}" "${pkgdir}/usr/bin/${_pkgbin}"

  install -Dm644 "build/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgbin}.png"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
