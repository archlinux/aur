# Maintainer: Aurivo <support@aurivo.app>
#
# AUR package for Arch-based distros.
# Installs the prebuilt AppImage from GitHub Releases.

pkgname=aurivo-bin
pkgver=2.0.3
pkgrel=2
pkgdesc="Aurivo Media Player (prebuilt AppImage)"
arch=('x86_64')
url="https://aurivo.app"
license=('MIT')
depends=('fuse2' 'glibc' 'zlib')
provides=('aurivo')
conflicts=('aurivo')
options=(!strip !debug)

_owner="muhammed-aurivo-dev"
_repo="Aurivo-Medya-Player-Linux"
_tag="v${pkgver}"
_appimage="Aurivo-${pkgver}-linux-x86_64.AppImage"

source=(
  "${_appimage}::https://github.com/${_owner}/${_repo}/releases/download/${_tag}/${_appimage}"
  "com.aurivo.mediaplayer.png::https://raw.githubusercontent.com/${_owner}/${_repo}/main/icons/aurivo_512.png"
)

# Replace with a real checksum after v2.0.3 release asset is published:
#   makepkg -g
sha256sums=('8caab1a8b712c5d26d7d4db7702d499362a70d82ab98e109f6eda78d8ab2a094'
            'da02e29b849870a9852e9020c0df9532a84ae81c53d3f073fa633d679d80b43f')

package() {
  install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/aurivo/aurivo.AppImage"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/aurivo" <<'EOF'
#!/usr/bin/env bash
exec /opt/aurivo/aurivo.AppImage "$@"
EOF

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/aurivo.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Aurivo Media Player
Comment=Advanced media player
Exec=aurivo %U
Terminal=false
Categories=AudioVideo;Player;
MimeType=audio/mpeg;audio/flac;audio/x-wav;audio/ogg;video/mp4;video/x-matroska;
Icon=com.aurivo.mediaplayer
StartupNotify=true
EOF

  install -Dm644 "${srcdir}/com.aurivo.mediaplayer.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/com.aurivo.mediaplayer.png"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/metainfo/com.aurivo.mediaplayer.metainfo.xml" <<'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<component type="desktop-application">
  <id>com.aurivo.mediaplayer</id>
  <name>Aurivo Media Player</name>
  <summary>Advanced media player</summary>
  <metadata_license>MIT</metadata_license>
  <project_license>MIT</project_license>
  <url type="homepage">https://aurivo.app</url>
  <description>
    <p>Aurivo Media Player for Linux.</p>
  </description>
</component>
EOF
}
