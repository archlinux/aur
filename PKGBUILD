# Maintainer: smvoss

pkgname=archon-appimage
_pkgapp=archon
pkgver=9.0.144
pkgrel=1
pkgdesc="Desktop uploader app for Archon packaged as the upstream AppImage"
arch=('x86_64')
url='https://www.archon.gg/download'
license=('custom')
depends=(
  'fuse2'
)
provides=('archon')
conflicts=('archon' 'archon-bin')
source=(
  "${_pkgapp}-v${pkgver}.AppImage::https://github.com/RPGLogs/Uploaders-archon/releases/download/v${pkgver}/archon-v${pkgver}.AppImage"
)
sha256sums=(
  'SKIP'
)
options=(!strip)

package() {
  cd "${srcdir}"

  chmod +x "${_pkgapp}-v${pkgver}.AppImage"
  ./"${_pkgapp}-v${pkgver}.AppImage" --appimage-extract >/dev/null

  install -Dm755 \
    "${_pkgapp}-v${pkgver}.AppImage" \
    "${pkgdir}/opt/${pkgname}/${_pkgapp}.AppImage"

  printf '#!/bin/sh\nexec /opt/%s/%s.AppImage --no-sandbox \"$@\"\n' \
    "${pkgname}" "${_pkgapp}" \
    > "${srcdir}/${_pkgapp}"
  install -Dm755 "${srcdir}/${_pkgapp}" "${pkgdir}/usr/bin/${_pkgapp}"

  install -Dm644 \
    "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/Archon App.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/archon.png"

  install -Dm644 \
    "${srcdir}/squashfs-root/Archon App.desktop" \
    "${pkgdir}/usr/share/applications/archon.desktop"
  sed -i \
    -e 's|^Exec=.*|Exec=/usr/bin/archon %U|' \
    -e 's|^Icon=.*|Icon=archon|' \
    "${pkgdir}/usr/share/applications/archon.desktop"

  install -Dm644 \
    "${srcdir}/squashfs-root/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  install -Dm644 \
    "${srcdir}/squashfs-root/LICENSES.chromium.html" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
