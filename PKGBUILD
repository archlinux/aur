# Maintainer:  shinka <shinnkka1@gmail.com>
# Contributor:  Rinne <aur@rinne.in>

pkgname=animeko-appimage-beta
_pkgname=animeko
pkgver="5.1.0beta01"
_pkgver="5.1.0-beta01"
pkgrel=1
pkgdesc='集找番、追番、看番的一站式弹幕追番平台'
arch=('x86_64')
url='https://github.com/open-ani/animeko/'
license=('AGPL-3.0-or-later')
source_x86_64=("https://d.myani.org/v${_pkgver}/ani-${_pkgver}-linux-${CARCH}.appimage")
sha512sums_x86_64=('1b9d2dd8b44807ae5a302b6df7cf6261bc0728517f87bc5ba30b20bbbce1f5c38e6e7f6649c85eab6050279b242c5e32f232fc5a21d568a3882d77054e21cca8')
depends=('vlc-plugin-ffmpeg' 'vlc-plugin-dvb' 'vlc-plugin-pulse' 'gvfs')
conflicts=('animeko')
provides=('animeko')
makedepends=('7zip')
options=('!strip')

prepare() {
  chmod +x "${srcdir}/ani-${_pkgver}-linux-${CARCH}.appimage"
  7z x ${srcdir}/ani-${_pkgver}-linux-${CARCH}.appimage -o${srcdir}/squashfs-root
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
