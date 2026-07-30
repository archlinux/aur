# Maintainer: Jason Go <jasongo@jasongo.net>

pkgname=kvrt-x86_64
pkgver=24.0.6.0.202607301739
pkgrel=1
pkgdesc='Kaspersky Virus Removal Tool - Runtime and Database Signature'
arch=('x86_64')
url='https://www.kaspersky.com/downloads/free-virus-removal-tool'
license=('LicenseRef-EULA-Kaspersky')
makedepends_x86_64=(
  'binwalk'
  'gendesk'
)
optdepends_x86_64=(
  'kesl-gui: Kaspersky Endpoint Security for Linux'
)
options=(!debug)
source_x86_64=("$pkgname-$pkgver-$pkgrel.run::https://devbuilds.s.kaspersky-labs.com/devbuilds/kvrt_linux/latest/kvrt.run")
b2sums_x86_64=('27d8faefcc93bea86cd57529cc6664b0d7846f33c2de74695bdcb49da06a389de86b791d6d57fdbcc684562b943a7dfe9fc64200130b4f1e33c6ffbedc4f2460')

prepare() {
  if [[ "$CARCH" != "x86_64" ]]; then
    return 0
  fi

  # Extract kvrt icon
  binwalk -M -q -e $pkgname-$pkgver-$pkgrel.run 2>/dev/null
  mv $srcdir/extractions/kvrt-*.run.extracted/*/decompressed.bin.extracted/*/bin/libKvrtGui.so.extracted/1F72E5/image.png kvrt.png
  
  # Create .desktop file
  gendesk -f \
    --pkgname="kvrt" \
    --name="Kaspersky Virus Removal Tool" \
    --comment="Kaspersky Virus Removal Tool helps clean your Linux PC of malware if it has been infected." \
    --exec="/usr/bin/kvrt" \
    --icon="kvrt" \
    --categories="System;Security"
}

package() {
  if [[ "$CARCH" != "x86_64" ]]; then
    return 0
  fi

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
