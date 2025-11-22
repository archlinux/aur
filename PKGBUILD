# Maintainer: _phaz

# This is my first PKGBUILD - if i'm doing something outrageously stupid, please tell me xD
# https://wiki.archlinux.org/title/User:SergeyK/AppImage_package_guidelines - Very helpful

pkgname=vrchat-photo-manager
pkgver="0.2.7"
pkgrel=4
pkgdesc="A photo manager for VRChat"
arch=('x86_64')
url="https://github.com/phaze-the-dumb/VRChat-Photo-Manager"
license=('GPL3')
depends=('hicolor-icon-theme' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')

_appver="0.2.7"
_appimage="vrcpm-${_appver}.AppImage"

source_x86_64=("${url}/releases/download/${_appver}/${_appimage}")
b2sums_x86_64=("0a252b1943d7abca0052e9b66d4fbe382ae13b22d04ad6cadeb5f8c7025a04e193802a64010300cb4095d1fa4c24698139165a24d62da36f5b5ab4ef0e0af3f6")

prepare() {
  chmod +x "${_appimage}"
  ./"${_appimage}" --appimage-extract
}

build() {
  # Adjust .desktop so it will work outside of AppImage container
  sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/VRChatPhotoManager|"\
      "squashfs-root/VRChat Photo Manager.desktop"
  # Fix permissions; .AppImage permissions are 700 for all directories
  chmod -R a-x+rX squashfs-root/usr
}

package() {
  # AppImage
  install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

  # Desktop file
  install -Dm644 "${srcdir}/squashfs-root/VRChat Photo Manager.desktop"\
          "${pkgdir}/usr/share/applications/VRChat Photo Manager.desktop"

  # Icon images
  install -dm755 "${pkgdir}/usr/share/"
  cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

  # Symlink executable
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/VRChatPhotoManager"
}