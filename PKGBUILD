# Contributor: Barfin
# Maintainer: Vyacheslav Razykov <v.razykov@gmail.com>

_name=outline-client
pkgname=${_name}-appimage
pkgver=1.13.1
pkgrel=6
pkgdesc="The Outline clients use the popular Shadowsocks protocol, and lean on the Cordova and Electron frameworks."
arch=(x86_64)
conflicts=('outline-client-appimage-wayland' 'outline-client-appimage-git')
url="https://getoutline.org"
license=("Apache-2.0")

_appimage="Outline-Client_${pkgver}.AppImage"
source=("${_appimage}::https://s3.amazonaws.com/outline-releases/client/linux/${pkgver}/1/Outline-Client.AppImage"
        "${pkgname}.install")
options=('!strip' '!debug')
depends=('fuse2' 'nss')
install=${pkgname}.install

sha512sums=('5a3aa5c08f1f89dab6839f462ea90e65cd8278bed7ac34deea3d2e0a5330dd54c6ae9cb2e4d418b18f8effdfb3c1a48c0db4d61c07cc48dbaecf3c4da68ad181'
            'a1704e707b0b0a927fae068647eccb426bb51ad2081d27ee18e8991949e9135d28fe502d1a1dba27d333025edd235614b195758d14be2d0eeb97172bea851ddd')

prepare() {
  chmod +x "${_appimage}"

  # Extract files from AppImage
  ./${_appimage} --appimage-extract usr/share/icons/hicolor > /dev/null
  ./${_appimage} --appimage-extract outline-apps.desktop > /dev/null
}

build() {
  # Configuring .desktop for work outside of AppImage container
  sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_name}|"\
    "squashfs-root/outline-apps.desktop"

  # Fix permissions
  chmod -R a-x+rX squashfs-root/usr
}

package() {
  # AppImage
  install -Dm755 "${_appimage}" "${pkgdir}/opt/${_name}/Outline-Client.AppImage"

  # Desktop file
  install -Dm644 "squashfs-root/outline-apps.desktop"\
          "${pkgdir}/usr/share/applications/${_name}.desktop"

  # Icon images
  install -dm755 "${pkgdir}/usr/share/"
  cp -a "squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

  # Symlink executable
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${_name}/Outline-Client.AppImage" "${pkgdir}/usr/bin/${_name}"

  # Symlink perl shasum
  ln --symbolic "/usr/bin/core_perl/shasum" "${pkgdir}/usr/bin/shasum"
}

