# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=lunar-client-bin
_pkgname=lunarclient
pkgver=3.7.17
pkgrel=2
pkgdesc="PvP modpack for all modern versions of Minecraft (upstream AppImage)"
arch=('x86_64')
url="https://lunarclient.com"
license=('LicenseRef-proprietary')
depends=('fuse2' 'xorg-xrandr')
provides=('lunar-client' 'lunarclient')
conflicts=('lunar-client' 'lunarclient')
options=('!strip' '!debug')
# maintained by CI together with pkgver (upstream varies the filename suffix)
_appimage="Lunar%20Client-3.7.17-ow.AppImage"
source=("${_pkgname}-${pkgver}.AppImage::https://launcherupdates.lunarclientcdn.com/${_appimage}")
sha256sums=('4d298f99de13941c37f044623c02687d59ad52cbcedb7eab5d5b297db1937470')

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

  # A custom licence has to ship its terms. Lunar Client publishes none in the
  # AppImage, so what goes in is the reference to the terms it is used under.
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
Lunar Client is proprietary software, distributed by Moonsworth, LLC.

It is not covered by a free-software licence: use is governed by the terms
of service the vendor publishes, and redistribution of the AppImage this
package installs is not granted by them.

Terms of service: https://www.lunarclient.com/terms
EOF
}
