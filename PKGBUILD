# Maintainer: Roman Mia <mail.romanmia@gmail.com>
pkgname=quasar-mips-ide-git
_pkgname=quasar
pkgver=1.0.0.r0.g3c2c8d2
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
  
  # Install binary
  install -Dm755 "src-tauri/target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  
  # Install icons
  install -Dm644 "src-tauri/icons/32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/$_pkgname.png"
  install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$_pkgname.png"
  
  # Create and install .desktop file
  mkdir -p "$pkgdir/usr/share/applications"
  echo "[Desktop Entry]" > "$pkgdir/usr/share/applications/$_pkgname.desktop"
  echo "Name=Quasar" >> "$pkgdir/usr/share/applications/$_pkgname.desktop"
  echo "Comment=MIPS32 R2000 IDE" >> "$pkgdir/usr/share/applications/$_pkgname.desktop"
  echo "Exec=$_pkgname" >> "$pkgdir/usr/share/applications/$_pkgname.desktop"
  echo "Icon=$_pkgname" >> "$pkgdir/usr/share/applications/$_pkgname.desktop"
  echo "Terminal=false" >> "$pkgdir/usr/share/applications/$_pkgname.desktop"
  echo "Type=Application" >> "$pkgdir/usr/share/applications/$_pkgname.desktop"
  echo "Categories=Development;IDE;" >> "$pkgdir/usr/share/applications/$_pkgname.desktop"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
