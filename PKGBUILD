# Contributor: Barfin
# Maintainer: Vyacheslav Razykov <v.razykov@gmail.com>

_name=outline-client
pkgname=${_name}-appimage
pkgver=1.19.0
pkgrel=1
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

sha512sums=('cb385e59b4fdf617a86210362c978224e50fe13364eeeb2a2503fa84b11e690e8c7c8fdd8c493d7ff1cb1f1211b7e72565f89a090b5cbf1701d421b21d0118ec'
            'a1704e707b0b0a927fae068647eccb426bb51ad2081d27ee18e8991949e9135d28fe502d1a1dba27d333025edd235614b195758d14be2d0eeb97172bea851ddd')

prepare() {
  chmod +x "${_appimage}"

  # Extract files from AppImage
  ./${_appimage} --appimage-extract usr/share/icons/hicolor > /dev/null
  ./${_appimage} --appimage-extract Outline.desktop > /dev/null
}

build() {
  # Configuring .desktop for work outside of AppImage container
  sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_name}|"\
    "squashfs-root/Outline.desktop"

  # Fix permissions
  chmod -R a-x+rX squashfs-root/usr
}

package() {
  # AppImage
  install -Dm755 "${_appimage}" "${pkgdir}/opt/${_name}/Outline-Client.AppImage"

  # Desktop file
  install -Dm644 "squashfs-root/Outline.desktop"\
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

