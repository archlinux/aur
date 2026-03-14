# Maintainer: Philipp <phil@syslinx.org>
pkgname=potacat
pkgver=1.0.8
pkgrel=1
pkgdesc="POTA/SOTA/DX spot hunter with 1-click CAT tuning (Electron)"
arch=('x86_64')
url="https://github.com/Waffleslop/POTACAT"
license=('MIT')
depends=('electron' 'nodejs')
makedepends=('npm' 'python' 'gcc' 'make')
optdepends=('hamlib: system rigctld instead of bundled binary')
options=('!strip')
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

  # Fremde Architekturen aus node_modules entfernen (arm, ia32, musl, android...)
  local nm="$pkgdir/usr/lib/$pkgname/node_modules"
  rm -rf "$nm/@img/sharp-libvips-linuxmusl-x64"
  rm -rf "$nm/@img/sharp-linuxmusl-x64"
  rm -rf "$nm/@serialport/bindings-cpp/prebuilds/linux-arm"
  rm -rf "$nm/@serialport/bindings-cpp/prebuilds/linux-arm64"
  rm -rf "$nm/@serialport/bindings-cpp/prebuilds/android-arm"
  rm -rf "$nm/@serialport/bindings-cpp/prebuilds/android-arm64"
  rm -rf "$nm/@serialport/bindings-cpp/prebuilds/linux-x64/@serialport+bindings-cpp.musl.node"
  rm -rf "$nm/7zip-bin/linux/arm"
  rm -rf "$nm/7zip-bin/linux/arm64"
  rm -rf "$nm/7zip-bin/linux/ia32"
  rm -rf "$nm/7zip-bin/mac"
  rm -rf "$nm/7zip-bin/win"
  rm -rf "$nm/app-builder-bin/linux/arm"
  rm -rf "$nm/app-builder-bin/linux/arm64"
  rm -rf "$nm/app-builder-bin/linux/ia32"
  rm -rf "$nm/app-builder-bin/linux/loong64"
  rm -rf "$nm/app-builder-bin/linux/riscv64"
  rm -rf "$nm/app-builder-bin/mac"
  rm -rf "$nm/app-builder-bin/win"

  # Startskript installieren
  install -Dm755 "$srcdir/potacat.sh" "$pkgdir/usr/bin/potacat"

  # .desktop-Datei
  install -Dm644 "$srcdir/potacat.desktop" \
    "$pkgdir/usr/share/applications/potacat.desktop"

  # Lizenz
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
