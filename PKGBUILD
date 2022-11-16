# Maintainer: Serge K <arch@phnx47.net>
# Contributor: Stephen Argent <steve [at] tuxcon [dot] com>

# https://github.com/phnx47/pkgbuilds

_pkgbin=ledger-live-desktop
pkgname=ledger-live-bin
pkgdesc='Ledger Live - Desktop (AppImage version)'
license=('MIT')
url='https://www.ledger.com/ledger-live'
pkgver=2.49.2
pkgrel=1
arch=('x86_64')
depends=('ledger-udev')
options=(!strip)
provides=('ledger-live')
conflicts=('ledger-live' 'ledger-live-git')
_appimg="ledger-live-desktop-${pkgver}-linux-${arch[0]}.AppImage"
source=("${_appimg}::https://download.live.ledger.com/${_appimg}"
        "LICENSE::https://raw.githubusercontent.com/LedgerHQ/ledger-live/%40ledgerhq/live-desktop%40${pkgver}/apps/ledger-live-desktop/LICENSE")
sha512sums=('abffeb467f70045221a42768c103234f5c39344b3a28af18c0e85ddad1d0df404fa7e4e487e4f1651b85f0851f03ac8cc30ab697453ae32dde8eeaf9c5ff9465'
            '915edd51fe7732af57f5a4ca8f4c61c4f435de6357e34ed0733cac8d950d80b3a9e513deac0a3672a07f38ff871a57032a221b3aa27edae8e42cc00586fe3318')

build() {
  # Extract files
  chmod +x "${srcdir}/${_appimg}"
  "${srcdir}/${_appimg}" --appimage-extract

  # Correct .desktop
  sed -e "s/AppRun/${_pkgbin}/g" -i "${srcdir}/squashfs-root/${_pkgbin}.desktop"
}

package() {
  install -d "${pkgdir}/opt/${_pkgbin}"
  cp -a "${srcdir}/squashfs-root/." "${pkgdir}/opt/${_pkgbin}/"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgbin}/${_pkgbin}" "${pkgdir}/usr/bin/${_pkgbin}"

  install -d "${pkgdir}/usr/share/applications"
  ln -s "/opt/${_pkgbin}/${_pkgbin}.desktop" "${pkgdir}/usr/share/applications/${_pkgbin}.desktop"

  install -d "${pkgdir}/usr/share/icons/hicolor/"{"128x128","256x256","512x512","1024x1024"}"/apps"
  ln -s "/opt/${_pkgbin}/usr/share/icons/hicolor/128x128/apps/${_pkgbin}.png"  "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgbin}.png"
  ln -s "/opt/${_pkgbin}/usr/share/icons/hicolor/256x256/apps/${_pkgbin}.png"  "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgbin}.png"
  ln -s "/opt/${_pkgbin}/usr/share/icons/hicolor/512x512/apps/${_pkgbin}.png"  "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgbin}.png"
  ln -s "/opt/${_pkgbin}/usr/share/icons/hicolor/1024x1024/apps/${_pkgbin}.png"  "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${_pkgbin}.png"

  find "${pkgdir}" -type d -exec chmod 755 {} +

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
