# Maintainer: Mylloon <aur@mylloon.fr>

# shellcheck disable=SC2034,SC2148,SC2154

_pkgname=hearthstone-linux-gui

pkgname="${_pkgname}"-appimage
pkgver=0.1.5
pkgrel=1
pkgdesc="Native GTK4 desktop manager for installing, updating, logging into, and launching Hearthstone"
arch=('x86_64')
url="https://github.com/DawnMagnet/hearthstone-linux-gui"
license=('MIT')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
provides=("$pkgname")
conflicts=("$pkgname" "$pkgname-bin")
source_x86_64=(
  "${_appimage}::https://github.com/DawnMagnet/hearthstone-linux-gui/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64.AppImage"
  "https://raw.githubusercontent.com/DawnMagnet/hearthstone-linux-gui/v${pkgver}/LICENSE"
)
noextract=("${_appimage}")
sha256sums_x86_64=(
  'SKIP'
  '87a12c0b367c9dd7e2b1bd3505e8ca085362c5f962c46e39729b1eb4bfce835e'
)

prepare() {
  chmod +x "${_appimage}"
  ./"${_appimage}" --appimage-extract
}

build() {
  chmod -R a-x+rX squashfs-root/usr
}


package() {
  # AppImage
  install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

  # Desktop file
  install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/io.github.hearthstone_linux_gui.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # Icon images
  install -dm755 "${pkgdir}/usr/share/"
  cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

  # Symlink executable
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

  # Symlink license
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
