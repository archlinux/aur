# Maintainer: G-grbz <gkhn.gurbuz@hotmail.com>

pkgname=g-tmce
pkgver=2.0.0
pkgrel=3
pkgdesc="PySide6 app for creating and extracting MKV files with TMDB metadata"
arch=('any')
url="https://github.com/G-grbz/G-TMCE"
license=('GPL-3.0-only')
depends=(
  'hicolor-icon-theme'
  'python'
  'pyside6>=6.8'
  'python-certifi>=2026.07.22'
  'python-pillow>=12.3.0'
)
optdepends=(
  'kdialog: KDE-native file dialogs'
  'zenity: GTK-native file dialogs'
)
# Keep the cached source filename unique for each package revision. This avoids
# checksum failures when an upstream tag is ever rebuilt.
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c7a8ccf4201de6f0053932ccf7d82ac273683a43f42a08744b8eb972f4a7189a')

package() {
  cd "G-TMCE-${pkgver}"

  install -d "${pkgdir}/usr/lib/g-tmce"
  cp -a mkv_creator_ui.py src assets VERSION "${pkgdir}/usr/lib/g-tmce/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 assets/logo.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/g-tmce.png"
  install -Dm644 assets/logo.png "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/g-tmce.png"
  install -Dm644 assets/logo.png "${pkgdir}/usr/share/pixmaps/g-tmce.png"

  install -Dm644 G-TMCE.desktop "${pkgdir}/usr/share/applications/g-tmce.desktop"
  sed -i 's|^Path=.*|Path=/usr/lib/g-tmce|' "${pkgdir}/usr/share/applications/g-tmce.desktop"

  install -Dm644 mkv-creator-ui-extract.desktop \
    "${pkgdir}/usr/share/kio/servicemenus/g-tmce-extract.desktop"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/g-tmce" <<'EOF'
#!/bin/sh
cd /usr/lib/g-tmce || exit 1
exec /usr/bin/python /usr/lib/g-tmce/mkv_creator_ui.py "$@"
EOF
}
