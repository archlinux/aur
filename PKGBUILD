# Maintainer: Selim Bucher <me@selim.one>
pkgname=kiwi-settings
pkgver=0.2.0
pkgrel=1
pkgdesc="Settings application for Kiwi Shell"
arch=('any')
url="https://github.com/selimbucher/kiwi-settings"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'python'
  'python-gobject'
  'python-cairo'
  'imagemagick'
)
makedepends=(
  'gobject-introspection'
)
optdepends=(
  'kiwi-shell: companion shell environment'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/selimbucher/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('69a3939ee333619dede5f022502c2e03eb335809a8eae5bb0efa06efb32d3af7')

package() {
  cd "$pkgname-$pkgver"

  install -dm755 "$pkgdir/usr/lib/$pkgname"
  cp -r src/* "$pkgdir/usr/lib/$pkgname/"
  find "$pkgdir/usr/lib/$pkgname" -type d -name __pycache__ -exec rm -rf {} +

  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/kiwi-settings" << 'EOF'
#!/bin/bash
export PYTHONPATH="/usr/lib/kiwi-settings"
exec python3 /usr/lib/kiwi-settings/main.py "$@"
EOF
  chmod +x "$pkgdir/usr/bin/kiwi-settings"

  install -Dm644 "data/com.github.selimbucher.kiwi_settings.desktop" \
    "$pkgdir/usr/share/applications/com.github.selimbucher.kiwi_settings.desktop"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
