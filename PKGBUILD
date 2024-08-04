# Contributor: Barfin
# Maintainer: Vyacheslav Razykov <v.razykov@gmail.com>

_name=outline-client
pkgname=${_name}-appimage
pkgver=1.13.1
pkgrel=4
pkgdesc="The Outline clients use the popular Shadowsocks protocol, and lean on the Cordova and Electron frameworks."
arch=(x86_64)
conflicts=('outline-client-appimage-wayland' 'outline-client-appimage-git')
url="https://getoutline.org"
license=("Apache License 2.0")

_app_image="Outline-Client_${pkgver}.AppImage"
source=("${_app_image}::https://s3.amazonaws.com/outline-releases/client/linux/stable/Outline-Client.AppImage"
        "${pkgname}.install")
options=('!strip' '!debug')
depends=('fuse2' 'nss')
install=${pkgname}.install

prepare() {
  chmod +x ${_app_image}
  ./${_app_image} --appimage-extract usr/share/icons/hicolor > /dev/null
  ./${_app_image} --appimage-extract outline-apps.desktop > /dev/null

  sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_name}|"\
        "squashfs-root/outline-apps.desktop"
}

package() {
  install -Dm755 "${_app_image}" "${pkgdir}/opt/${_name}/Outline-Client.AppImage"

  cd squashfs-root
  find "usr/share/icons/hicolor" -type f -exec install -Dm644 "{}" "${pkgdir}/{}" \;
  install -Dm644 "outline-apps.desktop" "${pkgdir}/usr/share/applications/${_name}.desktop"
  cd ${srcdir}

  mkdir --parents "${pkgdir}/usr/bin/"
  ln --symbolic "/opt/outline-client/Outline-Client.AppImage" "${pkgdir}/usr/bin/${_name}"
  ln --symbolic "/usr/bin/core_perl/shasum" "${pkgdir}/usr/bin/shasum"
}

sha512sums=('5a3aa5c08f1f89dab6839f462ea90e65cd8278bed7ac34deea3d2e0a5330dd54c6ae9cb2e4d418b18f8effdfb3c1a48c0db4d61c07cc48dbaecf3c4da68ad181'
            'a1704e707b0b0a927fae068647eccb426bb51ad2081d27ee18e8991949e9135d28fe502d1a1dba27d333025edd235614b195758d14be2d0eeb97172bea851ddd')
