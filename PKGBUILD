# Maintainer: Emanuele Sparvoli <sparvoli@gmail.com>
pkgname=wireview-linux-bin
pkgver=1.3.1.0
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
# pkgrel in the file name keeps makepkg from reusing a cached copy when a
# release tarball is repacked.
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/releases/download/v$pkgver/wireview-linux-$pkgver-linux-x64.tar.gz"
        "wireview-linux.desktop"
        "wireview-linux.png")
sha256sums=('de4dcc465e46a0a3ac247867e1879eeb3dcf16c4843eaa5fc87a44b4d4c7cfb1'
            '57c8565769d8ef620411bb40b2e59e82272eecd71802d5e8fd3f995591df6008'
            '5bdcde4399af5bd57824af8dcacdd05c6421eddbb18993210ddab805ef1aaff3')

package() {
  local src="$srcdir/wireview-linux-$pkgver-linux-x64"

  # Application binary + launcher symlink
  install -Dm755 "$src/WireView2" "$pkgdir/usr/lib/wireview-linux/WireView2"
  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/wireview-linux/WireView2 "$pkgdir/usr/bin/wireview-linux"

  # udev rule (USB serial access). Arch has no dialout group, its serial group
  # is uucp, and udev drops a rule line whose GROUP it cannot resolve. The grep
  # fails the build if a future rule stops matching the substitution.
  install -Dm644 "$src/99-wireview.rules" "$pkgdir/usr/lib/udev/rules.d/99-wireview.rules"
  sed -i 's/GROUP="dialout"/GROUP="uucp"/g' "$pkgdir/usr/lib/udev/rules.d/99-wireview.rules"
  grep -q 'GROUP="uucp"' "$pkgdir/usr/lib/udev/rules.d/99-wireview.rules"

  # Desktop entry + icon
  install -Dm644 "$srcdir/wireview-linux.desktop" "$pkgdir/usr/share/applications/wireview-linux.desktop"
  install -Dm644 "$srcdir/wireview-linux.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/wireview-linux.png"

  # License / notes
  install -Dm644 "$src/README.txt" "$pkgdir/usr/share/licenses/$pkgname/README.txt"
}
