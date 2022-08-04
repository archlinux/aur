# Maintainer: Erik Bročko (OM2LT) <erik@brocko.eu>

pkgname=codecserver-git
pkgver=0.2.0.r1.g7c353aa
pkgrel=1
pkgdesc="Modular audio codec server, coordinates central dispatching and (hardware or software) codecs over the network."
arch=('x86_64')
url="https://github.com/jketterl/codecserver"
license=('GPL3')
makedepends=('git' 'cmake' 'protobuf')
conflicts=('codecserver')
provides=('codecserver')
source=(
	"$pkgname"::'git+https://github.com/jketterl/codecserver'
	'codecserver.sysusers'
)
sha256sums=(
	'SKIP'
	'ac2f4184640ce200e6ee230fdce72417813e77584d1b78cd50a30fc4cb60e682'
)

pkgver() {
	cd "$srcdir/$pkgname"
	# use git tag or fall back to number of revisions
	( set -o pipefail
		git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cmake -B build -S "$srcdir/$pkgname" \
		-DCMAKE_INSTALL_PREFIX=/usr
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir/" install
	
	install -Dm 644 "$pkgdir/lib/systemd/system/codecserver.service" "$pkgdir/usr/lib/systemd/system/codecserver.service"
	rm "$pkgdir/lib/systemd/system/codecserver.service"
	find "$pkgdir/lib" -type d -empty -delete

	install -Dm 644 "$srcdir/codecserver.sysusers" "$pkgdir/usr/lib/sysusers.d/codecserver.conf"
	install -Dm 644 "$srcdir/$pkgname/conf/codecserver.conf" "$pkgdir/etc/codecserver/codecserver.conf"
}
