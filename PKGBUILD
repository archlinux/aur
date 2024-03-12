# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

_appname=chain-desktop-wallet
_pkgname=cro-chain-desktop
pkgname="${_pkgname}-bin"
pkgdesc='Crypto.com DeFi Desktop Wallet'
pkgver=1.5.0
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
sha512sums=('750232d8a33b66b4e26dae43a2b0232299601f8ef9db005a0e46b6b3d4c834c1c08c397e3ec274ae4864923c52aad6e9f875836a25d404588ecedcaf276ae3ca')

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
