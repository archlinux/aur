# Maintainer: Antariksh Singh <antarikshsingh212@gmail.com>
pkgname=playtorrio-bin
pkgver=2.1.9
pkgrel=1
pkgdesc="All-in-one media center for streaming and for downloading games"
arch=('x86_64')
url="https://github.com/ayman707-ux/PlayTorrio"
license=('LicenseRef-custom')
depends=('fuse2' 'mpv' 'ffmpeg' 'gtk2' 'nodejs-lts-iron' 'nspr' 'gtk3' 'nss' 'libdbusmenu-gtk2' 'libxcomposite' 'dbus-glib' 'libdbusmenu-glib' 'libxdamage' 'libindicator-gtk2' 'libcups' 'at-spi2-core')
optdepends=('vlc: Alternative media player'
  'jackett: Torrent indexer integration'
  'real-debrid: Premium streaming service')
provides=('playtorrio')
conflicts=('playtorrio' 'playtorrio-git')
source=("${pkgname}-${pkgver}.AppImage::https://github.com/ayman707-ux/PlayTorrio/releases/download/v${pkgver}/PlayTorrio.AppImage"
  "playtorrio.desktop")
sha256sums=('e72760a304b72c577f199d31b8864583e7fef4e49777159feb74f26130f7f9b1'
            '75681351c5da62ada264bf23a2b1d89cf47d64b0739dc5286a8bd3464a079c28')
noextract=("${pkgname}-${pkgver}.AppImage")

prepare() {
  chmod +x "${pkgname}-${pkgver}.AppImage"
  "./${pkgname}-${pkgver}.AppImage" --appimage-extract
}

package() {
  # Install application files
  install -dm755 "${pkgdir}/opt/playtorrio"
  cp -r "${srcdir}/squashfs-root/"* "${pkgdir}/opt/playtorrio/"

  # Fix permissions for all files and directories
  chmod -R o+r "${pkgdir}/opt/playtorrio"
  find "${pkgdir}/opt/playtorrio" -type d -exec chmod o+x {} \;

  # Remove AppImage specific files
  rm -f "${pkgdir}/opt/playtorrio/AppRun"
  rm -f "${pkgdir}/opt/playtorrio/.DirIcon"
  rm -f "${pkgdir}/opt/playtorrio/playtorrio.desktop"

  # Create executable wrapper
  install -dm755 "${pkgdir}/usr/bin"
  cat >"${pkgdir}/usr/bin/playtorrio" <<'EOF'
#!/bin/bash
cd /opt/playtorrio || exit 1
exec ./playtorrio "$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/playtorrio"

  # Install desktop file
  install -Dm644 "${srcdir}/playtorrio.desktop" \
    "${pkgdir}/usr/share/applications/playtorrio.desktop"

  # Install icon
  install -Dm644 "${srcdir}/squashfs-root/playtorrio.png" \
    "${pkgdir}/usr/share/pixmaps/playtorrio.png"

  # Install license note
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  cat >"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
PlayTorrio - Custom License

This software is distributed under a custom license.
Please visit the upstream repository for license details:
https://github.com/ayman707-ux/PlayTorrio

Copyright (c) ayman707-ux
All rights reserved unless otherwise specified by the author.
EOF
}
