# Maintainer: ArDali <support@ardali.app>
#
# AUR package for Arch-based distros.
# Installs the prebuilt AppImage from GitHub Releases.

pkgname=ardali-bin
pkgver=4.1.3
pkgrel=1
pkgdesc="ArDali WebMedia multimedia ecosystem for Linux (prebuilt AppImage)"
arch=('x86_64')
url="https://ardali.app"
license=('MIT')
depends=('fuse2' 'glibc' 'zlib' 'ffmpeg')
provides=('ardali')
conflicts=('ardali' 'aurivo-bin')
options=(!strip !debug)

_owner="Muhammed-Dali"
_repo="ArDali"
_tag="v${pkgver}"
_appimage="ArDali.WebMedia_${pkgver}_amd64.AppImage"

source=(
  "${_appimage}::https://github.com/${_owner}/${_repo}/releases/download/${_tag}/${_appimage}"
  "com.ardali.mediaplayer.png::https://raw.githubusercontent.com/${_owner}/${_repo}/main/public/icons/app/ardali_256.png"
)

sha256sums=('703a6b636d331e49a6f1bb1376a30bc515bf32800fe4c7c16b8ab81a568824f2'
            '4d12f075da1921ae0117b6d5a0f36dee83b1df177fe41670414d5badd498f67a')

package() {
  install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/ardali/ardali.AppImage"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/ardali" <<'EOF'
#!/usr/bin/env bash
export CHROME_DESKTOP="com.ardali.mediaplayer.desktop"
if [ ! -e /dev/fuse ]; then
  export APPIMAGE_EXTRACT_AND_RUN=1
fi
exec /opt/ardali/ardali.AppImage "$@"
EOF

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/com.ardali.mediaplayer.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Version=1.5
Name=ArDali
Comment=ArDali WebMedia player for music, video, web platforms and DSP
Exec=ardali %U
Icon=com.ardali.mediaplayer
Terminal=false
Categories=AudioVideo;Player;
StartupWMClass=ardali
MimeType=audio/mpeg;audio/wav;audio/flac;audio/aac;audio/ogg;audio/mp4;audio/x-m4a;audio/opus;audio/aiff;audio/x-ms-wma;video/mp4;video/x-matroska;video/x-msvideo;video/quicktime;video/x-ms-wmv;video/webm;video/x-m4v;
Keywords=Music;Audio;Video;Media;Player;Linux;AppImage;Equalizer;DSP;ArDali;
StartupNotify=true
EOF
  install -Dm644 "${srcdir}/com.ardali.mediaplayer.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/com.ardali.mediaplayer.png"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/metainfo/com.ardali.mediaplayer.metainfo.xml" <<'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<component type="desktop-application">
  <id>com.ardali.mediaplayer</id>
  <name>ArDali WebMedia</name>
  <summary>Media player, web platform manager and DSP engine</summary>
  <metadata_license>CC0-1.0</metadata_license>
  <project_license>MIT</project_license>
  <url type="homepage">https://ardali.app</url>
  <description>
    <p>ArDali WebMedia for Linux.</p>
  </description>
</component>
EOF
}
