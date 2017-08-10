pkgname=speedtouch-firmware
pkgver=3.0.1.2
pkgrel=1
pkgdesc='Firmware for Thomson SpeedTouch modems'
arch=(any)
makedepends=(tcc)
license=(custom)
source=(
	'http://www.linux-usb.org/SpeedTouch/firmware/firmware-extractor.tar.gz'
	'https://web.archive.org/web/20061203044952/http://www.speedtouch.com/download/drivers/USB/SpeedTouch330_firmware_3012.zip'
	'https://web.archive.org/web/20070306191113/http://www.speedtouch.com/driver_upgrade_lx_3.0.1.2.htm'
)
sha512sums=(
	'2d2e55f46961dfe20218a17a6fe897fc35f7cd2802dc6f61ff3124b8ff51a2d8f5275c683b2f2676e72451b220d2f705550ab5d73923de284fa591fec8796efa'
	'd4ec1b609eb58b15b0c569fc2c96e453517f6a8141c706f342549093c2c7bbdc09bbc3f05ecf75f3018e54f03a974b84e625fb9401f02d4f4143b721eee0b3c3'
	'SKIP'
)

build() {
	cd "$srcdir/firmware-extractor"
	tcc firmware.c -o firmware-extractor

	sed -e '/^<!-- BEGIN WAYBACK TOOLBAR INSERT -->/,/^<!-- END WAYBACK TOOLBAR INSERT -->/ d' \
		"$srcdir/driver_upgrade_lx_3.0.1.2.htm" > "$srcdir/license.html"

	./firmware-extractor ../"ZZZL_3.012"
	mv speedtch-1.bin ../speedtch-1.bin.4 # .00
	mv speedtch-2.bin ../speedtch-2.bin.4 # .00
	./firmware-extractor ../"KQD6_3.012"
	mv speedtch-1.bin ../speedtch-1.bin.2
	mv speedtch-2.bin ../speedtch-2.bin.2
}

package() {
	install -dm0755 "$pkgdir/usr/lib/firmware"
	install -Dm0644 -t "$pkgdir/usr/lib/firmware" \
		"$srcdir"/speedtch-?.bin*
	install -Dm0644 "$srcdir/license.html" \
		"$pkgdir/usr/share/licenses/$pkgname/license.html"
}
