# Maintainer: Matthew Rathbone <matthew.rathbone at gmail dot com>
# Maintainer: Day Matchullis <notnightbut at duck dot com>
# Contributor: Sardelli Tommaso <lacappannadelloziotom at gmail dot com>

_pkgname=beekeeper-studio

pkgname=beekeeper-studio-appimage
pkgver=5.5.6
pkgrel=3
pkgdesc='Modern and easy to use SQL client for MySQL, Postgres, SQLite, SQL Server, and more'
arch=('x86_64' 'aarch64')
url='https://beekeeperstudio.io/'
license=('LicenseRef-BeekeeperStudioApplicationEULA')
provides=("beekeeper-studio=${pkgver}")
conflicts=('beekeeper-studio' 'beekeeper-studio-bin' 'beekeeper-studio-git')
source=(
  'LICENSE.md'
)
source_x86_64=("Beekeeper-Studio-${pkgver}-x86_64.AppImage::https://github.com/beekeeper-studio/beekeeper-studio/releases/download/v${pkgver}/Beekeeper-Studio-${pkgver}.AppImage")
source_aarch64=("Beekeeper-Studio-${pkgver}-aarch64.AppImage::https://github.com/beekeeper-studio/beekeeper-studio/releases/download/v${pkgver}/Beekeeper-Studio-${pkgver}-arm64.AppImage")
sha256sums=('05559651711dc746837dadcbdc5f3176e1cdde3b1de5a8c3ac95e4709a297d1d')
sha256sums_x86_64=('b24017dfd5e7982cc0cedf05a79d9a2c9f8bfc80edbe24d3a86f6181aef84e6c')
sha256sums_aarch64=('8fcfb668d48573df92b009198c1c085b616b7134ee9272ce29d2c0b926cc9c1d')
options=(!strip)
_appimage=./Beekeeper-Studio-${pkgver}-${CARCH}.AppImage
noextract=(
  "Beekeeper-Studio-${pkgver}-x86_64.AppImage"
  "Beekeeper-Studio-${pkgver}-aarch64.AppImage"
)


prepare() {
  chmod +x "${_appimage}"
  ./"${_appimage}" --appimage-extract
}

build() {
  sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
    "squashfs-root/${_pkgname}.desktop"
  chmod -R a-x+rX squashfs-root/usr
}


package() {
  # AppImage
  install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
  install -Dm644 "${srcdir}/LICENSE.md" "${pkgdir}/opt/${pkgname}/LICENSE.md"

  # Desktop File
  install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop"\
          "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # Icons
  install -dm755 "${pkgdir}/usr/share/"
  cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

  # Symlink executable
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/opt/${pkgname}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/BeekeeperStudioApplicationEULA"
}
