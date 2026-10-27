# Maintainer: Jacob <jacob at skrepr dot com>
pkgname=betaflight-bin
pkgver=2026.6.2
pkgrel=1
pkgdesc="Configuration and management application for Betaflight flight controllers"
arch=('x86_64')
url="https://github.com/betaflight/betaflight-configurator"
license=('GPL-3.0-or-later')
depends=('fuse2' 'zlib' 'hicolor-icon-theme')
provides=('betaflight')
conflicts=('betaflight')
options=('!strip' '!debug')
install="${pkgname}.install"
_appimage="Betaflight-${pkgver}-amd64.AppImage"
source=("${_appimage}::https://github.com/betaflight/betaflight-configurator/releases/download/${pkgver}/${_appimage}")
noextract=("${_appimage}")
sha256sums=('94c09d3652d23437f37b663f5de89fa26c709cd61c718a726c0a5ca2e79cd891')

prepare() {
  cd "${srcdir}"
  chmod +x "${_appimage}"
  rm -rf squashfs-root
  ./"${_appimage}" --appimage-extract >/dev/null
}

package() {
  install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/betaflight-app/betaflight-app.AppImage"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/betaflight-app/betaflight-app.AppImage "${pkgdir}/usr/bin/betaflight-app"

  install -Dm644 "${srcdir}/squashfs-root/Betaflight.desktop" \
    "${pkgdir}/usr/share/applications/betaflight-app.desktop"

  cp -r --no-preserve=mode "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
}
