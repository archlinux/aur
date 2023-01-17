# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

_pkgbin=chain-desktop-wallet
_pkgname=cro-chain-desktop
pkgname=${_pkgname}-bin
pkgdesc='Crypto.com DeFi Desktop Wallet'
license=('Apache')
url='https://github.com/crypto-com/chain-desktop-wallet'
pkgver=1.3.9
pkgrel=1
arch=('x86_64')
provides=("$_pkgname")
conflicts=("$_pkgname")
_appimg="Crypto.com-DeFi-Desktop-Wallet-${pkgver}.AppImage"
source=("${_appimg}::${url}/releases/download/v${pkgver}/${_appimg}")
sha512sums=('e0b63ec704cd05741f394e51a4e4ca4bb4260bd3fb323ea2e69966c0d90290c1fc37652324880051eeae63a2ba8fd43170b04bfb4b2fd550f401c189f894da63')

prepare() {
  # Extract files
  chmod +x "${_appimg}"
  "./${_appimg}" --appimage-extract

  cd squashfs-root
  # Correct .desktop
  sed -e "s/AppRun --no-sandbox/${_pkgbin}/g" -i "${_pkgbin}.desktop"
  sed -e "/X-AppImage-Version/d" -i "${_pkgbin}.desktop"

  # Remove unnecessary files
  rm "AppRun" "resources/app-update.yml"
}

package() {
  install -d "${pkgdir}/opt/${_pkgname}"
  cp -a "${srcdir}/squashfs-root/." "${pkgdir}/opt/${_pkgname}/"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgname}/${_pkgbin}" "${pkgdir}/usr/bin/${_pkgbin}"

  install -d "${pkgdir}/usr/share/applications"
  ln -s "/opt/${_pkgname}/${_pkgbin}.desktop" "${pkgdir}/usr/share/applications/${_pkgbin}.desktop"

  install -d "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
  ln -s "/opt/${_pkgname}/usr/share/icons/hicolor/0x0/apps/${_pkgbin}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgbin}.png"

  find "${pkgdir}" -type d -exec chmod 755 {} +
}
