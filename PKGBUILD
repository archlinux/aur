# Maintainer: horizzon3507 <148660626+horizzon3507@users.noreply.github.com>
# Unofficial AUR packaging of upstream Synara beta (prerelease) AppImage builds.
# Upstream: https://github.com/Emanuele-web04/synara
#
# Co-installable with the "synara" stable package: everything lives under
# /opt/synara-beta and /usr/bin/synara-beta, so both channels can be installed
# side by side.
#
# The AppImage is only a transport format: we extract it at package time and
# install the real Electron tree under /opt/synara-beta so AppImageLauncher/
# Gear Lever never intercept execution.

pkgname=synara-beta
pkgver=1.0.6_beta.1
pkgrel=1
pkgdesc="Minimal desktop GUI for coding agents (beta channel)"
arch=('x86_64')
url="https://trysynara.com"
license=('MIT')
depends=('zlib' 'glibc' 'hicolor-icon-theme')
conflicts=('synara-bin')
options=('!strip' '!debug')

# AUR pkgver cannot contain a dash, so the upstream tag keeps its dash here
# instead: v1.0.6-beta.1 -> pkgver 1.0.6_beta.1.
_upstream_ver="${pkgver/_beta./-beta.}"

source=(
  "Synara-Beta-${_upstream_ver}-x86_64.AppImage::https://github.com/Emanuele-web04/synara/releases/download/v${_upstream_ver}/Synara-Beta-${_upstream_ver}-x86_64.AppImage"
  "synara-beta.desktop"
  "synara-beta.svg"
  "LICENSE::https://raw.githubusercontent.com/Emanuele-web04/synara/v${_upstream_ver}/LICENSE"
)
sha256sums=(
  'e8207324c27fa65b1d4e5a6232655bd8cf431caa215d1060f25838dbacda29d2'
  'ed88f2bdf151c043f7dc15e54de63862c397c95b30dd5bdba202b077a74d8d6b'
  '426cd0c3bacd826957099cb20609c6aeb62445c8203b515924b998623a646fad'
  '305724dd050ca7ded99c662de813d755bc4ec3887c4543a37159c6662ca36d1b'
)

prepare() {
  chmod +x "Synara-Beta-${_upstream_ver}-x86_64.AppImage"
  "./Synara-Beta-${_upstream_ver}-x86_64.AppImage" --appimage-extract
}

package() {
  install -d "${pkgdir}/opt/${pkgname}"
  cp -a squashfs-root/. "${pkgdir}/opt/${pkgname}/"

  # Drop AppImage launcher metadata; we ship our own desktop entry.
  rm -f "${pkgdir}/opt/${pkgname}/AppRun"
  rm -f "${pkgdir}/opt/${pkgname}"/*.desktop
  rm -f "${pkgdir}/opt/${pkgname}/.DirIcon"

  # AppImage extract uses mode 700 trees; open them for normal users.
  chmod -R u=rwX,go=rX "${pkgdir}/opt/${pkgname}"

  # Electron sandbox helper expects setuid when not using --no-sandbox.
  if [[ -f "${pkgdir}/opt/${pkgname}/chrome-sandbox" ]]; then
    chmod 4755 "${pkgdir}/opt/${pkgname}/chrome-sandbox"
  fi

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<'EOF'
#!/bin/sh
exec /opt/synara-beta/synara-beta "$@"
EOF

  install -Dm644 synara-beta.desktop \
    "${pkgdir}/usr/share/applications/synara-beta.desktop"
  install -Dm644 synara-beta.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/synara-beta.svg"
  install -Dm644 synara-beta.svg \
    "${pkgdir}/usr/share/pixmaps/synara-beta.svg"
  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
