# Maintainer: Jason Go <jasongo@jasongo.net>

pkgname=kvrt-aarch64
pkgver=24.0.6.0.202607301720
pkgrel=1
pkgdesc='Kaspersky Virus Removal Tool - Runtime and Database Signature'
arch=('aarch64')
url='https://www.kaspersky.com/downloads/free-virus-removal-tool'
license=('LicenseRef-EULA-Kaspersky')
makedepends_aarch64=(
  'binwalk'
  'gendesk'
)
options=(!debug)
source_aarch64=("$pkgname-$pkgver-$pkgrel.run::https://devbuilds.s.kaspersky-labs.com/kvrt_linux/latest/arm-64/kvrt.run")
b2sums_aarch64=('f0eb1f3af602c399831caf45c5a1ac047c802e6b4c061521fb83bc973603dba8593c6268f67b2362d9095fea63e544e090cfb7e739db0af8d4514c050eed32c6')

prepare() {
  if [[ "$CARCH" != "aarch64" ]]; then
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
  if [[ "$CARCH" != "aarch64" ]]; then
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
