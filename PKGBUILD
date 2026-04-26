# Maintainer: Roman Mia <mail.romanmia@gmail.com>
pkgname=quasar-mips-ide-git
_pkgname=Quasar
_pkgname_lower=quasar
pkgver=1.6.0.r0.g397517e
pkgrel=1
pkgdesc="A modern, high-performance IDE for MIPS32 R2000 assembly (Source build)"
arch=('x86_64')
url="https://github.com/rmia46/quasar"
license=('custom:QUASAR NON-COMMERCIAL LICENSE')
depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3' 'librsvg')
makedepends=('git' 'nodejs' 'npm' 'rust')
provides=('quasar-mips-ide')
conflicts=('quasar-mips-ide' 'quasar-mips-ide-bin')
source=("git+https://github.com/rmia46/quasar.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/quasar"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/quasar"
  npm install
  npm run tauri build -- --bundles deb
}

package() {
  cd "$srcdir/quasar"
  
  # Install binary (Tauri uses the exact productName case)
  install -Dm755 "src-tauri/target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname_lower"
  
  # Install icons
  install -Dm644 "src-tauri/icons/32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/$_pkgname_lower.png"
  install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$_pkgname_lower.png"
  
  # Create and install .desktop file
  mkdir -p "$pkgdir/usr/share/applications"
  echo "[Desktop Entry]" > "$pkgdir/usr/share/applications/$_pkgname_lower.desktop"
  echo "Name=Quasar" >> "$pkgdir/usr/share/applications/$_pkgname_lower.desktop"
  echo "Comment=MIPS32 R2000 IDE" >> "$pkgdir/usr/share/applications/$_pkgname_lower.desktop"
  echo "Exec=$_pkgname_lower" >> "$pkgdir/usr/share/applications/$_pkgname_lower.desktop"
  echo "Icon=$_pkgname_lower" >> "$pkgdir/usr/share/applications/$_pkgname_lower.desktop"
  echo "Terminal=false" >> "$pkgdir/usr/share/applications/$_pkgname_lower.desktop"
  echo "Type=Application" >> "$pkgdir/usr/share/applications/$_pkgname_lower.desktop"
  echo "Categories=Development;IDE;" >> "$pkgdir/usr/share/applications/$_pkgname_lower.desktop"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
