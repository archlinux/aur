# Maintainer: Serge K <arch@phnx47.net>

_appname=chain-desktop-wallet
_pkgname=cro-chain-desktop
pkgname="${_pkgname}-bin"
pkgdesc='Crypto.com DeFi Desktop Wallet'
pkgver=1.5.1
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
sha512sums=('d103d882e2799046ed8a2cd68cff92a584910e04a28b0f662301c5adbff4be56662dac357c114b7be6a04f0148edbdaeb40c20cbc54472a86256637efbdf5757')

prepare() {
  chmod +x "${_appimg}"
  "./${_appimg}" --appimage-extract

  cd squashfs-root
  sed -e "s/AppRun --no-sandbox/${_appname}/g" -i "${_appname}.desktop"
  sed -e "/X-AppImage-Version/d" -i "${_appname}.desktop"

  rm AppRun resources/app-update.yml
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
