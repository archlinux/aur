# Maintainer: G-grbz <gkhn.gurbuz@hotmail.com>

pkgname=g-tmce
pkgver=2.0.5
pkgrel=1
pkgdesc="PySide6 app for creating and extracting MKV files with TMDB metadata"
arch=('any')
url="https://github.com/G-grbz/G-TMCE"
license=('GPL-3.0-only')
depends=(
  'hicolor-icon-theme'
  'python'
  'pyside6>=6.11.2'
  'python-certifi>=2026.07.22'
  'python-pillow>=12.3.0'
  'python-faster-whisper>=1.2.1'
  'python-ctranslate2-bin>=4.8.2'
  'python-sentencepiece>=0.2.2'
)
optdepends=(
  'kdialog: KDE-native file dialogs'
  'zenity: GTK-native file dialogs'
)
# Keep the cached source filename unique for each package revision. This avoids
# checksum failures when an upstream tag is ever rebuilt.
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c0dbd5950ed2103b9dadbbbe5f6da6233a3f8e0bd0d508ed8a7a867344748f45')

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
