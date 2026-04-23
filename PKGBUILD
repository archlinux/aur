# Maintainer: PulseSync <contact@pulsesync.dev>

pkgname=pulsesync-bin
pkgver=2.15.1
pkgrel=1
_prefix=builds/app
_branch=beta
pkgdesc="PulseSync desktop app"
arch=('x86_64')
url="https://pulsesync.dev"
license=('custom')
install="${pkgname}.install"
depends=(
  'gtk3'
  'libnotify'
  'nss'
  'libxss'
  'libxtst'
  'xdg-utils'
  'at-spi2-core'
  'util-linux-libs'
  'libsecret'
)
optdepends=('libappindicator-gtk3: tray icon support')
provides=('pulsesync')
conflicts=('pulsesync')
options=('!strip')

_asset_version="2.15.1-beta"
_asset="pulsesync-app-2.15.1-beta-linux-x64.tar.gz"

source=(
  'pulsesync.desktop'
  'pulsesync.xml'
)
source_x86_64=("${_asset}::https://s3.pulsesync.dev/${_prefix}/${_branch}/${_asset}")
sha256sums=('40712fd6e126ebe51de9f7aaa055c044390ab18ab3984048419b7f20c7df9410' 'fb0b48d037e98bdd70c3a5cf0f9587df0a72450245c786f6da80525523c982e1')
sha256sums_x86_64=('23a40f82404e5ede0fcdc061ef5422ce0eeba3c0148afb5e2fd8f39aae728556')

package() {
  install -dm755 "${pkgdir}"
  cp -a "${srcdir}/opt" "${pkgdir}/"

  for executable in "${pkgdir}/opt/PulseSync/pulsesync" "${pkgdir}/opt/PulseSync/chrome-sandbox" "${pkgdir}/opt/PulseSync/chrome_crashpad_handler"; do
    [[ -f "${executable}" ]] && chmod 755 "${executable}"
  done

  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/opt/PulseSync/pulsesync" "${pkgdir}/usr/bin/pulsesync"
  install -Dm644 "${srcdir}/pulsesync.desktop" "${pkgdir}/usr/share/applications/pulsesync.desktop"
  install -Dm644 "${srcdir}/pulsesync.xml" "${pkgdir}/usr/share/mime/packages/pulsesync.xml"
  install -Dm644 "${pkgdir}/opt/PulseSync/resources/assets/icon/App.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/pulsesync.png"
  install -Dm644 "${pkgdir}/opt/PulseSync/resources/assets/pext/pext.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/mimetypes/application-x-pext.png"
}
