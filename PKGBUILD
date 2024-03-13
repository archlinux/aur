# Maintainer: <ian.k.armstrong at gmail dot com>

_pkgname=bibliasacra
pkgname=${_pkgname}-appimage
pkgver=1.0.6
pkgrel=1
pkgdesc="A Flutter Bible application with English and Latin versions"
arch=('x86_64')
license=('GPLv3')
depends=('xdg-utils')
url="https://github.com/ika/Biblia_Sacra/releases/download/v${pkgver}"
provides=('bibliasacra')
conflicts=('bibliasacra')
options=(!strip)
_appimage="${_pkgname}-v${pkgver}-${arch}.AppImage"
source=("${url}/${_appimage}")

md5sums=("610e2441de093f1644f3b06be2c4fb8a")

prepare() {
  chmod +x ${_appimage}
  ./${_appimage} --appimage-extract ${_pkgname}.desktop
  ./${_appimage} --appimage-extract ${_pkgname}.png
}

build() {
  # Modify Exec to $_pkgname
  sed -i -E "s|Exec=AppRun|Exec=${_pkgname}|" squashfs-root/${_pkgname}.desktop
}

package() {

  # AppImage
  install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"
	
  # Symlink
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/opt/${_pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
        
  # Desktop
  install -Dm644 "squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
        
  # Icons
  install -dm755 "${HOME}/.local/share/icons"
  xdg-icon-resource install --mode user --novendor --size 128 "squashfs-root/${_pkgname}.png"
  xdg-icon-resource install --mode user --novendor --size 64  "squashfs-root/${_pkgname}.png"
  xdg-icon-resource install --mode user --novendor --size 48  "squashfs-root/${_pkgname}.png"
  xdg-icon-resource install --mode user --novendor --size 32  "squashfs-root/${_pkgname}.png"
  xdg-icon-resource install --mode user --novendor --size 22  "squashfs-root/${_pkgname}.png"
  xdg-icon-resource install --mode user --novendor --size 16  "squashfs-root/${_pkgname}.png"
}
