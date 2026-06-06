# Maintainer: Emanuele Sparvoli <sparvoli@gmail.com>
pkgname=wireview-linux-bin
pkgver=1.0.6.0
pkgrel=1
pkgdesc="Unofficial Linux GUI for the Thermal Grizzly WireView Pro II (prebuilt binary)"
arch=('x86_64')
url="https://github.com/emaspa/wireview-linux"
license=('custom')
depends=('glibc' 'gcc-libs' 'zlib' 'fontconfig' 'freetype2' 'libx11' 'icu')
provides=('wireview-linux')
conflicts=('wireview-linux')
# Self-contained .NET single-file binary — must not be stripped.
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/wireview-linux-$pkgver-linux-x64.tar.gz"
        "wireview-linux.desktop"
        "wireview-linux.png")
sha256sums=('4cca244fca9b0cf829d8de15d1d5623fb21aa701d36234209ce66714b164da4a'
            'a08180f8c00f0d8b4b8a6dc5cbf1644c5e25afb985e5bf3b7972ab33831e15e3'
            '5bdcde4399af5bd57824af8dcacdd05c6421eddbb18993210ddab805ef1aaff3')

package() {
  local src="$srcdir/wireview-linux-$pkgver-linux-x64"

  # Application binary + launcher symlink
  install -Dm755 "$src/WireView2" "$pkgdir/usr/lib/wireview-linux/WireView2"
  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/wireview-linux/WireView2 "$pkgdir/usr/bin/wireview-linux"

  # udev rule (USB serial access)
  install -Dm644 "$src/99-wireview.rules" "$pkgdir/usr/lib/udev/rules.d/99-wireview.rules"

  # Desktop entry + icon
  install -Dm644 "$srcdir/wireview-linux.desktop" "$pkgdir/usr/share/applications/wireview-linux.desktop"
  install -Dm644 "$srcdir/wireview-linux.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/wireview-linux.png"

  # License / notes
  install -Dm644 "$src/README.txt" "$pkgdir/usr/share/licenses/$pkgname/README.txt"
}
