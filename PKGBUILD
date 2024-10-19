# Maintainer: DuckSoft <realducksoft at gmail dot com>
_name=outline-manager
pkgname=${_name}-appimage
pkgver=1.15.2
pkgrel=2
pkgdesc="Creates and manages Outline servers, powered by Shadowsocks."
arch=('x86_64')
url="https://github.com/Jigsaw-Code/outline-server"
license=('Apache')
makedepends=('git')
options=(!strip)
provides=(${_name})
conficts=(${_name})
# See https://github.com/Jigsaw-Code/outline-releases/blob/master/manager/latest-linux.yml
_app_image="Outline-Manager-v${pkgver}.AppImage"
source=("${_app_image}::https://s3.amazonaws.com/outline-releases/manager/linux/${pkgver}/1/Outline-Manager.AppImage")
sha256sums=('ff6ffc93f734b01224cf950abb209056a692e38ce1b599a107cc53c1cbd94f1e')

prepare() {
  chmod +x ${_app_image}
  ./${_app_image} --appimage-extract usr/share/icons/hicolor > /dev/null
  ./${_app_image} --appimage-extract ${_name}.desktop > /dev/null

  sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_name}|"\
        "squashfs-root/${_name}.desktop"
}


package() {
 cd squashfs-root
 find "usr/share/icons/hicolor" -type f -exec install -Dm644 "{}" "${pkgdir}/{}" \;
 install -Dm644 "${_name}.desktop" "${pkgdir}/usr/share/applications/${_name}.desktop"
 cd ${srcdir}

 install -Dm755 -t "$pkgdir/opt/${_name}/" "$srcdir/${_app_image}"
 mkdir -p "$pkgdir/usr/bin"
 ln -sf "/opt/${_name}/${_app_image}" "$pkgdir/usr/bin/${_name}"
}
