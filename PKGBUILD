# Maintainer: Daksh Choudhary <ch.daksh01@gmail.com>
# Maintainer: Friend Name <s.viveksudan@gmail.com>

pkgname=smartbrowser-bin
pkgver=2.4.1
pkgrel=1
pkgdesc="HackerEarth Smart Browser for secure assessments"
arch=('x86_64')
url="https://www.hackerearth.com"
license=('custom')

depends=(
  'gtk3'
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
)

optdepends=(
  'pipewire: screen/audio capture'
  'pulseaudio: audio support'
)

provides=('smartbrowser')
conflicts=('smartbrowser')

source=("smartbrowser.deb::https://cdn.hackerearth.com/smart-browser/releases/linux/x64/smart-browser-${pkgver}.deb")

sha256sums=('SKIP')

package() {
  cd "$srcdir"

  # Extract deb
  ar x smartbrowser.deb
  tar xf data.tar.* -C "$pkgdir"

  # Fix permissions
  chmod -R 755 "$pkgdir/usr/bin" 2>/dev/null || true

  # Fix Debian-specific lib path
  if [ -d "$pkgdir/usr/lib/x86_64-linux-gnu" ]; then
    mkdir -p "$pkgdir/usr/lib"
    cp -r "$pkgdir/usr/lib/x86_64-linux-gnu/"* "$pkgdir/usr/lib/"
    rm -rf "$pkgdir/usr/lib/x86_64-linux-gnu"
  fi

  # Install license if exists
  install -Dm644 "$pkgdir/usr/share/doc/"*/copyright \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
}

post_install() {
  echo "Note: Smart Browser is officially supported on Ubuntu-based systems."
}
