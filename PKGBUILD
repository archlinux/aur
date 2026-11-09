pkgname=dovewarden
pkgver=0.1.1
pkgrel=2
pkgdesc="a Dovecot replication controller, bringing back replication to Dovecot 2.4+ servers"
arch=(x86_64)
url="https://github.com/dovewarden/dovewarden"
license=('MIT')
depends=('dovecot')
makedepends=('go')
backup=('etc/conf.d/dovewarden')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dovewarden/dovewarden/archive/refs/tags/$pkgver.tar.gz"
	"dovewarden.conf.d"
	"dovewarden.service")
sha256sums=('bc717b5020e4565dda03a20be40044a175ffb91c98a412e1702f5a146f988c64'
            'd79af8005d7772fd1883c3778375ac7e281c4d3544d4d31f9a82d19bceb86d58'
            'cb57bdf9c4fa8aa3b72a84727cf1ba70017c3c2f61192f0aa959c1c4e0241e4d')

build() {
	cd "$pkgname-$pkgver"
	go build \
		-ldflags="-w -s -extldflags '-static' -X main.version=${pkgver}" \
		-a \
		-o dovewarden \
		./cmd/dovewarden
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm0755 dovewarden "$pkgdir"/usr/bin/dovewarden
	install -Dm0644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	install -Dm0644 "$srcdir"/dovewarden.conf.d "$pkgdir"/etc/conf.d/dovewarden
	install -Dm0644 "$srcdir"/dovewarden.service "$pkgdir"/usr/lib/systemd/system/dovewarden.service
}
