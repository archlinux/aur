# Maintainer: Mike Simpson <voiden.t2tan@aleeas.com>
_pkgname=voiden

pkgname=${_pkgname}-appimage
pkgver=2.0.1
pkgrel=1
pkgdesc="Voiden API Client"
arch=('x86_64')
url="https://voiden.md"
license=('Apache-2.0')
options=('!strip' '!debug') # will not function if makepkg is allowed to strip chars from binary
depends=('fuse2')
conflicts=('voiden-beta-appimage')
_appimage=Voiden-${pkgver}.AppImage
source=("https://voiden.md/api/download/stable/linux/x64/${_appimage}")
sha256sums=('02ec86a453926e43bc656af2cbc859e1d6a57ac27a997457c9063304f77e2d0a')

# install method based on https://wiki.archlinux.org/title/User:SergeyK/AppImage_package_guidelines

prepare() {
  chmod +x "${_appimage}"
  ./"${_appimage}" --appimage-extract
}

build() {
  # Adjust .desktop so it will work outside of AppImage container
  sed -i -E "s|Exec=Voiden.*|Exec=/usr/bin/${pkgname}|" \
    "${srcdir}/squashfs-root/Voiden.desktop"
}

package() {
  # Install AppImage File and License
  install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${_appimage}"
  install -Dm644 "${srcdir}/squashfs-root/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

  # Desktop file
  install -Dm644 "${srcdir}/squashfs-root/Voiden.desktop" \
    "${pkgdir}/usr/share/applications/Voiden.desktop"

  # installs the one valid icon in the appimage
  install -Dm644 "${srcdir}/squashfs-root/resources/logo-dark.png" "${pkgdir}/usr/share/pixmaps/Voiden.png"

  # For later if they actually replace the electron icons with actual images
  # install -dm755 "${pkgdir}/usr/share"
  # cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

  # Symlink executable - use pkgname so it doesn't conflict with voiden cli tool
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${_appimage}" "${pkgdir}/usr/bin/${pkgname}"

  # Symlink license
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  ln -s "/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}
