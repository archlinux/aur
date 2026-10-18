# Maintainer: Emanuele Sparvoli <sparvoli@gmail.com>
pkgname=wireview-linux-bin
pkgver=1.4.1.0
pkgrel=1
pkgdesc="Unofficial Linux GUI for the Thermal Grizzly WireView Pro II, with WireView Mini (prebuilt binary)"
arch=('x86_64')
url="https://github.com/emaspa/wireview-linux"
license=('custom')
depends=('glibc' 'gcc-libs' 'zlib' 'fontconfig' 'freetype2' 'libx11')
optdepends=('wireview-hwmon: hwmon + daemon mode (1.8.1 or later takes the LAN port back from WireView Mini)'
            'dfu-util: in-app and WireView Mini firmware flashing')
provides=('wireview-linux')
conflicts=('wireview-linux')
# Self-contained .NET single-file binary - must not be stripped.
options=('!strip')
# pkgrel in the file name keeps makepkg from reusing a cached copy when a
# release tarball is repacked.
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/releases/download/v$pkgver/wireview-linux-$pkgver-linux-x64.tar.gz"
        "wireview-linux.desktop"
        "wireview-linux.png")
sha256sums=('2810c92a3bdf377c9761795037d173dd0450253b092de41b77e9ae4e4334871b'
            '57c8565769d8ef620411bb40b2e59e82272eecd71802d5e8fd3f995591df6008'
            '5bdcde4399af5bd57824af8dcacdd05c6421eddbb18993210ddab805ef1aaff3')

package() {
  local src="$srcdir/wireview-linux-$pkgver-linux-x64"

  # Application binary + launcher symlink
  install -Dm755 "$src/WireView2" "$pkgdir/usr/lib/wireview-linux/WireView2"
  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/wireview-linux/WireView2 "$pkgdir/usr/bin/wireview-linux"

  # WireView Mini (NativeAOT). It reads the serial port library, the firmware
  # image and the factory artwork from its own directory, which it finds
  # through the symlink's real path.
  install -Dm755 "$src/wireview-mini" "$pkgdir/usr/lib/wireview-linux/wireview-mini"
  install -m644 "$src/libSystem.IO.Ports.Native.so" "$src/TG-WV-PRO2-FW.hex" "$src/ext_flash.bin" \
    "$pkgdir/usr/lib/wireview-linux/"
  ln -s /usr/lib/wireview-linux/wireview-mini "$pkgdir/usr/bin/wireview-mini"

  # udev rule (USB serial access). Arch has no dialout group, its serial group
  # is uucp. The serial port gets uucp from Arch's default rules; the DFU
  # bootloader line names dialout, which udev would drop with a log message.
  # The grep fails the build if a future rule stops matching the substitution.
  install -Dm644 "$src/99-wireview.rules" "$pkgdir/usr/lib/udev/rules.d/99-wireview.rules"
  sed -i 's/GROUP="dialout"/GROUP="uucp"/g' "$pkgdir/usr/lib/udev/rules.d/99-wireview.rules"
  grep -q 'GROUP="uucp"' "$pkgdir/usr/lib/udev/rules.d/99-wireview.rules"

  # Desktop entries + icon (WireView Mini's entry, from the tarball, uses the app's icon)
  install -Dm644 "$srcdir/wireview-linux.desktop" "$pkgdir/usr/share/applications/wireview-linux.desktop"
  install -Dm644 "$src/wireview-mini.desktop" "$pkgdir/usr/share/applications/wireview-mini.desktop"
  install -Dm644 "$srcdir/wireview-linux.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/wireview-linux.png"

  # License / notes
  install -Dm644 "$src/README.txt" "$pkgdir/usr/share/licenses/$pkgname/README.txt"
}
