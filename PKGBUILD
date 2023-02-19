# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

_pkgbin=chain-desktop-wallet
pkgname=cro-chain-desktop
pkgdesc='Crypto.com DeFi Desktop Wallet'
license=('Apache')
url='https://github.com/crypto-com/chain-desktop-wallet'
pkgver=1.4.0
pkgrel=1
arch=('x86_64')
makedepends=('yarn' 'fnm')
source=("${_pkgbin}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "chain-desktop-wallet.desktop")
sha512sums=('0d4992e5739e5dbe652fd53b592da53041dc06799046472ac8ce3e1db5b280a7e9672fea5ec56ed24076dbca4d4ac775300d37d248015ce8ab2d2d34319c2313'
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
