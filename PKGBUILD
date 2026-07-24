# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=lunar-client-bin
_pkgname=lunarclient
pkgver=3.7.12
pkgrel=1
pkgdesc="PvP modpack for all modern versions of Minecraft (upstream AppImage)"
arch=('x86_64')
url="https://lunarclient.com"
license=('LicenseRef-proprietary')
depends=('fuse2' 'xorg-xrandr')
provides=('lunar-client' 'lunarclient')
conflicts=('lunar-client' 'lunarclient')
options=('!strip' '!debug')
# maintained by CI together with pkgver (upstream varies the filename suffix)
_appimage="Lunar%20Client-3.7.12-ow.AppImage"
source=("${_pkgname}-${pkgver}.AppImage::https://launcherupdates.lunarclientcdn.com/${_appimage}")
sha256sums=('7364e876a59291d8b0b7d6c0efdacb988617e35e054e9c21a5814d071710bf98')

prepare() {
  chmod +x "${_pkgname}-${pkgver}.AppImage"
  "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
}

build() {
  # make the .desktop file work outside of the AppImage container
  sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|" \
    "squashfs-root/${_pkgname}.desktop"
  # AppImage directory permissions are 700
  chmod -R a-x+rX squashfs-root/usr
}

package() {
  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" \
    "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"

  install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  install -Dm644 \
    "${srcdir}/squashfs-root/usr/share/icons/hicolor/1024x1024/apps/${_pkgname}.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
