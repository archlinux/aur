# Maintainer: ArDali <support@ardali.app>
#
# AUR package for Arch-based distros.
# Installs the prebuilt AppImage from GitHub Releases.

pkgname=ardali-bin
pkgver=3.1.7
pkgrel=1
pkgdesc="ArDali multimedia ecosystem for Linux (prebuilt AppImage)"
arch=('x86_64')
url="https://ardali.app"
license=('GPL-3.0-only')
depends=('fuse2' 'glibc' 'zlib' 'ffmpeg')
provides=('ardali')
conflicts=('ardali' 'aurivo-bin')
options=(!strip !debug)

_owner="Muhammed-Dali"
_repo="ArDali-WebMedia"
_tag="v${pkgver}"
_appimage="ArDali-${pkgver}-linux-x86_64.AppImage"

source=(
  "${_appimage}::https://github.com/${_owner}/${_repo}/releases/download/${_tag}/${_appimage}"
  "com.ardali.mediaplayer.png::https://raw.githubusercontent.com/${_owner}/${_repo}/main/icons/ardali_512.png"
)

sha256sums=('d6ee29a9f788dc4970761c5dd2c54488cb6b292dccab023da79a485486917823'
            'da02e29b849870a9852e9020c0df9532a84ae81c53d3f073fa633d679d80b43f')

package() {
  install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/ardali/ardali.AppImage"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/ardali" <<'EOF'
#!/usr/bin/env bash
exec /opt/ardali/ardali.AppImage "$@"
EOF

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/com.ardali.mediaplayer.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Version=1.5
Name=ArDali
Comment=Open-source Linux media player for music and video
Exec=ardali %U
Icon=com.ardali.mediaplayer
Terminal=false
Categories=AudioVideo;Player;
StartupWMClass=ardali
MimeType=audio/mpeg;audio/wav;audio/flac;audio/aac;audio/ogg;audio/mp4;audio/x-m4a;audio/opus;audio/aiff;audio/x-ms-wma;video/mp4;video/x-matroska;video/x-msvideo;video/quicktime;video/x-ms-wmv;video/webm;video/x-m4v;
Keywords=Music;Audio;Video;Media;Player;Linux;AppImage;Equalizer;DSP;ArDali;
StartupNotify=true
EOF
  ln -s com.ardali.mediaplayer.desktop "${pkgdir}/usr/share/applications/ardali.desktop"

  install -Dm644 "${srcdir}/com.ardali.mediaplayer.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/com.ardali.mediaplayer.png"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/metainfo/com.ardali.mediaplayer.metainfo.xml" <<'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<component type="desktop-application">
  <id>com.ardali.mediaplayer</id>
  <name>ArDali Media Player</name>
  <summary>Open-source Linux media player for music and video</summary>
  <metadata_license>CC0-1.0</metadata_license>
  <project_license>GPL-3.0-only</project_license>
  <url type="homepage">https://ardali.app</url>
  <description>
    <p>ArDali Media Player for Linux.</p>
  </description>
</component>
EOF
}
