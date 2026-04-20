pkgname=ioruba-desktop-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="Tactile audio mixer for Arduino-based Linux control (prebuilt AppImage)"
arch=('x86_64')
url="https://github.com/bernardopg/ioruba"
license=('MIT')
depends=('glibc' 'gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
provides=('ioruba-desktop' 'ioruba')
conflicts=('ioruba-desktop' 'ioruba' 'ioruba-desktop-bin')
replaces=('ioruba')
source=(
  "Ioruba_0.6.1_amd64.AppImage::https://github.com/bernardopg/ioruba/releases/download/v${pkgver}/Ioruba_0.6.1_amd64.AppImage"
  "ioruba.png::https://raw.githubusercontent.com/bernardopg/ioruba/v${pkgver}/apps/desktop/src-tauri/icons/128x128.png"
)
sha256sums=('18cae2d533749d5533300fb8f4e09c02c1d886be3716eeff65307d6ab0ccd183' '7aff3ecc3a0cbc1fed8559ae0464d2af330372514c39edfaefd31c2119a2db63')

package() {
  install -Dm755 "${srcdir}/Ioruba_0.6.1_amd64.AppImage" "${pkgdir}/opt/ioruba/ioruba.AppImage"
  install -Dm644 "${srcdir}/ioruba.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/ioruba.png"
  install -Dm644 /dev/null "${pkgdir}/usr/share/applications/ioruba.desktop"

  printf '%s\n' \
    '[Desktop Entry]' \
    'Type=Application' \
    'Name=Ioruba' \
    'Comment=Tactile audio mixer for Arduino-based Linux control' \
    'Exec=ioruba-desktop' \
    'Icon=ioruba' \
    'Categories=AudioVideo;Audio;' \
    'Terminal=false' \
    > "${pkgdir}/usr/share/applications/ioruba.desktop"

  install -Dm755 /dev/null "${pkgdir}/usr/bin/ioruba-desktop"
  cat > "${pkgdir}/usr/bin/ioruba-desktop" <<'LAUNCHER'
#!/usr/bin/env sh
set -eu

APPIMAGE="/opt/ioruba/ioruba.AppImage"
CACHE_ROOT="${XDG_CACHE_HOME:-${HOME}/.cache}/ioruba/appimage-runtime"

if [ ! -r "${APPIMAGE}" ]; then
  echo "Ioruba AppImage nao encontrado em ${APPIMAGE}" >&2
  exit 1
fi

APP_SHA="$(sha256sum "${APPIMAGE}" | awk '{print $1}')"
RUNTIME_DIR="${CACHE_ROOT}/${APP_SHA}"
APPDIR="${RUNTIME_DIR}/squashfs-root"

if [ ! -x "${APPDIR}/AppRun" ]; then
  rm -rf "${RUNTIME_DIR}"
  mkdir -p "${RUNTIME_DIR}"
  (
    cd "${RUNTIME_DIR}"
    "${APPIMAGE}" --appimage-extract >/dev/null
  )

  rm -f \
    "${APPDIR}/usr/lib/libwayland-egl.so.1" \
    "${APPDIR}/usr/lib/libwayland-client.so.0" \
    "${APPDIR}/usr/lib/libwayland-cursor.so.0" \
    "${APPDIR}/usr/lib/libwayland-server.so.0"
fi

if [ -x "${APPDIR}/AppRun" ]; then
  exec "${APPDIR}/AppRun" "$@"
fi

exec "${APPIMAGE}" "$@"
LAUNCHER
  chmod 755 "${pkgdir}/usr/bin/ioruba-desktop"
}
