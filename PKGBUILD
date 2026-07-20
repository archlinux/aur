# Maintainer: Jason Landbridge <JasonLandbridge at aur dot archlinux dot org>
# Packaging repository: https://github.com/JasonLandbridge/Arch-Linux-AUR-Packages-Updater/tree/main/reaparr-bin

pkgname=reaparr-bin
pkgver=0.38.2 # renovate: datasource=github-releases depName=Reaparr/Reaparr versioning=semver-coerced extractVersion=^v?(?<version>[0-9]+\.[0-9]+\.[0-9]+)$
pkgrel=1
pkgdesc="Desktop app for browsing and downloading media from Plex"
arch=('x86_64')
url="https://github.com/Reaparr/Reaparr"
license=('GPL-3.0-or-later')
depends=('fuse2')
optdepends=('xdg-utils: open external URLs from the desktop environment')
provides=('reaparr')
conflicts=('reaparr' 'reaparr-dev-bin')
options=('!strip')
_channel='stable'
source=(
  "Reaparr-${pkgver}-${_channel}.AppImage::https://github.com/Reaparr/Reaparr/releases/download/v${pkgver}/Reaparr-linux-x64-${_channel}.AppImage"
  "LICENSE-${pkgver}::https://raw.githubusercontent.com/Reaparr/Reaparr/v${pkgver}/LICENSE"
)
sha256sums=('044078bd7881dcaa54fd1f612a293ee4c40edc1587da55b9f7d842b94fa43591'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

prepare() {
  chmod +x "${srcdir}/Reaparr-${pkgver}-${_channel}.AppImage"
  "${srcdir}/Reaparr-${pkgver}-${_channel}.AppImage" --appimage-extract >/dev/null
}

package() {
  install -Dm755 "${srcdir}/Reaparr-${pkgver}-${_channel}.AppImage" \
    "${pkgdir}/opt/${pkgname}/Reaparr.AppImage"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/reaparr" <<'EOF'
#!/usr/bin/env bash
exec /opt/reaparr-bin/Reaparr.AppImage "$@"
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

  install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
