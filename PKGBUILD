# Maintainer: Michael Markevich <m.markevich@gmail.com>
# Maintainer: Ilango Rajagopal <ilangokul@gmail.com>

pkgbase=endpoint-verification
pkgname=("endpoint-verification" "endpoint-verification-chrome")
_pkgver="2022.06.14.c454816986-00"
pkgver="$(tr '-' '_' <<< $_pkgver)"
pkgrel=5
pkgdesc="Endpoint Verification Helper"
arch=(x86_64)
url="https://chrome.google.com/webstore/detail/endpoint-verification/callobklhcbilhphinckomhgkigmfocg"
license=(unknown)
sha256sums=('8db7d5b96564aafd038d2e016127c8ebac0cf9480c4cdbeadaaec643c020cd39'
            '50d9e83ef1b9d32265eecc6af9d9b762ad7c29e771e136a743f29740975c4932'
            'c6368969bb236156c818eb61f7b22adea048a6d89956397fe64918265f1b2679')
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
