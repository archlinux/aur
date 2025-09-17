# Maintainer: _phaz

# This is my first PKGBUILD - if i'm doing something outrageously stupid, please tell me xD
# https://wiki.archlinux.org/title/User:SergeyK/AppImage_package_guidelines - Very helpful

pkgname=vrchat-photo-manager
pkgver="0.2.6.1"
pkgrel=2
pkgdesc="A photo manager for VRChat"
arch=('x86_64')
url="https://github.com/phaze-the-dumb/VRChat-Photo-Manager"
license=('GPL3')
depends=('hicolor-icon-theme' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')

_appver="0.2.6-hot1"
_appimage="vrcpm-${_appver}.AppImage"

source_x86_64=("${url}/releases/download/${_appver}/${_appimage}")
b2sums_x86_64=("574dcc5c71d38396b51eaacb5cf3523d15fe2c7d0cc8b7736e67907734733bbbe24058d2249827b4ec5a5871a6d8866a03407873f44c14c34ec997c82fff29ae")

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