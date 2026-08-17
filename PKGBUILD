# Maintainer: smvoss

pkgname=archon-appimage
_pkgapp=archon
_pkgbuild_commit=03feaea
pkgver=9.5.8
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
  'b4431f0cad01081bcd585940efc14a59c3af535c33228ac13386662d0fba8735'
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
    "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/archon.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/archon.png"

  install -Dm644 \
    "${srcdir}/squashfs-root/archon.desktop" \
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
