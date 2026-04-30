# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=deta-surf-appimage
_pkgname=deta-surf
pkgver="1.4.7beta0"
_upstream_pkgver=$(sed -E 's/beta/-beta./; s/rc/-rc./' <<<"$pkgver")
pkgrel=1
pkgdesc="Deta Surf browser AppImage"
arch=('x86_64')
url='https://github.com/deta/surf'
license=('Apache-2.0')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'libappindicator-gtk3' 'fuse2')
provides=('deta-surf')
conflicts=('deta-surf')
options=('!strip')
source_x86_64=("Surf-1.4.7-beta.0.x86_64.AppImage::https://github.com/deta/surf/releases/download/1.4.7-beta.0/Surf-1.4.7-beta.0.x86_64.AppImage")
sha512sums_x86_64=('3d8ef503c9915b31bfe9fd870bf1e3d2c63676bb73e549c12ca0eecc60dd192441754984e02cf2537b5f0b64e59be895b85250d1e873930f5df9978dac513de9')
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
