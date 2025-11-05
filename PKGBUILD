# Maintainer: Serge K <arch@phnx47.net>
# Contributor: Stephen Argent <steve [at] tuxcon [dot] com>

_appname=ledger-live-desktop
_pkgname=ledger-live
pkgname="${_pkgname}-bin"
pkgver=2.132.0
pkgrel=1
pkgdesc='Maintain your Ledger devices'
license=('MIT')
url='https://www.ledger.com/ledger-live'
arch=('x86_64')
depends=('gtk3' 'nss' 'alsa-lib' 'ledger-udev')
makedepends=('desktop-file-utils')
options=('!strip')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_appimg="ledger-live-desktop-${pkgver}-linux-${arch[0]}.AppImage"
source=("${_appimg}::https://download.live.ledger.com/${_appimg}"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/LedgerHQ/ledger-live/refs/tags/%40ledgerhq/live-desktop%40${pkgver}/apps/ledger-live-desktop/LICENSE")
# https://www.ledger.com/ledger-live/lld-signatures
sha512sums=('6e917e398bf133c1b4d63e665c1dd060656de2eced9817d238d87c14ea29a18217d95ed1295b6ce4cd8158d6bd99ec7d9d65d0d8842950a1ef18662c0a77c869'
            '915edd51fe7732af57f5a4ca8f4c61c4f435de6357e34ed0733cac8d950d80b3a9e513deac0a3672a07f38ff871a57032a221b3aa27edae8e42cc00586fe3318')

prepare() {
  chmod +x "${_appimg}"
  "./${_appimg}" --appimage-extract

  cd squashfs-root
  desktop-file-edit \
    --set-key=Exec \
    --set-value="${_appname} %U" \
    --add-category=Network \
    --remove-key=X-AppImage-Version \
    "${_appname}.desktop"

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
