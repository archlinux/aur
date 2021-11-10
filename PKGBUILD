# Maintainer: Sergey M <tz4678@gmail.com>

_pkgname=masscode
pkgname="${_pkgname}-appimage"
pkgver=1.3.0
pkgrel=1
pkgdesc="A free and open source code snippets manager for developers"
arch=(x86_64)
url="https://github.com/antonreshetov/massCode"
license=(GPLv3)
depends=()
makedepends=()
provides=("$_pkgname")
conflicts=()
_filename="massCode-${pkgver}.AppImage"
source=(
  "https://github.com/antonreshetov/massCode/releases/download/v${pkgver}/${_filename}"
)
sha512sums=(SKIP)
# без этих опций не будет работать
noextract=("$_filename")
options=(!strip)

prepare() {
  chmod +x ${_filename}
  ./${_filename} --appimage-extract "${_pkgname}.desktop"
  ./${_filename} --appimage-extract "usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
}

package() {
  sed -ri "s|Exec=AppRun|Exec=/usr/bin/${_pkgname}|" "squashfs-root/${_pkgname}.desktop"
  install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png" \
    -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
  install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm755 "${_filename}" "${pkgdir}/usr/bin/${_pkgname}"
}
