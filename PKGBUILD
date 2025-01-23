# Maintainer: Michael Markevich <m.markevich@gmail.com>
# Maintainer: Ilango Rajagopal <ilangokul@gmail.com>

pkgbase=endpoint-verification
pkgname=("endpoint-verification" "endpoint-verification-chrome")
_pkgver="2023.12.18.c591921611-00"
pkgver="$(tr '-' '_' <<< $_pkgver)"
pkgrel=11
pkgdesc="Endpoint Verification Helper"
arch=(x86_64)
url="https://chrome.google.com/webstore/detail/endpoint-verification/callobklhcbilhphinckomhgkigmfocg"
license=(unknown)
# https://packages.cloud.google.com/apt/dists/endpoint-verification/main/binary-amd64/Packages
md5sums=('0ed3d7aced2a9858c943a958c4c8ee9a'
         '5bf530393987f3b05336cf4428462892'
         '92a02a6fe12d2d2d8da4c8900a9f1d87')
sha256sums=('557e0ce3527e2bc3a29906cbc8adfbae5e469fad9cf8dd2ca75d04a9ddc3dcc5'
            '50d9e83ef1b9d32265eecc6af9d9b762ad7c29e771e136a743f29740975c4932'
            '3878461e75d3ef9ac93ae59e5f5523eb1301fbbebc5d0ea318ba317542367b2b')
source=("https://packages.cloud.google.com/apt/pool/${pkgbase}/${pkgbase}_${_pkgver}_amd64_${md5sums[0]}.deb"
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
