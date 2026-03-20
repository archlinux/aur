# Maintainer: Daksh Choudhary <ch.daksh01@gmail.com>
# Maintainer: Vivek Sudan <s.viveksudan@gmail.com>

pkgname=smartbrowser-bin
pkgver=2.4.1
pkgrel=2
pkgdesc="HackerEarth Smart Browser for secure assessments"
arch=('x86_64')
url="https://www.hackerearth.com/challenges/smart-browser/sap-9/"
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

options=('!strip' '!debug')

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
  chmod -R 755 "$pkgdir/usr" 
  
  # Fix Debian-specific lib path
  if [ -d "$pkgdir/usr/lib/x86_64-linux-gnu" ]; then
    mkdir -p "$pkgdir/usr/lib"
    mv "$pkgdir/usr/lib/x86_64-linux-gnu/"* "$pkgdir/usr/lib/"
    rmdir "$pkgdir/usr/lib/x86_64-linux-gnu"
  fi

  # Install license if exists
  if [ -f "$pkgdir/usr/share/doc/smart-browser/copyright" ]; then
    install -Dm644 "$pkgdir/usr/share/doc/smart-browser/copyright" \
      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}

install=smartbrowser-bin.install
