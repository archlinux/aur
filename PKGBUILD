# Maintainer: Andrew Simmons <agsimmons0 at gmail dot com>
# Contributor: Matrix <thysupremematrix atttt tuta dottt io>
# Contributor: David Bernheisel <david+aur at bernheisel dot com>
# Based on the brscan4 PKGBUILD by Harey

pkgname=brscan5
pkgver=1.7.0_0
pkgrel=1
pkgdesc='SANE drivers from Brother for compatible models'
arch=('i686' 'x86_64')
license=('GPL' 'custom:Brother')
url="http://support.brother.com"
depends=('sane' 'libusb-compat')
optdepends=('gtk2: for running brscan_gnetconfig')
source=()
sha256sums_i686=('e74ef3a5529ebf3b26d6139ce15d75374a4538ba2efd48c28b209b0d705e5ec7')
sha256sums_x86_64=('197f63a52e89b8744f5a3c2d843abb3b76d003d5d4830bdfe675c44841a6c72b')
source_i686=("https://download.brother.com/welcome/dlf104035/${pkgname}-${pkgver/_/-}.i386.rpm")
source_x86_64=("https://download.brother.com/welcome/dlf104036/${pkgname}-${pkgver/_/-}.x86_64.rpm")
install="brscan5.install"

build() {
  mkdir -p usr/lib/udev/rules.d
  mkdir -p etc/sane.d/dll.d
}

package() {
  cp -r "$srcdir/etc" "$pkgdir"
  cp -r "$srcdir/opt" "$pkgdir"
  cp -r "$srcdir/usr" "$pkgdir"

  install -D -m644 "$srcdir/opt/brother/scanner/brscan5/doc/LICENSE_ENG.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE_ENG.txt"
  install -D -m644 "$srcdir/opt/brother/scanner/brscan5/doc/LICENSE_JPN.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE_JPN.txt"

  echo "brother5" > "$pkgdir/etc/sane.d/dll.d/brother5.conf"
  chmod 644 "$pkgdir/etc/sane.d/dll.d/brother5.conf"

  install -D -m644 "$srcdir/opt/brother/scanner/brscan5/udev-rules/NN-brother-mfp-brscan5-1.0.2-2.rules" "$pkgdir/usr/lib/udev/rules.d/40-${pkgname}.rules"
  sed -i '/SYSFS/d' "$pkgdir/usr/lib/udev/rules.d/40-${pkgname}.rules"

  mkdir -p "$pkgdir/usr/lib/sane"
  cd "$pkgdir/usr/lib/sane" || exit 1
  mv "$pkgdir/opt/brother/scanner/brscan5/libsane-brother5.so.1.0.7" "$pkgdir/usr/lib/sane"
  ln -sf libsane-brother5.so.1.0.7 libsane-brother5.so.1
  ln -sf libsane-brother5.so.1 libsane-brother5.so

  cd "$pkgdir/usr/lib" || exit 1
  mv "$pkgdir/opt/brother/scanner/brscan5/libLxBsScanCoreApi.so.3.2.6" "$pkgdir/usr/lib"
  ln -sf "libLxBsScanCoreApi.so.3.2.6" "libLxBsScanCoreApi.so.3"
  ln -sf "libLxBsScanCoreApi.so.3" "libLxBsScanCoreApi.so"

  libs=(libLxBsNetDevAccs libLxBsDeviceAccs libLxBsUsbDevAccs)
  for lib in "${libs[@]}"; do
    mv "$pkgdir/opt/brother/scanner/brscan5/${lib}.so.1.0.0" "$pkgdir/usr/lib"
    ln -sf "$lib.so.1.0.0" "$lib.so.1"
    ln -sf "$lib.so.1" "$lib.so"
  done

  mkdir -p "$pkgdir/usr/bin"
  cd "$pkgdir/usr/bin" || exit 1
  bins=(brsaneconfig5 brscan_cnetconfig brscan_gnetconfig setupSaneScan5)
  for bin in "${bins[@]}"; do
    mv "$pkgdir/opt/brother/scanner/brscan5/${bin}" "${bin}"
    ln -s "/usr/bin/${bin}" "$pkgdir/opt/brother/scanner/brscan5/${bin}"
  done
}
