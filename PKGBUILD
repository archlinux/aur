# Maintainer: shinka <shinnkka1@gmail.com>

pkgname=animeko-appimage
_pkgname=animeko
pkgver="4.10.1"
pkgrel=1
pkgdesc='集找番、追番、看番的一站式弹幕追番平台'
arch=('x86_64')
url='https://github.com/open-ani/animeko/'
license=('AGPL-3.0-or-later')
source_x86_64=("https://d.myani.org/v${pkgver//_/-}/ani-${pkgver//_/-}-linux-${CARCH}.appimage")
sha512sums_x86_64=('33b36115eb02e6f82427cb3b259a644244500b981b03a1415e46a33d5fc4a25c3a681741736d061d10c66f5e87a31d8f346b86d57036c2e401ad8f0d247fc770')
depends=('vlc' 'gvfs')
makedepends=('7zip')
conflicts=('animeko')
replaces=('animeko')
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

  cp -r "${srcdir}/squashfs-root/usr" "${pkgdir}/opt/${_pkgname}/"

  install -Dm755 "${srcdir}/squashfs-root/AppRun" "${pkgdir}/opt/${_pkgname}/AppRun"

  ln -s "/opt/${_pkgname}/AppRun" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "${srcdir}/squashfs-root/icon.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"

  install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
