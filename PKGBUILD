# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

_pkgbin=chain-desktop-wallet
pkgname=cro-chain-desktop
pkgdesc='Crypto.com DeFi Desktop Wallet'
license=('Apache')
url='https://github.com/crypto-com/chain-desktop-wallet'
pkgver=1.3.8
pkgrel=1
arch=('x86_64')
makedepends=('yarn' 'fnm')
source=("${_pkgbin}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "chain-desktop-wallet.desktop")
sha512sums=('8eadaf138d64df72bb66cabd291039e0bb76cd0b32a22b1fb6149f8da0701584e3f0b631e79248952ae739db3f01bffa2b3d2c96388edf51fe05b61cd197964b'
            'f7e4d91d7078a1d627995ffec39b4b67239827dbab0651909238a718ac4538bd6316c8f87430b244b13f617214171d6283ae3b1c268827b3d49f8dead5d2d71a')

prepare() {
  cd "${_pkgbin}-${pkgver}"

  eval "$(fnm env --shell bash)"
  fnm use --install-if-missing
}

build() {
  cd "${_pkgbin}-${pkgver}"

  yarn install
  yarn electron:build
}

package() {
  install -Dm644 "${_pkgbin}.desktop" "${pkgdir}/usr/share/applications/${_pkgbin}.desktop"

  cd "${_pkgbin}-${pkgver}"

  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -r "dist/linux-unpacked/." "${pkgdir}/opt/${pkgname}"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${_pkgbin}" "${pkgdir}/usr/bin/${_pkgbin}"

  install -Dm644 "build/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgbin}.png"
}
