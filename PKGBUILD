# Maintainer: hurleychin <qinhulin@gmail.com>

pkgname=songloft-player
pkgver=2.13.4
pkgrel=1
pkgdesc="Cross-platform music player client for Songloft servers (Flutter)"
arch=('x86_64')
url="https://songloft.hanxi.cc/"
license=('Apache-2.0')
depends=(
  'gtk3'
  'glib2'
  'pango'
  'cairo'
  'gdk-pixbuf2'
  'harfbuzz'
  'at-spi2-core'
  'libepoxy'
  'fontconfig'
  'freetype2'
  'libayatana-appindicator'
  'libayatana-indicator'
  'ayatana-ido'
  'libdbusmenu-glib'
  'libdbusmenu-gtk3'
  'mpv'
)
makedepends=('imagemagick')
_ghurl="https://github.com/songloft-org/songloft-player/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz::${_ghurl}/songloft-linux-x64.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/songloft-org/songloft-player/v${pkgver}/LICENSE")
sha256sums=('c31091bde0eb263622bf9068e6dd2e8378a9d30ed1646d5f16a7c99485471688'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')

package() {
  install -d "${pkgdir}/opt/songloft"
  cp -a "${srcdir}/lib" "${srcdir}/data" "${srcdir}/songloft_flutter" "${pkgdir}/opt/songloft/"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/songloft" <<'EOF'
#!/bin/sh
cd /opt/songloft && exec ./songloft_flutter "$@"
EOF

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/songloft.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Songloft
GenericName=Music Player
Comment=Cross-platform music player client for Songloft servers
Exec=songloft %U
Icon=songloft
Terminal=false
Categories=AudioVideo;Audio;Player;
Keywords=Music;Player;Self-hosted;
StartupNotify=true
EOF

  local size
  for size in 16 24 32 48 64 128 256 512; do
    install -Dm644 "${srcdir}/data/flutter_assets/assets/icons/app_icon.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/songloft.png"
    convert "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/songloft.png" \
      -resize "${size}x${size}" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/songloft.png"
  done

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
