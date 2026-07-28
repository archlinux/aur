# Maintainer: kukapu <susokukapu@gmail.com>
#
# Binary package for AudiblePort (Tauri desktop app).
# Downloads the official prebuilt AppImage — no source code is published.

pkgname=audibleport-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Download and convert Audible audiobooks locally"
arch=('x86_64')
url="https://audibleport.com"
license=('LicenseRef-Proprietary')
depends=(
  'hicolor-icon-theme'
  'zlib'
)
optdepends=(
  'fuse2: preferred FUSE mount for the AppImage runtime'
  'fuse3: alternative FUSE backend on modern Arch systems'
)
provides=('audibleport')
conflicts=('audibleport')
options=('!strip' '!debug')
noextract=("AudiblePort-${pkgver}-linux-x64.AppImage")
source=(
  "AudiblePort-${pkgver}-linux-x64.AppImage::https://downloads.audibleport.com/v${pkgver}/AudiblePort-linux-x64.AppImage"
  "audibleport.desktop"
  "audibleport.png"
  "LICENSE"
)
sha256sums=(
  'd0ea2d6ba0fc83e4e43e5a884ba1fa510a3dbdb10d946ed3a866037a5532ed05'
  'd7afd4229854d68a47e0cdadbbf4cd44a2cbef90b4104e30800557f6846cd3a0'
  'f306dfb5d537724f15d2af8c2bd81d8bf666c85c45e20aea6e8fb9cda2f4881e'
  'ab768f90de1bebd36122c52dce48305f9191660e017772cf7d852de9a6376594'
)

package() {
  install -Dm755 \
    "${srcdir}/AudiblePort-${pkgver}-linux-x64.AppImage" \
    "${pkgdir}/opt/audibleport/AudiblePort.AppImage"

  # Wrapper: try normal AppImage mount, fall back to extract-and-run (no FUSE).
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/audibleport" <<'EOF'
#!/bin/sh
APPIMAGE="/opt/audibleport/AudiblePort.AppImage"
if [ ! -x "$APPIMAGE" ]; then
  echo "audibleport: missing $APPIMAGE" >&2
  exit 1
fi

# Prefer native FUSE mount when available; otherwise extract-and-run.
if command -v fusermount >/dev/null 2>&1 || command -v fusermount3 >/dev/null 2>&1; then
  exec "$APPIMAGE" "$@"
fi

exec env APPIMAGE_EXTRACT_AND_RUN=1 "$APPIMAGE" "$@"
EOF

  install -Dm644 "${srcdir}/audibleport.desktop" \
    "${pkgdir}/usr/share/applications/audibleport.desktop"

  install -Dm644 "${srcdir}/audibleport.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/audibleport.png"

  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
