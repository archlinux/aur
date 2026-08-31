# Maintainer: Jason Landbridge <JasonLandbridge at aur dot archlinux dot org>
# Packaging repository: https://github.com/JasonLandbridge/Arch-Linux-AUR-Packages-Updater/tree/main/reaparr-dev-bin

pkgname=reaparr-dev-bin
pkgver=0.39.0_dev.2 # renovate: datasource=github-releases depName=Reaparr/Reaparr versioning=regex:^(?<major>\d+)\.(?<minor>\d+)\.(?<patch>\d+)-(?<prerelease>dev)\.(?<build>\d+)$ extractVersion=^v?(?<version>[0-9]+\.[0-9]+\.[0-9]+-dev\.[0-9]+)$
pkgrel=1
pkgdesc="Desktop app for browsing and downloading media from Plex (dev release)"
arch=('x86_64')
url="https://github.com/Reaparr/Reaparr"
license=('GPL-3.0-or-later')
depends=('fuse2')
optdepends=('xdg-utils: open external URLs from the desktop environment')
provides=('reaparr')
conflicts=('reaparr' 'reaparr-bin')
options=('!strip')
_upstream_ver="${pkgver/_/-}"
_channel='dev'
source=(
  "Reaparr-${_upstream_ver}-${_channel}.AppImage::https://github.com/Reaparr/Reaparr/releases/download/v${_upstream_ver}/Reaparr-linux-x64-${_channel}.AppImage"
  "LICENSE-${_upstream_ver}::https://raw.githubusercontent.com/Reaparr/Reaparr/v${_upstream_ver}/LICENSE"
)
sha256sums=('a10054de195861034f3d8928503facb3b407865f2031f9104f768a199e45f00e'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

prepare() {
  chmod +x "${srcdir}/Reaparr-${_upstream_ver}-${_channel}.AppImage"
  "${srcdir}/Reaparr-${_upstream_ver}-${_channel}.AppImage" --appimage-extract >/dev/null
}

package() {
  install -Dm755 "${srcdir}/Reaparr-${_upstream_ver}-${_channel}.AppImage" \
    "${pkgdir}/opt/${pkgname}/Reaparr.AppImage"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/reaparr" <<'EOF'
#!/usr/bin/env bash
exec /opt/reaparr-dev-bin/Reaparr.AppImage "$@"
EOF

  if [[ -f "${srcdir}/squashfs-root/Reaparr.desktop" ]]; then
    sed 's/^Exec=.*/Exec=reaparr/' "${srcdir}/squashfs-root/Reaparr.desktop" | \
      install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/reaparr.desktop"
  fi

  local _icon
  shopt -s nullglob
  for _icon in "${srcdir}/squashfs-root/usr/share/icons/hicolor"/*/apps/Reaparr.*; do
    install -Dm644 "${_icon}" \
      "${pkgdir}/usr/share/icons/hicolor/$(basename "$(dirname "$(dirname "${_icon}")")")/apps/$(basename "${_icon}")"
  done
  shopt -u nullglob

  install -Dm644 "${srcdir}/LICENSE-${_upstream_ver}" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
