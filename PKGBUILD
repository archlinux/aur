# Maintainer: Jason Go <jasongo@jasongo.net>

pkgname=kvrt-aarch64
pkgver=24.0.6.0.202607300535
pkgrel=1
pkgdesc='Kaspersky Virus Removal Tool helps clean your Linux PC of malware if it has been infected.'
arch=('aarch64')
url='https://www.kaspersky.com/downloads/free-virus-removal-tool'
license=('LicenseRef-EULA-Kaspersky')
makedepends=(
  'binwalk'
  'gendesk'
)
optdepends=(
  'kesl-gui: Kaspersky Endpoint Security for Linux'
)
options=(!debug)
source=("$pkgname-$pkgver-$pkgrel.run::https://devbuilds.s.kaspersky-labs.com/kvrt_linux/latest/arm-64/kvrt.run")
b2sums=('8437310c569a3cae070f1db30c83d3c4734725a012ce6ba3e777ccdf44b8e3019484add277338b040c028b400072381bc286a284859efcf88fbe5b787daffafa')

prepare() {
  # Extract kvrt icon
  binwalk -M -q -e $pkgname-$pkgver-$pkgrel.run 2>/dev/null
  mv $srcdir/extractions/kvrt-*.run.extracted/*/decompressed.bin.extracted/*/bin/libKvrtGui.so.extracted/1F72E5/image.png kvrt.png
  
  # Create .desktop file
  gendesk -f \
    --name="Kaspersky Virus Removal Tool" \
    --exec="/usr/bin/kvrt" \
    --icon="kvrt" \
    --comment="Kaspersky Virus Removal Tool helps clean your Linux PC of malware if it has been infected." \
    --categories="System;Security"
}

package() {
  install -Dm775 "$pkgname-$pkgver-$pkgrel.run" "$pkgdir/opt/kvrt/kvrt.run"
  chmod +x "$pkgdir/opt/kvrt/kvrt.run"

  # Create the kvrt symbolic link
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/kvrt/kvrt.run" "$pkgdir/usr/bin/kvrt"
  ln -s "/opt/kvrt/kvrt.run" "$pkgdir/usr/bin/kvrt.run"

  # Copy the icon and desktop file
  install -Dm644 -t "$pkgdir/usr/share/pixmaps/" kvrt.png
  install -Dm644 -t "$pkgdir/usr/share/applications/" kvrt.desktop
}
