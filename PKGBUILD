# Maintainer: _phaz

# This is my first PKGBUILD - if i'm doing something outrageously stupid, please tell me xD
# https://wiki.archlinux.org/title/User:SergeyK/AppImage_package_guidelines - Very helpful

pkgname=vrchat-photo-manager
pkgver="0.2.7.1"
pkgrel=5
pkgdesc="A photo manager for VRChat"
arch=('x86_64')
url="https://github.com/phaze-the-dumb/VRChat-Photo-Manager"
license=('GPL3')
depends=('hicolor-icon-theme' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')

_appver="0.2.7-hot1"
_appimage="vrcpm-${_appver}.AppImage"

source_x86_64=("${url}/releases/download/${_appver}/${_appimage}")
b2sums_x86_64=("4a80d0cf04bc35fdd41a1cdd38019ec7905100321b196eb8ee87f765f2f2af466bb664424d58cba00e922446bb7ad2b1caabe257cdd7173096bd5492991c5b55")

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