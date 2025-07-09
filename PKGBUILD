# Maintainer: shinka <shinnkka1@gmail.com>

pkgname=animeko-appimage
_pkgname=animeko
pkgver="4.11.1"
pkgrel=2
pkgdesc='集找番、追番、看番的一站式弹幕追番平台'
arch=('x86_64')
url='https://github.com/open-ani/animeko/'
license=('AGPL-3.0-or-later')
source_x86_64=("https://d.myani.org/v${pkgver//_/-}/ani-${pkgver//_/-}-linux-${CARCH}.appimage")
sha512sums_x86_64=('abb373fd2a0637a40178645362f302f20890def5a7100bbd34b0063f408cb57194c0a5fa2753d00bfa5a5991dac1014c87b93b2dc33d9b01f18a80b29b742931')
depends=('vlc-plugin-ffmpeg' 'gvfs')
conflicts=('animeko')
provides=('animeko')
makedepends=('7zip')
options=('!strip')

prepare() {
  chmod +x "${srcdir}/ani-${pkgver//_/-}-linux-${CARCH}.appimage"
  7z x ${srcdir}/ani-${pkgver//_/-}-linux-${CARCH}.appimage -o${srcdir}/squashfs-root
  sed -i -E "s|Exec=Ani|Exec=/usr/bin/${_pkgname}|g" "${srcdir}/squashfs-root/${_pkgname}.desktop"
  sed -i -E "s|Icon=icon|Icon=${_pkgname}|g" "${srcdir}/squashfs-root/${_pkgname}.desktop"
}

package() {
  install -d "${pkgdir}/opt/${_pkgname}"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
  install -d "${pkgdir}/usr/share/applications"
  rm -r "${srcdir}/squashfs-root/usr/lib/app/resources"
  cp -r "${srcdir}/squashfs-root/usr" "${pkgdir}/opt/${_pkgname}/"

  install -Dm755 "${srcdir}/squashfs-root/AppRun" "${pkgdir}/opt/${_pkgname}/AppRun"

  ln -s "/opt/${_pkgname}/AppRun" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "${srcdir}/squashfs-root/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"

  install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
