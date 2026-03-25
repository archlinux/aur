# Maintainer: Daksh Choudhary <ch.daksh01@gmail.com>
# Maintainer: Vivek Sudan <s.viveksudan@gmail.com>

pkgname=smartbrowser-bin
pkgver=2.4.1
pkgrel=3
pkgdesc="HackerEarth Smart Browser for secure assessments"
arch=('x86_64')
url="https://www.hackerearth.com/challenges/smart-browser/sap-9/"
license=('custom')

provides=('smartbrowser')
conflicts=('smartbrowser')

# Runtime dependencies (Electron/Chromium stack)
depends=(
  'gtk3'
  'glib2'
  'nss'
  'libxss'
  'alsa-lib'
  'libxtst'
  'libxrandr'
  'libxdamage'
  'libxcomposite'
  'libxfixes'
  'at-spi2-core'
  'libdrm'
  'mesa'
  'libxcb'
  'libx11'
  'libxkbcommon'
  'pango'
  'cairo'
  'expat'
  'libcups'
)

# Optional runtime improvements
optdepends=(
  'pipewire: screen/audio capture'
  'pulseaudio: audio support'
  'wayland: Wayland support'
  'xdg-utils: open links properly'
)

# BUILD-TIME dependencies
makedepends=(
  'libarchive'
)

options=('!strip' '!debug')

source=("smartbrowser.deb::https://cdn.hackerearth.com/smart-browser/releases/linux/x64/smart-browser-${pkgver}.deb")

sha256sums=('SKIP')

package() {
  cd "$srcdir"

  # Extract data archive
  bsdtar -xf smartbrowser.deb
  bsdtar -xf data.tar.* -C "$pkgdir"

  # Fix permissions
  chmod -R 755 "$pkgdir/usr"

  # Fix Debian-specific lib path
  if [ -d "$pkgdir/usr/lib/x86_64-linux-gnu" ]; then
    mkdir -p "$pkgdir/usr/lib"
    mv "$pkgdir/usr/lib/x86_64-linux-gnu/"* "$pkgdir/usr/lib/"
    rmdir "$pkgdir/usr/lib/x86_64-linux-gnu"
  fi

  # Fix desktop entry (important for KDE/GNOME)
  if [ -f "$pkgdir/usr/share/applications/smart-browser.desktop" ]; then
    install -Dm644 "$pkgdir/usr/share/applications/smart-browser.desktop" \
      "$pkgdir/usr/share/applications/smartbrowser.desktop"
  fi

  # License install
  if [ -f "$pkgdir/usr/share/doc/smart-browser/copyright" ]; then
    install -Dm644 "$pkgdir/usr/share/doc/smart-browser/copyright" \
      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}