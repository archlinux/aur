# Maintainer: Jeevash23 <https://github.com/Jeevash23>
pkgname=index-asyncat-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A local-first note-taking and flashcard app built with Tauri"
arch=('x86_64')
url="https://github.com/Jeevash23/index"
license=('MIT')
depends=('webkit2gtk-4.1' 'libappindicator-gtk3' 'gtk3')
provides=('index-asyncat')
conflicts=('index-asyncat')

source_x86_64=("index-${pkgver}.deb::https://github.com/Jeevash23/index/releases/download/v${pkgver}/index_${pkgver}_amd64.deb")
sha256sums_x86_64=('SKIP')

package() {
  cd "$srcdir"

  # Extract the deb
  ar x "index-${pkgver}.deb"
  tar xf data.tar.gz -C "${pkgdir}"

  # Rename binary from 'app' to 'index-asyncat' (avoid clash with /usr/bin/index)
  mv "${pkgdir}/usr/bin/app" "${pkgdir}/usr/bin/index-asyncat"

  # Rename icons from 'app' to 'index-asyncat'
  for size in 32x32 128x128; do
    mv "${pkgdir}/usr/share/icons/hicolor/${size}/apps/app.png" \
       "${pkgdir}/usr/share/icons/hicolor/${size}/apps/index-asyncat.png"
  done
  mv "${pkgdir}/usr/share/icons/hicolor/256x256@2/apps/app.png" \
     "${pkgdir}/usr/share/icons/hicolor/256x256@2/apps/index-asyncat.png"

  # Fix the desktop file
  sed -i 's|^Exec=app|Exec=index-asyncat|' "${pkgdir}/usr/share/applications/index.desktop"
  sed -i 's|^Icon=app|Icon=index-asyncat|' "${pkgdir}/usr/share/applications/index.desktop"
}
