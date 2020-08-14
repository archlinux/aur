# Maintainer: Markus Sommer <markus@splork.de>

_gopkgname='github.com/dtn7/dtn7-go'
_contribname='github.com/CryptoCopter/dtn7-contrib'

pkgname=dtn7
pkgver=0.8.0
_contribrel=1
_archrel=1
pkgrel=$_contribrel.$_archrel
pkgdesc="Delay tolerant routing daemon - Implements Bundle Protocol Version 7"
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
url="https://dtn7.github.io/"
license=('GPL3')
depends=("glibc")
makedepends=("go")
provides=('dtnd' "dtn-tool")
conflicts=('dtnd')
backup=("etc/dtn7/configuration.toml" "etc/ufw/applications.d/dtn7")
source=("https://$_gopkgname/archive/v$pkgver.tar.gz"
	    "https://$_contribname/archive/v$pkgver-$_contribrel.tar.gz")
sha512sums=("61e079519740b79af2d3429694b2a4d93ce9e0e4279a973d2e464fb37ef51402503de7ee33a1ba3a439927312ec78056bcb6d5c68ff6b6b77f5f23fc10b7dab5"
	        "f50e52f6f6a75e3a09c02ea006c21ba55ff6ef97c22193625265da066bd4060da55bb11862ff488d085163fb24d18e20548e161cda5344304cfd719c9427429a")

build() {
	cd "$srcdir/$pkgname-go-$pkgver"
	export GO111MODULE=on
	go build -buildmode=pie -trimpath -ldflags "-extldflags $LDFLAGS" ./cmd/dtnd
	go build -buildmode=pie -trimpath -ldflags "-extldflags $LDFLAGS" ./cmd/dtn-tool
}

package() {
	cd "$srcdir/dtn7-contrib-$pkgver-$_contribrel"
	install -D -m 0644 "configuration.toml" "$pkgdir/etc/dtn7/configuration.toml"
	install -D -m 0644 "dtn7.service" "$pkgdir/usr/lib/systemd/system/dtn7.service"
	install -D -m 0644 "dtn7.ufw" "$pkgdir/etc/ufw/applications.d/dtn7"
	install -D -m 0644 "dtn7.sysusers" "$pkgdir/usr/lib/sysusers.d/dtn7.conf"
	install -D -m 0644 "dtn7.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/dtn7.conf"

	cd "$srcdir/$pkgname-go-$pkgver"
	install -D -m 0755 dtnd "$pkgdir/usr/bin/dtnd"
	install -D -m 0755 dtn-tool "$pkgdir/usr/bin/dtn-tool"
}
