# Maintainer: Jason Go <jasongo@jasongo.net>

pkgname=kvrt
pkgver=24.0.6.0.202607290533
pkgrel=2
pkgdesc='Kaspersky Virus Removal Tool helps clean your Linux PC of malware if it has been infected.'
arch=('x86_64')
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
source=("$pkgname-$pkgver-$pkgrel.run::https://devbuilds.s.kaspersky-labs.com/devbuilds/kvrt_linux/latest/kvrt.run")
b2sums=('b914973d115b9b416ca1012b3eb40bd34c6def65e95b7fb6aee0a1e98a0c453478bc93dec377b2b66ba9f1c8eb3624f3346e157d0cf069d9a9025302586429ed')

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
