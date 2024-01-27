# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

_appname=chain-desktop-wallet
_pkgname=cro-chain-desktop
pkgname="${_pkgname}-bin"
pkgdesc='Crypto.com DeFi Desktop Wallet'
pkgver=1.4.8
pkgrel=1
arch=('x86_64')
url='https://github.com/crypto-com/chain-desktop-wallet'
license=('Apache')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')
depends=('gtk3' 'nss' 'alsa-lib')
_appimg="Crypto.com-DeFi-Desktop-Wallet-${pkgver}.AppImage"
source=("${_appimg}::${url}/releases/download/v${pkgver}/${_appimg}")
sha512sums=('038d55d8e1ebb3d61ce5369104ee6ea151c0358842d04a3b7dd530f9dc35d2ea440a85ea38056cebe1fc8c0814760af3ae90d6055179c446618a35b201856750')

prepare() {
  # Extract files
  chmod +x "${_appimg}"
  "./${_appimg}" --appimage-extract

  cd squashfs-root
  # Correct .desktop
  sed -e "s/AppRun --no-sandbox/${_appname}/g" -i "${_appname}.desktop"
  sed -e "/X-AppImage-Version/d" -i "${_appname}.desktop"

  # Remove unnecessary files
  rm "AppRun" "resources/app-update.yml"
}

package() {
  install -d "${pkgdir}/opt/${_pkgname}"
  cp -a "${srcdir}/squashfs-root/." "${pkgdir}/opt/${_pkgname}/"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgname}/${_appname}" "${pkgdir}/usr/bin/${_appname}"

  install -d "${pkgdir}/usr/share/"{applications,pixmaps}
  ln -s "/opt/${_pkgname}/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"
  ln -s "/opt/${_pkgname}/usr/share/icons/hicolor/0x0/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${_appname}.png"

  find "${pkgdir}" -type d -exec chmod 755 {} +
}
