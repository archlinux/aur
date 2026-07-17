# Maintainer: horizzon3507 <148660626+horizzon3507@users.noreply.github.com>
# Unofficial AUR packaging of upstream Synara desktop AppImage releases.
# Upstream: https://github.com/Emanuele-web04/synara
#
# The AppImage is only a transport format: we extract it at package time and
# install the real Electron tree under /opt/synara so AppImageLauncher/Gear
# Lever never intercept execution.

pkgname=synara
pkgver=0.5.5
pkgrel=2
pkgdesc="Minimal desktop GUI for coding agents (Codex, Claude, Cursor, and more)"
arch=('x86_64')
url="https://trysynara.com"
license=('MIT')
depends=('zlib' 'glibc' 'hicolor-icon-theme')
conflicts=('synara-bin')
options=('!strip' '!debug')
source=(
  "Synara-${pkgver}-x86_64.AppImage::https://github.com/Emanuele-web04/synara/releases/download/v${pkgver}/Synara-${pkgver}-x86_64.AppImage"
  "synara.desktop"
  "synara.png"
  "LICENSE::https://raw.githubusercontent.com/Emanuele-web04/synara/v${pkgver}/LICENSE"
)
sha256sums=(
  '597a6e2af3fa770a0670532dd5e626bb6e205c5e4a5f3f296a69b5eb7fbd25e8'
  'a6a5dbdcd15b78fa36370059b1c95d3e534811c324e4a7774d64da968ba03f9b'
  '3914e01ffa931a12adef6531e90adbdeb1a267cf3721dbfe8291fe81a77b05b3'
  '6c263925edf74f9255c979b585b2b012b16c730f4c455a0aad4db8ddd5c91c5f'
)

prepare() {
  chmod +x "Synara-${pkgver}-x86_64.AppImage"
  "./Synara-${pkgver}-x86_64.AppImage" --appimage-extract
}

package() {
  install -d "${pkgdir}/opt/${pkgname}"
  cp -a squashfs-root/. "${pkgdir}/opt/${pkgname}/"

  # Drop AppImage launcher metadata; we ship our own desktop entry.
  rm -f "${pkgdir}/opt/${pkgname}/AppRun"
  rm -f "${pkgdir}/opt/${pkgname}/synara.desktop"
  rm -f "${pkgdir}/opt/${pkgname}/.DirIcon"

  # Electron sandbox helper expects setuid when not using --no-sandbox.
  if [[ -f "${pkgdir}/opt/${pkgname}/chrome-sandbox" ]]; then
    chmod 4755 "${pkgdir}/opt/${pkgname}/chrome-sandbox"
  fi

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/synara" <<'EOF'
#!/bin/sh
exec /opt/synara/synara "$@"
EOF

  install -Dm644 synara.desktop \
    "${pkgdir}/usr/share/applications/synara.desktop"
  install -Dm644 synara.png \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/synara.png"
  install -Dm644 synara.png \
    "${pkgdir}/usr/share/pixmaps/synara.png"
  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
