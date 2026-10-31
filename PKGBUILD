# Maintainer: duanluan <duanluan@outlook.com>

pkgname=edithere-bin
pkgver=0.12.4
pkgrel=1
pkgdesc='Screenshot annotation and visual feedback tool (prebuilt binary)'
arch=('x86_64')
url='https://github.com/Inginnng/EditHere'
license=('PolyForm-Noncommercial-1.0.0')
depends=('glibc')
options=('!strip')
source=(
  "EditHere-linux-x86_64-${pkgver}.AppImage::https://github.com/Inginnng/EditHere/releases/download/v${pkgver}/EditHere-linux-x86_64.AppImage"
  'LICENSE'
  'NOTICE'
)
sha256sums=(
  '3259fe0b76ec834df8d5f4df8190bb5ee5df12e8c79be1df3b481c1a06d39663'
  'ffcca38841adb694b6f380647e15f17c446a4d1656fed51a1e2041d064c94cc8'
  '8d29c679a40ae2af03703948916a1284da69dd13d15e5561c0a496c2c6ff6367'
)

package() {
  cd "${srcdir}"
  chmod +x "EditHere-linux-x86_64-${pkgver}.AppImage"
  "./EditHere-linux-x86_64-${pkgver}.AppImage" --appimage-extract >/dev/null

  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -a squashfs-root/. "${pkgdir}/opt/${pkgname}/"

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/NOTICE" "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"

  install -Dm644 squashfs-root/usr/share/icons/hicolor/256x256/apps/edithere.png \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/edithere.png"

  install -Dm644 squashfs-root/com.edithere.capture.desktop \
    "${pkgdir}/usr/share/applications/com.edithere.capture.desktop"
  sed -i 's|^Exec=EditHere|Exec=edithere|' \
    "${pkgdir}/usr/share/applications/com.edithere.capture.desktop"

  # AppRun locates its appdir from $0's directory, so a plain symlink in
  # /usr/bin would resolve to /usr/bin; invoke it by absolute path instead.
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/edithere" <<'SCRIPT'
#!/bin/sh
exec /opt/edithere-bin/AppRun "$@"
SCRIPT
}
