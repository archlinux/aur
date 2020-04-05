# Maintainer: Markus Sommer <markus@splork.de>

_gopkgname='github.com/dtn7/dtn7-go'

pkgname=dtn7
pkgver=0.5.4
pkgrel=2
pkgdesc="Delay tolerant routing daemon - Implements Bundle Protocol Version 7"
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
url="https://dtn7.github.io/"
license=('GPL3')
depends=("glibc")
makedepends=("go")
provides=('dtnd' "dtncat")
conflicts=('dtnd')
backup=("etc/dtn7/configuration.toml" "usr/lib/systemd/system/dtn7.service")
source=("https://$_gopkgname/archive/v$pkgver.tar.gz"
	    "https://github.com/CryptoCopter/dtn7-go-contrib/archive/master.tar.gz")
sha512sums=("d2c673a52969acf0d68082a73f798b369d4bb7b9a4ba3c531ee07703668a6204e51fefa885ab5dd8efc8a3939626b67ee1035ef8a6ef53f83c9dd35c0db4e42f"
	        "55d63a6a7e3732e8cd0cd54bf33f9c26015fa333fac4a4c819857a3b1e0dc26730931f5cdbd3298065c13dce6b52eb29af317419d37b776e8d11d7cffeb65668")

build() {
	cd "$srcdir/$pkgname-go-$pkgver"
	go build -trimpath -ldflags "-extldflags $LDFLAGS" ./cmd/dtnd
	go build -trimpath -ldflags "-extldflags $LDFLAGS" ./cmd/dtncat
}

package() {
	cd "$srcdir/dtn7-go-contrib-master"
	install -D -m 0644 "configuration.toml" "$pkgdir/etc/dtn7/configuration.toml"
	install -D -m 0644 "dtn7.service" "$pkgdir/usr/lib/systemd/system/dtn7.service"
	install -D -m 0644 "dtn7.ufw" "$pkgdir/etc/ufw/applications.d/dtn7"
	install -D -m 0644 "dtn7.sysusers" "$pkgdir/usr/lib/sysusers.d/dtn7.conf"
	install -D -m 0644 "dtn7.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/dtn7.conf"

	cd "$srcdir/$pkgname-go-$pkgver"
	install -D -m 0755 dtnd "$pkgdir/usr/bin/dtnd"
	install -D -m 0755 dtncat "$pkgdir/usr/bin/dtncat"
}
