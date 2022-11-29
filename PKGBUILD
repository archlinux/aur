# Maintainer: Serge K <arch@phnx47.net>

# https://github.com/phnx47/pkgbuilds

_pkgbin=chain-desktop-wallet
pkgname=cro-chain-desktop
pkgdesc='Crypto.com DeFi Desktop Wallet'
license=('Apache')
url='https://github.com/crypto-com/chain-desktop-wallet'
pkgver=1.3.6
pkgrel=1
arch=('x86_64')
makedepends=('yarn' 'fnm')
conflicts=('cro-chain-desktop-bin')
source=("${_pkgbin}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "chain-desktop-wallet.desktop")
sha512sums=('2d7e801dfa12b0dfe01aba9817b151ec70423eb89cb1a8a343986e251db352ade7b589b773af11bd8fad4acafebf641aabd994e23bbc148a7f21d280f64505d1'
            'f7e4d91d7078a1d627995ffec39b4b67239827dbab0651909238a718ac4538bd6316c8f87430b244b13f617214171d6283ae3b1c268827b3d49f8dead5d2d71a')

build() {
  cd "${_pkgbin}-${pkgver}"

  eval "$(fnm env --shell bash)"
  fnm use --install-if-missing
  yarn install
  yarn electron:build
}

package() {
  install -Dm644 "${_pkgbin}.desktop" "${pkgdir}/usr/share/applications/${_pkgbin}.desktop"

  cd "${_pkgbin}-${pkgver}"

  install -dm755 "${pkgdir}/opt/${_pkgbin}"
  cp -r "dist/linux-unpacked/." "${pkgdir}/opt/${_pkgbin}"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgbin}/${_pkgbin}" "${pkgdir}/usr/bin/${_pkgbin}"

  install -Dm644 "build/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgbin}.png"
}
