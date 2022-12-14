# Maintainer: Michael Markevich <m.markevich@gmail.com>
# Maintainer: Ilango Rajagopal <ilangokul@gmail.com>

pkgbase=endpoint-verification
pkgname=("endpoint-verification" "endpoint-verification-chrome")
_pkgver="2022.11.24.c490697573-00"
pkgver="$(tr '-' '_' <<< $_pkgver)"
pkgrel=10
pkgdesc="Endpoint Verification Helper"
arch=(x86_64)
url="https://chrome.google.com/webstore/detail/endpoint-verification/callobklhcbilhphinckomhgkigmfocg"
license=(unknown)
sha256sums=('e0e92c5218a6e90d1a940a790643920f5ceb4ab446c2c848cde016f9ad8bc98f'
            '50d9e83ef1b9d32265eecc6af9d9b762ad7c29e771e136a743f29740975c4932'
            '3878461e75d3ef9ac93ae59e5f5523eb1301fbbebc5d0ea318ba317542367b2b')
source=("https://packages.cloud.google.com/apt/pool/${pkgbase}_${_pkgver}_amd64_${sha256sums[0]}.deb"
	"endpoint-verification.service"
	"opera.patch")

prepare() {
	tar -xf data.tar.gz
	mv etc/init.d/endpoint-verification opt/google/endpoint-verification/bin
	rmdir etc/init.d
	patch --directory="$srcdir" --forward --strip=0 --input="${srcdir}/opera.patch"
}

package_endpoint-verification() {
	pkgdesc="Endpoint Verification Helper for Chromium"
	depends=(chromium)

	cp -a "$srcdir/opt" "$pkgdir"
	cp -a "$srcdir/usr" "$pkgdir"
	cp -a "$srcdir/etc" "$pkgdir"
	install -D -m0644 -t "$pkgdir/usr/lib/systemd/system" "$srcdir/endpoint-verification.service"

	mv "$pkgdir/etc/opt/chrome" "$pkgdir/etc/chromium"
	rmdir "$pkgdir/etc/opt"
}

package_endpoint-verification-chrome() {
	pkgdesc="Endpoint verification Helper for Google Chrome"
	depends=(google-chrome)
	provides=(endpoint-verification)
	conflicts=(endpoint-verification)
	
	cp -a "$srcdir/opt" "$pkgdir"
	cp -a "$srcdir/usr" "$pkgdir"
	cp -a "$srcdir/etc" "$pkgdir"
	install -D -m0644 -t "$pkgdir/usr/lib/systemd/system" "$srcdir/endpoint-verification.service"
}
