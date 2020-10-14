# Maintainer: Ilango Rajagopal <ilangokul@gmail.com>

pkgbase=endpoint-verification
pkgname=(endpoint-verification endpoint-verification-chrome)
_pkgver=2020.09.29.c334423510-00
pkgver=2020.09.29.c334423510_00
pkgrel=1
pkgdesc="Endpoint Verification Helper for Chromium"
arch=(x86_64)
url="https://chrome.google.com/webstore/detail/endpoint-verification/callobklhcbilhphinckomhgkigmfocg"
license=(unknown)
depends=(chromium)
sha256sums=("74682ecaa214a1cc192cd9be4be64f5b3762caf53e7a3376e103d11c7c37424a" "SKIP")
source=("${pkgbase}.deb::https://packages.cloud.google.com/apt/pool/${pkgbase}_${_pkgver}_amd64_${sha256sums[0]}.deb"
	"endpoint-verification.service")

prepare() {
	mkdir -p data
	tar -C data -xf data.tar.gz
	mv data/etc/init.d/endpoint-verification data/opt/google/endpoint-verification
	rmdir data/etc/init.d
}

package_endpoint-verification() {
	cp -a "$srcdir/data/opt" "$pkgdir"
	cp -a "$srcdir/data/usr" "$pkgdir"
	cp -a "$srcdir/data/etc" "$pkgdir"
	install -D -m0644 -t "$pkgdir/usr/lib/systemd/system" "$srcdir/endpoint-verification.service"

	mv "$pkgdir/etc/opt/chrome" "$pkgdir/etc/chromium"
	rmdir "$pkgdir/etc/opt"
}

package_endpoint-verification-chrome() {
	pkgdesc="Endpoint verification Helper for Google Chrome"
	depends=(google-chrome)
	provides=(endpoint-verification)
	conflicts=(endpoint-verification)
	
	cp -a "$srcdir/data/opt" "$pkgdir"
	cp -a "$srcdir/data/usr" "$pkgdir"
	cp -a "$srcdir/data/etc" "$pkgdir"
	install -D -m0644 -t "$pkgdir/usr/lib/systemd/system" "$srcdir/endpoint-verification.service"
}
