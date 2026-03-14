# Maintainer: Bjarne Øverli <bjarne@oever.li>
pkgname=aether
pkgver=3.0.0
pkgrel=1
pkgdesc="Omarchy theming application"
arch=('any')
url="https://github.com/bjarneo/aether"
license=('MIT')
depends=('gjs' 'gtk4' 'libadwaita' 'libsoup3' 'imagemagick' 'gtk4-layer-shell')
optdepends=('omarchy: Theme application backend')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7c8f98f8a8326ed28ecd0867eb857680739bf224050c27806c590d9d8d1c3130') # Replace with actual checksum after creating GitHub release

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Install source files
  install -dm755 "$pkgdir/usr/share/$pkgname"
  cp -r src templates "$pkgdir/usr/share/$pkgname/"

  # Create launcher script
  install -dm755 "$pkgdir/usr/bin"
  cat >"$pkgdir/usr/bin/aether" <<'EOF'
#!/bin/bash
cd /usr/share/aether || exit

# Preload GTK4 Layer Shell to fix linking order issue with libwayland
# See: https://github.com/wmww/gtk4-layer-shell/blob/main/linking.md
export LD_PRELOAD=/usr/lib/libgtk4-layer-shell.so

exec gjs -m src/main.js "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/aether"

  # Install desktop entry
  install -Dm644 li.oever.aether.desktop "$pkgdir/usr/share/applications/li.oever.aether.desktop"

  # Install icon
  install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/aether.png"

  # Install license
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
