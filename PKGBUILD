# Maintainer: shinka <shinnkka1@gmail.com>
# Contributor: Rinne <aur@rinne.in>
# Contributor: PaloMiku <palomiku@outlook.com>

pkgname=animeko-appimage-beta
_pkgname=animeko
pkgver="5.4.0beta05"
_pkgver=$(sed -E 's/(alpha|beta)/-\1/g; s/-{2,}/-/g' <<<"$pkgver")
pkgrel=3
pkgdesc='集找番、追番、看番的一站式弹幕追番平台（Beta 版）'
arch=('x86_64')
url='https://github.com/open-ani/animeko/'
license=('AGPL-3.0-or-later')
source_x86_64=("https://github.com/open-ani/animeko/releases/download/v${_pkgver}/ani-${_pkgver}-linux-x86_64.appimage")
sha512sums_x86_64=('SKIP')
depends=('vlc-plugin-ffmpeg' 'vlc-plugin-dvb' 'vlc-plugin-pulse' 'gvfs' 'fuse2')
conflicts=('animeko')
provides=('animeko')
options=('!strip')
noextract=("ani-${_pkgver}-linux-${CARCH}.appimage")

prepare() {
  chmod +x "${srcdir}/ani-${_pkgver}-linux-${CARCH}.appimage"
  rm -rf "${srcdir}/squashfs-root"
  "${srcdir}/ani-${_pkgver}-linux-${CARCH}.appimage" --appimage-extract
  sed -i -E "s|Exec=Ani|Exec=/usr/bin/${_pkgname}|g" "${srcdir}/squashfs-root/${_pkgname}.desktop"
  sed -i -E "s|Icon=icon|Icon=${_pkgname}|g" "${srcdir}/squashfs-root/${_pkgname}.desktop"
}

package() {
  install -d "${pkgdir}/opt/${_pkgname}"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
  install -d "${pkgdir}/usr/share/applications"

  install -Dm755 "${srcdir}/ani-${_pkgver}-linux-${CARCH}.appimage" "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"
  ln -s "/opt/${_pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "${srcdir}/squashfs-root/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
  install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
