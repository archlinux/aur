# Maintainer: horizzon3507 <148660626+horizzon3507@users.noreply.github.com>
# Unofficial AUR packaging of upstream Synara desktop AppImage releases.
# Upstream: https://github.com/Emanuele-web04/synara
#
# The AppImage is only a transport format: we extract it at package time and
# install the real Electron tree under /opt/synara so AppImageLauncher/Gear
# Lever never intercept execution.

pkgname=synara
pkgver=0.6.1
pkgrel=1
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
  "synara-code.svg"
  "LICENSE::https://raw.githubusercontent.com/Emanuele-web04/synara/v${pkgver}/LICENSE"
)
sha256sums=(
  'd54ddf5deb3306adbc68b83688186bef712a2231e6bd091b7518ad2e87163e46'
  '18edbd09c38d58bcde63c2fb93f670f8d2eaeca84a1baa0d398fac3ade78ae56'
  '426cd0c3bacd826957099cb20609c6aeb62445c8203b515924b998623a646fad'
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

  # AppImage extract uses mode 700 trees; open them for normal users.
  chmod -R u=rwX,go=rX "${pkgdir}/opt/${pkgname}"

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
  install -Dm644 synara-code.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/synara-code.svg"
  install -Dm644 synara-code.svg \
    "${pkgdir}/usr/share/pixmaps/synara-code.svg"
  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
