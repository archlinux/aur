# Maintainer:  shinka <shinnkka1@gmail.com>
# Contributor:  Rinne <aur@rinne.in>

pkgname=animeko-appimage-beta
_pkgname=animeko
pkgver="5.2.0"
_pkgver=$(sed -E 's/(alpha|beta)/-\1/' <<<"$pkgver")
pkgrel=1
pkgdesc='集找番、追番、看番的一站式弹幕追番平台'
arch=('x86_64')
url='https://github.com/open-ani/animeko/'
license=('AGPL-3.0-or-later')
source_x86_64=("https://d.myani.org/v${_pkgver}/ani-${_pkgver}-linux-${CARCH}.appimage")
sha512sums_x86_64=('9c57221d60ae524e7db87f0c84fc8bd069d0de0f7b7cc6a140806f017e96f7ff0fe820be756fea3bdd788fbfe19c10e32e853c7afdeab35132c8bbf80b607910')
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
