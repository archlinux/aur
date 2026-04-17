# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=deta-surf-appimage
_pkgname=deta-surf
pkgver="1.4.6beta0"
_upstream_pkgver=$(sed -E 's/beta/-beta./; s/rc/-rc./' <<<"$pkgver")
pkgrel=3
pkgdesc="Deta Surf browser AppImage"
arch=('x86_64')
url='https://github.com/deta/surf'
license=('Apache-2.0')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'libappindicator-gtk3' 'fuse2')
provides=('deta-surf')
conflicts=('deta-surf')
options=('!strip')
source_x86_64=("Surf-${_upstream_pkgver}.x86_64.AppImage::https://github.com/deta/surf/releases/download/${_upstream_pkgver}/Surf-${_upstream_pkgver}.x86_64.AppImage")
sha512sums_x86_64=('977b11107a7cf3d31cbad6316c3d210403b4d51ecdd8beb9243c8fda0a9275340effe93309e5357b3dece58a2a4c4799195d578500428c052537caea3621995c')
noextract=("Surf-${_upstream_pkgver}.x86_64.AppImage")

prepare() {
  chmod +x "${srcdir}/Surf-${_upstream_pkgver}.x86_64.AppImage"
  rm -rf "${srcdir}/squashfs-root"
  "${srcdir}/Surf-${_upstream_pkgver}.x86_64.AppImage" --appimage-extract
  sed -i -E "s|^Exec=.*|Exec=/usr/bin/${_pkgname} %U|" "${srcdir}/squashfs-root/desktop.desktop"
  sed -i -E "s|^Icon=.*|Icon=${_pkgname}|" "${srcdir}/squashfs-root/desktop.desktop"
}

package() {
  install -d "${pkgdir}/opt/${_pkgname}"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/icons/hicolor/0x0/apps"

  install -Dm755 "${srcdir}/Surf-${_upstream_pkgver}.x86_64.AppImage" "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"
  ln -s "/opt/${_pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/squashfs-root/desktop.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${srcdir}/squashfs-root/desktop.png" "${pkgdir}/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png"
}
