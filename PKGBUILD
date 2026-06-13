# Maintainer: Philipp <phil@syslinx.org>
pkgname=potacat
pkgver=1.8.12
pkgrel=1
pkgdesc="POTA/SOTA/DX spot hunter with 1-click CAT tuning (Electron)"
arch=('x86_64')
url="https://github.com/Waffleslop/POTACAT"
license=('MIT')
depends=('electron' 'nodejs')
makedepends=('npm' 'python' 'gcc' 'make' 'imagemagick')
optdepends=('hamlib: system rigctld instead of bundled binary')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/Waffleslop/POTACAT/archive/refs/tags/v$pkgver.tar.gz"
  "potacat.desktop"
  "potacat.sh"
)
sha256sums=(
  'SKIP'  # mit: makepkg -g
  'SKIP'
  'SKIP'
)
prepare() {
  cd "POTACAT-$pkgver"
  # npm-Abhängigkeiten ohne Electron-Download installieren
  # (Systemelectron wird genutzt)
  export npm_config_cache="$srcdir/npm-cache"
  npm install --ignore-scripts
}

build() {
  : # reine JS/Electron-App, nichts zu kompilieren
}

package() {
  cd "POTACAT-$pkgver"

  # App-Dateien nach /usr/lib/potacat kopieren
  install -dm755 "$pkgdir/usr/lib/$pkgname"
  cp -r . "$pkgdir/usr/lib/$pkgname"

  # Unnötige Verzeichnisse entfernen
  rm -rf "$pkgdir/usr/lib/$pkgname/.git"
  rm -rf "$pkgdir/usr/lib/$pkgname/dist"
  rm -rf "$pkgdir/usr/lib/$pkgname/.github"

  # Startskript installieren
  install -Dm755 "$srcdir/potacat.sh" "$pkgdir/usr/bin/potacat"

  # .desktop-Datei
  install -Dm644 "$srcdir/potacat.desktop" \
    "$pkgdir/usr/share/applications/potacat.desktop"

  # Icon: JPG aus dem Repo zu PNG konvertieren
  install -dm755 "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  convert potacat-logo.jpg \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/potacat.png"

  # Lizenz
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
