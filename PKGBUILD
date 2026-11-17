# Maintainer: Aanok <aanok.aur@gmail.com>
# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: therealfarfetchd

pkgname=ripcord
pkgver=0.4.29
pkgrel=1
pkgdesc='Qt-based Discord and Slack client'
arch=(x86_64)
url='https://cancel.fm/ripcord/'
license=('LicenseRef-ripcord')
depends=(
  expat
  freetype2
  gcc-libs
  glib2
  glibc
  harfbuzz
  libdrm
  libgl
  libx11
  libxcb
  zlib
)
options=(!strip)
_file="Ripcord-${pkgver}-x86_64.AppImage"
source=(
  "https://cancel.fm/dl/${_file}"{,.asc}
  ripcord.license
)
sha256sums=('e320cb3c4043b0f296b4bc1da664b29776f95c2c0b02bdbf115b4d46b1669899'
            'SKIP'
            'd7b2d483acceaebebfa068223efd8fb5e0f5d66f642fa234484ca50974c9fa2c')
validpgpkeys=('ABBAD1CB484F53024CF5868B69332F9203F21F5C')

prepare() {
  chmod +x "${_file}"
  "./${_file}" --appimage-extract &> /dev/null
}

package() {
  # Directories
  install -d "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/lib/ripcord/"
  install -d "${pkgdir}/usr/share/applications/"
  install -d "${pkgdir}/usr/share/icons/"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"

  # Icon
  install -m644 "squashfs-root/Ripcord_Icon.png" "${pkgdir}/usr/share/icons/"

  # .desktop file
  sed -i 's/Exec=Ripcord/Exec=ripcord/' "squashfs-root/Ripcord.desktop"
  install -m644 "squashfs-root/Ripcord.desktop" "${pkgdir}/usr/share/applications"

  # License
  install -m644 ripcord.license "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Application
  chmod 755 -R squashfs-root
  mv squashfs-root/* "${pkgdir}/usr/lib/ripcord/"
  ln -s "/usr/lib/ripcord/Ripcord" "${pkgdir}/usr/bin/ripcord"
}
