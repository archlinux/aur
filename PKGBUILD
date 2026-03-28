# Maintainer:  shinka <shinnkka1@gmail.com>
# Contributor:  Rinne <aur@rinne.in> PaloMiku <palomiku@outlook.com>

pkgname=animeko-appimage-beta
_pkgname=animeko
pkgver="5.4.0beta05"
# normalize alpha/beta into dash-separated style for upstream URL path
# 5.4.0beta05 -> 5.4.0-beta05, 5.4.0-beta05 -> 5.4.0-beta05
_pkgver=$(sed -E 's/(alpha|beta)/-\1/g; s/-{2,}/-/g' <<<"$pkgver")
pkgrel=1
pkgdesc='集找番、追番、看番的一站式弹幕追番平台（Beta ）'
arch=('x86_64')
url='https://github.com/open-ani/animeko/'
license=('AGPL-3.0-or-later')
source_x86_64=("https://d.myani.org/v5.4.0-beta05/ani-5.4.0-beta05-linux-x86_64.appimage")
sha512sums_x86_64=('864717ea1dd08176657dd3dec8d2c72aa130aaf550e09de55c38574db9d94e2208cdf859b73876a860e2513449e3de069cb93915a0bd61f7bdd0b527382d64db')
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
