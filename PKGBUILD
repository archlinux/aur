# Maintainer: Serge K <arch@phnx47.net>

# https://github.com/phnx47/pkgbuilds

_pkgbin=chain-desktop-wallet
_pkgname=cro-chain-desktop
pkgname=cro-chain-desktop-bin
pkgdesc='Crypto.com DeFi Desktop Wallet (AppImage version)'
license=('Apache')
url='https://github.com/crypto-com/chain-desktop-wallet'
pkgver=1.3.4
pkgrel=1
arch=('x86_64')
provides=('cro-chain-desktop')
conflicts=('cro-chain-desktop')
_appimg="Crypto.com-DeFi-Desktop-Wallet-${pkgver}.AppImage"
source=("${_appimg}::${url}/releases/download/v${pkgver}/${_appimg}"
        "LICENSE::https://raw.githubusercontent.com/crypto-com/chain-desktop-wallet/v${pkgver}/LICENSE")
sha512sums=('2072db8d79ddb7c6de3aa730a3e4f59794b56ff8f987728ea3e77bad679872dc53c37bd17a87973b09bb7fcaf92ff066465a3ef35a715990c6448b1f287dc1d2'
            'e21a90ebc22283c19f4535f263a0297a2428633572ddf19ec515496bd33fe70eacf3c3de63395307cd268330e8325b80e985190b2e92bbbf0079440aa84e89ea')

build() {
  # Extract files
  chmod +x "${srcdir}/${_appimg}"
  ${srcdir}/${_appimg} --appimage-extract

  # Correct .desktop
  sed -e "s/AppRun/${_pkgbin}/g" -i "${srcdir}/squashfs-root/${_pkgbin}.desktop"
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

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
