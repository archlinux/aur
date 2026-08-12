# Maintainer: Borys Kharchenko <arximus88@gmail.com>

pkgname=figma-linux-next-bin
pkgver=0.16.0
pkgrel=1
pkgdesc="Unofficial Figma desktop app for Linux with bundled Electron — prebuilt binary"
arch=('x86_64')
url="https://github.com/arximus88/figma-linux-next"
license=('GPL-2.0-only')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'gtk3'
  'hicolor-icon-theme'
  'libdrm'
  'libnotify'
  'libxss'
  'libxtst'
  'mesa'
  'nss'
  'xdg-utils'
)
optdepends=(
  'libappindicator-gtk3: for system tray icon support'
)
provides=('figma-linux-next')
conflicts=('figma-linux-next')
source=(
  "figma-linux-next-${pkgver}.zip::https://github.com/arximus88/figma-linux-next/releases/download/v${pkgver}/figma-linux-next_${pkgver}_linux_x64.zip"
  "figma-linux-next.desktop"
)
sha256sums=(
  '9557520882adef98fa7d35eeabafa84bca7e9ce5d9a10a32915155cd66fad6dc'
  'SKIP'
)
noextract=("figma-linux-next-${pkgver}.zip")

prepare() {
  mkdir -p "$srcdir/app"
  bsdtar -xf "$srcdir/figma-linux-next-${pkgver}.zip" -C "$srcdir/app"
}

package() {
  # Install application to /opt
  install -d "$pkgdir/opt/figma-linux-next"
  cp -r "$srcdir/app/." "$pkgdir/opt/figma-linux-next/"

  # Make main binary executable
  chmod 755 "$pkgdir/opt/figma-linux-next/figma-linux-next"
  chmod 4755 "$pkgdir/opt/figma-linux-next/chrome-sandbox"

  # Symlink binary to PATH
  install -d "$pkgdir/usr/bin"
  ln -s /opt/figma-linux-next/figma-linux-next "$pkgdir/usr/bin/figma-linux-next"

  # Desktop entry
  install -Dm644 "$srcdir/figma-linux-next.desktop" \
    "$pkgdir/usr/share/applications/figma-linux-next.desktop"

  # Icons
  for size in 24 36 48 64 72 96 128 192 256 384 512; do
    if [ -f "$srcdir/app/icons/${size}x${size}.png" ]; then
      install -Dm644 "$srcdir/app/icons/${size}x${size}.png" \
        "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/figma-linux-next.png"
    fi
  done

  # SVG icon
  if [ -f "$srcdir/app/icons/scalable.svg" ]; then
    install -Dm644 "$srcdir/app/icons/scalable.svg" \
      "$pkgdir/usr/share/icons/hicolor/scalable/apps/figma-linux-next.svg"
  fi

  # License
  install -Dm644 "$srcdir/app/LICENSE.electron.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
}

# vim:set ts=2 sw=2 et:
