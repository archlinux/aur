# Maintainer: shinka <shinnkka1@gmail.com>
# Contributor: Rinne <aur@rinne.in>
# Contributor: PaloMiku <palomiku@outlook.com>

pkgname=animeko-appimage-beta
_pkgname=animeko
pkgver="5.5.0beta02"
_pkgver=$(sed -E 's/(alpha|beta)/-\1/g; s/-{2,}/-/g' <<<"$pkgver")
pkgrel=1
pkgdesc='集找番、追番、看番的一站式弹幕追番平台（Beta 版）'
arch=('x86_64')
url='https://github.com/open-ani/animeko/'
license=('AGPL-3.0-or-later')
source_x86_64=("https://github.com/open-ani/animeko/releases/download/v5.5.0-beta02/ani-5.5.0-beta02-linux-x86_64.appimage")
sha512sums_x86_64=('2b8a0291a8cda3330db151071debc840a6d38298d56e036716b7796c3cbdf7e04fbe43093bfa588a393e3d9577e6e7c826fb42f1c757c0e6099570b707c881fc')
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
