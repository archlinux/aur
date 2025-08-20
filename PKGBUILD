# Maintainer: _phaz

# This is my first PKGBUILD - if i'm doing something outrageously stupid, please tell me xD
# https://wiki.archlinux.org/title/User:SergeyK/AppImage_package_guidelines - Very helpful

pkgname=vrchat-photo-manager
pkgver=0.2.6
pkgrel=1
pkgdesc="Description of your app"
arch=('x86_64')
url="https://github.com/phaze-the-dumb/VRChat-Photo-Manager"
license=('GPL3')
depends=('hicolor-icon-theme' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')

_appimage="vrcpm-${pkgver}.AppImage"

source_x86_64=("${url}/releases/download/${pkgver}/${_appimage}")
b2sums_x86_64=("4cc900de56f7bd55cc076d0717e57ef77952e87a26113ac94ce3bec345bfa9f842d21c6d97cc13f4c79cd095af967f0ed67a140caeddcd635b0ea2fa7f424b77")

prepare() {
  chmod +x "${_appimage}"
  ./"${_appimage}" --appimage-extract
}

build() {
  # Adjust .desktop so it will work outside of AppImage container
  sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/VRChatPhotoManager|"\
      "squashfs-root/VRChatPhotoManager.desktop"
  # Fix permissions; .AppImage permissions are 700 for all directories
  chmod -R a-x+rX squashfs-root/usr
}

package() {
  # AppImage
  install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

  # Desktop file
  install -Dm644 "${srcdir}/squashfs-root/VRChatPhotoManager.desktop"\
          "${pkgdir}/usr/share/applications/VRChatPhotoManager.desktop"

  # Icon images
  install -dm755 "${pkgdir}/usr/share/"
  cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

  # Symlink executable
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/VRChatPhotoManager"
}