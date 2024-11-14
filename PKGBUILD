# Maintainer: Serge K <arch@phnx47.net>
# Contributor: Stephen Argent <steve [at] tuxcon [dot] com>

_pkgbin=ledger-live-desktop
_pkgname=ledger-live
pkgname="${_pkgname}-bin"
pkgdesc='Maintain your Ledger devices'
license=('MIT')
url='https://www.ledger.com/ledger-live'
pkgver=2.92.0
pkgrel=1
arch=('x86_64')
depends=('gtk3' 'nss' 'alsa-lib' 'ledger-udev')
options=('!strip')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_appimg="ledger-live-desktop-${pkgver}-linux-${arch[0]}.AppImage"
source=("${_appimg}::https://download.live.ledger.com/${_appimg}"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/LedgerHQ/ledger-live/%40ledgerhq/live-desktop%40${pkgver}/apps/ledger-live-desktop/LICENSE")
# https://www.ledger.com/ledger-live/lld-signatures
sha512sums=('8d53ab939aaed223beff0c445d28fe2dd9bfe50d40a3ec232aa89973d7c7f1bcc0fd530945c9c442a8adfb9b506a1d11fa9fcf792166d34b8fcb7f5987c3908c'
            '915edd51fe7732af57f5a4ca8f4c61c4f435de6357e34ed0733cac8d950d80b3a9e513deac0a3672a07f38ff871a57032a221b3aa27edae8e42cc00586fe3318')

prepare() {
  chmod +x "${_appimg}"
  "./${_appimg}" --appimage-extract

  cd squashfs-root
  sed -e "s/AppRun --no-sandbox/${_pkgbin}/g" -i "${_pkgbin}.desktop"
  sed -e "/X-AppImage-Version/d" -i "${_pkgbin}.desktop"

  rm "AppRun" "resources/app-update.yml"
}

package() {
  install -d "${pkgdir}/opt/${_pkgname}"
  cp -a "squashfs-root/." "${pkgdir}/opt/${_pkgname}/"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgname}/${_pkgbin}" "${pkgdir}/usr/bin/"

  install -d "${pkgdir}/usr/share/applications"
  ln -s "/opt/${_pkgname}/${_pkgbin}.desktop" "${pkgdir}/usr/share/applications/"

  for i in 128 256 512 1024; do
    install -d "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps"
    ln -s "/opt/${_pkgname}/usr/share/icons/hicolor/${i}x${i}/apps/${_pkgbin}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/"
  done

  find "${pkgdir}" -type d -exec chmod 755 {} +

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
