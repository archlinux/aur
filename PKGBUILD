# Maintainer: Maarten de Vries <maarten@de-vri.es>
pkgname=libopensmtpd
pkgver=0.6
pkgrel=2
pkgdesc="library for creating opensmtd filters"
license=(BSD)
url="http://imperialat.at/dev/libopensmtpd/"
arch=(x86_64)
source=(
	"https://distfiles.sigtrap.nl/libopensmtpd-$pkgver.tar.gz"
	"LICENSE"
)

depends=(libevent)
makedepends=(gzip)

sha512sums=(
	'2204f1b35558342a214310338fb0c8d9f574697412162270c0a92a9a0a02cd5d317c63e630959525ff4ae3f8d1d3d5664dcd38442292256182926dcc8ce613f8'
	'24ffeb515e767416728adf4f02aac9b6305447ff4ce8acdfb1ecb8321f76e261e5a536b20df9acec90542e3c3f30e259c0d11cd99d401eb154fd5faf89a6e125'
)

build() {
	cd "libopensmtpd-$pkgver"
	make -f Makefile.gnu
	gzip -kf osmtpd_run.3

}

package() {
	install -m 644 -Dt "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	install -m 644 -Dt "$pkgdir/usr/share/man/man3/" "libopensmtpd-$pkgver/osmtpd_run.3.gz"
	install -m 755 -Dt "$pkgdir/usr/lib" "libopensmtpd-$pkgver/libopensmtpd.so"

	(
		cd "libopensmtpd-$pkgver"
		shopt -s globstar nullglob
		for header in **/*.h; do
			dir="$(dirname "$header")"
			install -m 644 -Dt "$pkgdir/usr/include/libopensmtpd/$dir" "$header"
		done
	)
}
