# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

_pkgbin=chain-desktop-wallet
pkgname=cro-chain-desktop
pkgdesc='Crypto.com DeFi Desktop Wallet'
license=('Apache')
url='https://github.com/crypto-com/chain-desktop-wallet'
pkgver=1.4.2
pkgrel=1
arch=('x86_64')
depends=('electron19')
makedepends=('yarn' 'fnm')
source=("${_pkgbin}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${_pkgbin}.desktop"
        "${_pkgbin}.sh")
sha512sums=('432a5d88b312b7d40adf659a2470ada03032537c2770e45f070194392ef287b888dcf635c9d60a251379011ffe4571b9dae89c94b2c9a0e9ac6ef1ee091d0d16'
            'f7e4d91d7078a1d627995ffec39b4b67239827dbab0651909238a718ac4538bd6316c8f87430b244b13f617214171d6283ae3b1c268827b3d49f8dead5d2d71a'
            '8be2a47ec0d4831c7bedc39a0cdbf5eee5d33df1483c2c43202cc661bce3747a14f873e2c6ca7a6e7dc0b2fac74374ede6a8b600dec576c5f8f30ce523c444bd')

_fnm_use() {
  export FNM_DIR="${srcdir}/.fnm"
  eval "$(fnm env --shell bash)"
  fnm use --install-if-missing
}

build() {
  cd "${_pkgbin}-${pkgver}"

  _fnm_use

  yarn install --frozen-lockfile
  yarn electron:build
}

package() {
  install -Dm644 "${_pkgbin}.desktop" "${pkgdir}/usr/share/applications/${_pkgbin}.desktop"
  install -Dm755 "${_pkgbin}.sh" "${pkgdir}/usr/bin/${_pkgbin}"

  cd "${_pkgbin}-${pkgver}"

  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  cp -r "dist/linux-unpacked/resources/app.asar" "${pkgdir}/usr/lib/${pkgname}"

  install -Dm644 "build/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgbin}.png"
}
