# Maintainer: Serge K <arch@phnx47.net>
# Contributor: Stephen Argent <steve [at] tuxcon [dot] com>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

_pkgbin=ledger-live-desktop
_pkgname=ledger-live
pkgname=ledger-live-bin
pkgdesc='Ledger Live - Desktop (AppImage version)'
license=('MIT')
url='https://www.ledger.com/ledger-live'
pkgver=2.50.0
pkgrel=1
arch=('x86_64')
depends=('ledger-udev')
options=(!strip)
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${pkgname}-git")
_appimg="ledger-live-desktop-${pkgver}-linux-${arch[0]}.AppImage"
source=("${_appimg}::https://download.live.ledger.com/${_appimg}"
        "LICENSE::https://raw.githubusercontent.com/LedgerHQ/ledger-live/%40ledgerhq/live-desktop%40${pkgver}/apps/ledger-live-desktop/LICENSE")
sha512sums=('aa8919e89f71eac515c6d20270673ed212214a62a3df54b047430d26d8e8576de5f29fc2b8ab30e8a3e9180fda3576ad7cf346ec271fc9c05c91b40b54642bfe'
            '915edd51fe7732af57f5a4ca8f4c61c4f435de6357e34ed0733cac8d950d80b3a9e513deac0a3672a07f38ff871a57032a221b3aa27edae8e42cc00586fe3318')

build() {
  # Extract files
  chmod +x "${srcdir}/${_appimg}"
  "${srcdir}/${_appimg}" --appimage-extract

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

  for i in 128 256 512 1024; do
    install -d "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps"
    ln -s "/opt/${_pkgname}/usr/share/icons/hicolor/${i}x${i}/apps/${_pkgbin}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${_pkgbin}.png"
  done

  find "${pkgdir}" -type d -exec chmod 755 {} +

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
