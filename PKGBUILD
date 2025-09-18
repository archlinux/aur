# Maintainer: Serge K <arch@phnx47.net>
# Contributor: Stephen Argent <steve [at] tuxcon [dot] com>

_appname=ledger-live-desktop
_pkgname=ledger-live
pkgname="${_pkgname}-bin"
pkgver=2.128.1
pkgrel=1
pkgdesc='Maintain your Ledger devices'
license=('MIT')
url='https://www.ledger.com/ledger-live'
arch=('x86_64')
depends=('gtk3' 'nss' 'alsa-lib' 'ledger-udev')
options=('!strip')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_appimg="ledger-live-desktop-${pkgver}-linux-${arch[0]}.AppImage"
source=("${_appimg}::https://download.live.ledger.com/${_appimg}"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/LedgerHQ/ledger-live/refs/tags/%40ledgerhq/live-desktop%40${pkgver}/apps/ledger-live-desktop/LICENSE")
# https://www.ledger.com/ledger-live/lld-signatures
sha512sums=('b28ce34c7c9a83b1ca65d89c3a0e1d20f7789bb26aa5a1063bf8873b0d375e1b5cfaf2ffd83851654c94a52c8428440f936a58c60e3f74999d426c4ffe368206'
            '915edd51fe7732af57f5a4ca8f4c61c4f435de6357e34ed0733cac8d950d80b3a9e513deac0a3672a07f38ff871a57032a221b3aa27edae8e42cc00586fe3318')

prepare() {
  chmod +x "${_appimg}"
  "./${_appimg}" --appimage-extract

  cd squashfs-root
  sed -e "s/AppRun --no-sandbox/${_appname}/g" -i "${_appname}.desktop"
  sed -e "/X-AppImage-Version/d" -i "${_appname}.desktop"

  rm "AppRun" "resources/app-update.yml"
}

package() {
  install -d "${pkgdir}/opt/${_pkgname}"
  cp -a "squashfs-root/." "${pkgdir}/opt/${_pkgname}/"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgname}/${_appname}" "${pkgdir}/usr/bin/"

  install -d "${pkgdir}/usr/share/applications"
  ln -s "/opt/${_pkgname}/${_appname}.desktop" "${pkgdir}/usr/share/applications/"

  for i in 128 256 512 1024; do
    install -d "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps"
    ln -s "/opt/${_pkgname}/usr/share/icons/hicolor/${i}x${i}/apps/${_appname}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/"
  done

  find "${pkgdir}" -type d -exec chmod 755 {} +

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
