# Maintainer: Ilango Rajagopal <ilangokul@gmail.com>

pkgbase=endpoint-verification
pkgname=("endpoint-verification" "endpoint-verification-chrome")
_pkgver="2020.10.19.c337849236-00"
pkgver="$(tr '-' '_' <<< $_pkgver)"
pkgrel=2
pkgdesc="Endpoint Verification Helper"
arch=(x86_64)
url="https://chrome.google.com/webstore/detail/endpoint-verification/callobklhcbilhphinckomhgkigmfocg"
license=(unknown)
sha256sums=("da2bec1a83b3bbc55815878c8676e9bf3f8043c235059b8f13fe066ff712fb1b" "SKIP")
source=("${pkgbase}.deb::https://packages.cloud.google.com/apt/pool/${pkgbase}_${_pkgver}_amd64_${sha256sums[0]}.deb"
	"endpoint-verification.service")

prepare() {
	mkdir -p data
	tar -C data -xf data.tar.gz
	mv data/etc/init.d/endpoint-verification data/opt/google/endpoint-verification
	rmdir data/etc/init.d
}

package_endpoint-verification() {
	pkgdesc="Endpoint Verification Helper for Chromium"
	depends=(chromium)

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
