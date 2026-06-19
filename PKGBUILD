# Maintainer: loteran <https://github.com/loteran>
pkgname=ds5-audio-haptics-bt
pkgver=0.3.0
pkgrel=1
pkgdesc="Cross-platform configuration app for DS5Dongle — Auto Haptics Edition"
arch=('x86_64')
url="https://github.com/loteran/DS5Dongle"
license=('MIT')
depends=('hicolor-icon-theme' 'libusb' 'fuse2')
source=(
  "${pkgname}-${pkgver}.AppImage::https://github.com/loteran/DS5Dongle/releases/download/app-v${pkgver}/${pkgname}-${pkgver}.AppImage"
  "70-ds5dongle.rules::https://raw.githubusercontent.com/loteran/DS5Dongle/master/config-app/70-ds5dongle.rules"
  "${pkgname}.desktop::https://raw.githubusercontent.com/loteran/DS5Dongle/master/config-app/${pkgname}.desktop"
)
sha256sums=('SKIP' 'SKIP' 'SKIP')
noextract=("${pkgname}-${pkgver}.AppImage")

prepare() {
  chmod +x "${srcdir}/${pkgname}-${pkgver}.AppImage"
  # Extract icons embedded in the AppImage (runs into squashfs-root/)
  cd "${srcdir}"
  "./${pkgname}-${pkgver}.AppImage" --appimage-extract 'usr/share/icons' >/dev/null 2>&1 || \
    "./${pkgname}-${pkgver}.AppImage" --appimage-extract >/dev/null 2>&1 || true
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" \
    "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
  install -Dm644 "${srcdir}/70-ds5dongle.rules" \
    "${pkgdir}/etc/udev/rules.d/70-ds5dongle.rules"

  # Launcher wrapper
  install -dm755 "${pkgdir}/usr/bin"
  printf '#!/bin/sh\nexec /opt/%s/%s.AppImage "$@"\n' "${pkgname}" "${pkgname}" \
    > "${pkgdir}/usr/bin/${pkgname}"
  chmod +x "${pkgdir}/usr/bin/${pkgname}"

  # Desktop entry
  install -Dm644 "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Icons extracted from AppImage (best-effort)
  if [ -d "${srcdir}/squashfs-root/usr/share/icons" ]; then
    find "${srcdir}/squashfs-root/usr/share/icons" -type f -name '*.png' \
      | while read -r f; do
          install -Dm644 "$f" "${pkgdir}${f#${srcdir}/squashfs-root}"
        done
  fi
}
