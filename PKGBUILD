# Maintainer: JasonLandbridge
# Packaging repository: https://github.com/JasonLandbridge/Arch-Linux-AUR-Packages-Updater/tree/main/sefirah-bin

pkgname=sefirah-bin
pkgver=3.1.0 # renovate: datasource=github-releases depName=shrimqy/Sefirah versioning=semver-coerced extractVersion=^v?(?<version>.*)$
pkgrel=2
pkgdesc="Open-source tool to connect your Android device and Windows/Linux PC"
arch=('x86_64')
url="https://github.com/shrimqy/Sefirah"
license=('GPL-3.0-or-later')
depends=('fuse2')
optdepends=('xdg-utils: open links/files with desktop defaults')
conflicts=('sefirah')
provides=('sefirah')
options=('!strip')

source=(
  "sefirah-${pkgver}.AppImage::https://github.com/shrimqy/Sefirah/releases/download/v${pkgver}/Sefirah-${pkgver}.AppImage"
)
sha256sums=('02973b5fbf503bec13d49f30a2e1a1af8505fc0d7c7f5e02062c6a10405dd270')

prepare() {
  chmod +x "${srcdir}/sefirah-${pkgver}.AppImage"
  "${srcdir}/sefirah-${pkgver}.AppImage" --appimage-extract >/dev/null
}

package() {
  install -Dm755 "${srcdir}/sefirah-${pkgver}.AppImage" \
    "${pkgdir}/opt/${pkgname}/sefirah.AppImage"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/sefirah" <<'EOF'
#!/usr/bin/env bash
exec /opt/sefirah-bin/sefirah.AppImage "$@"
EOF

  if [[ -f "${srcdir}/squashfs-root/Sefirah.desktop" ]]; then
    sed 's/^Exec=.*/Exec=sefirah/' "${srcdir}/squashfs-root/Sefirah.desktop" | \
      install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/sefirah.desktop"
  fi

  for size in 16 22 24 32 48 64 128 256 512; do
    if [[ -f "${srcdir}/squashfs-root/usr/share/icons/hicolor/${size}x${size}/apps/Sefirah.png" ]]; then
      install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${size}x${size}/apps/Sefirah.png" \
        "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/Sefirah.png"
    fi
  done

  if [[ -f "${srcdir}/squashfs-root/usr/share/icons/hicolor/scalable/apps/Sefirah.svg" ]]; then
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/scalable/apps/Sefirah.svg" \
      "${pkgdir}/usr/share/icons/hicolor/scalable/apps/Sefirah.svg"
  fi
}
