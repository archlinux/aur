# Maintainer: Borys Kharchenko <arximus88@gmail.com>

pkgname=figma-linux-next
pkgver=0.16.0
pkgrel=1
pkgdesc="Unofficial Figma desktop app for Linux with native Wayland support and GPU acceleration"
arch=('x86_64')
url="https://github.com/arximus88/figma-linux-next"
license=('GPL-2.0-only')
depends=(
  'electron'
  'hicolor-icon-theme'
)
makedepends=(
  'bun'
  'nodejs'
)
optdepends=(
  'libappindicator-gtk3: for system tray icon support'
  'libnotify: for desktop notifications'
)
provides=('figma-linux-next')
conflicts=('figma-linux' 'figma-linux-bin' 'figma-linux-git')
source=(
  "figma-linux-next-$pkgver.tar.gz::https://github.com/arximus88/figma-linux-next/archive/refs/tags/v$pkgver.tar.gz"
  "figma-linux-next.desktop"
  "figma-linux-next-launcher.sh"
)
sha256sums=(
  '541b0f5386cb2078a0237ebb1f2028ab791df3a8855e8f03311261ba982fcc10'
  'SKIP'
  'SKIP'
)

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # Remove bundled electron - we use system electron
  sed -i '/"electron":/d' package.json

  # Install dependencies
  bun install --ignore-scripts
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  bun run build

  # Remove source maps (not needed in production)
  find dist -name "*.map" -delete
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Application files
  install -d "$pkgdir/usr/lib/$pkgname"
  cp -r dist/. "$pkgdir/usr/lib/$pkgname/"
  cp -r resources "$pkgdir/usr/lib/$pkgname/"

  # Launcher script → becomes the executable
  install -Dm755 "$srcdir/figma-linux-next-launcher.sh" "$pkgdir/usr/bin/figma-linux-next"

  # Desktop entry
  install -Dm644 "$srcdir/figma-linux-next.desktop" \
    "$pkgdir/usr/share/applications/figma-linux-next.desktop"

  # Icons
  for size in 16 24 32 48 64 128 256 512; do
    if [ -f "resources/icons/${size}x${size}.png" ]; then
      install -Dm644 "resources/icons/${size}x${size}.png" \
        "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/figma-linux-next.png"
    fi
  done

  # License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
