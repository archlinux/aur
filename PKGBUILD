# Maintainer: kukapu <susokukapu@gmail.com>
#
# Binary package for AudiblePort (Tauri desktop app).
# Downloads the official prebuilt AppImage, extracts it, and runs against
# Arch system WebKitGTK/GTK/Mesa — the Ubuntu-bundled WebKit causes a black
# window + "Could not create default EGL display: EGL_BAD_PARAMETER" on
# Arch/Omarchy (Intel and NVIDIA).

pkgname=audibleport-bin
pkgver=1.0.0
pkgrel=3
pkgdesc="Download and convert Audible audiobooks locally"
arch=('x86_64')
url="https://audibleport.com"
license=('LicenseRef-Proprietary')
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'libsoup3'
  'gstreamer'
  'gst-plugins-base'
  'gst-plugins-good'
  'openssl'
  'hicolor-icon-theme'
  'zlib'
)
optdepends=(
  'gst-plugins-bad: extra media codecs for the webview'
  'gst-libav: extra media codecs for the webview'
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

prepare() {
  chmod +x "${srcdir}/AudiblePort-${pkgver}-linux-x64.AppImage"
  cd "${srcdir}"
  rm -rf squashfs-root
  "./AudiblePort-${pkgver}-linux-x64.AppImage" --appimage-extract

  # Drop Ubuntu-bundled WebKit so the app uses Arch webkit2gtk-4.1 + system Mesa.
  rm -f squashfs-root/usr/lib/libwebkit2gtk-4.1.so*
  rm -f squashfs-root/usr/lib/libjavascriptcoregtk-4.1.so*
  rm -rf squashfs-root/usr/lib/x86_64-linux-gnu/webkit2gtk-4.1
}

package() {
  install -d "${pkgdir}/opt/audibleport"
  cp -a "${srcdir}/squashfs-root/." "${pkgdir}/opt/audibleport/"

  # Keep the main binary and bundled resources (ffmpeg) executable.
  chmod 755 "${pkgdir}/opt/audibleport/usr/bin/audibleport"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/audibleport" <<'EOF'
#!/bin/sh
APPDIR="/opt/audibleport"
BIN="${APPDIR}/usr/bin/audibleport"

if [ ! -x "$BIN" ]; then
  echo "audibleport: missing $BIN" >&2
  exit 1
fi

# Prefer Arch system libraries (WebKit/GTK/GLib/Mesa/GStreamer) over the
# Ubuntu copies still present in the extracted AppImage tree. Without this,
# WebKit dies with: Could not create default EGL display: EGL_BAD_PARAMETER
export LD_LIBRARY_PATH="/usr/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"

# Extra safety on Wayland + DMA-BUF (Intel/NVIDIA/AMD).
export WEBKIT_DISABLE_DMABUF_RENDERER="${WEBKIT_DISABLE_DMABUF_RENDERER:-1}"

exec "$BIN" "$@"
EOF

  install -Dm644 "${srcdir}/audibleport.desktop" \
    "${pkgdir}/usr/share/applications/audibleport.desktop"

  install -Dm644 "${srcdir}/audibleport.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/audibleport.png"

  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
