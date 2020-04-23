# Maintainer: Markus Sommer <markus@splork.de>

_gopkgname='github.com/dtn7/dtn7-go'

pkgname=dtn7
pkgver=0.6.1
pkgrel=1
pkgdesc="Delay tolerant routing daemon - Implements Bundle Protocol Version 7"
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
url="https://dtn7.github.io/"
license=('GPL3')
depends=("glibc")
makedepends=("go")
provides=('dtnd' "dtncat")
conflicts=('dtnd')
backup=("etc/dtn7/configuration.toml" "etc/ufw/applications.d/dtn7")
source=("https://$_gopkgname/archive/v$pkgver.tar.gz"
	    "https://github.com/CryptoCopter/dtn7-contrib/archive/v$pkgver-$pkgrel.tar.gz")
sha512sums=("5f591d128b64b09a63cf51c8a647f9f97e28486d67fd3e4d5df9a4349b2122c082895def6b3220c97fe00a6def699ccb713aded508a49fde9b871c90fa9fa04f"
	        "518deeaae9dae9f5ea83601fcb0e35a64a21b4b110606aafd6ea44c76c8c855375b7dd5bfde0a84b3cfb31c99d9a5525f8f24514d8a6dc15bc168080c66583d2")

build() {
	cd "$srcdir/$pkgname-go-$pkgver"
	export GO111MODULE=on
	go build -buildmode=pie -trimpath -ldflags "-extldflags $LDFLAGS" ./cmd/dtnd
	go build -buildmode=pie -trimpath -ldflags "-extldflags $LDFLAGS" ./cmd/dtn-tool
}

package() {
	cd "$srcdir/dtn7-contrib-$pkgver-$pkgrel"
	install -D -m 0644 "configuration.toml" "$pkgdir/etc/dtn7/configuration.toml"
	install -D -m 0644 "dtn7.service" "$pkgdir/usr/lib/systemd/system/dtn7.service"
	install -D -m 0644 "dtn7.ufw" "$pkgdir/etc/ufw/applications.d/dtn7"
	install -D -m 0644 "dtn7.sysusers" "$pkgdir/usr/lib/sysusers.d/dtn7.conf"
	install -D -m 0644 "dtn7.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/dtn7.conf"

	cd "$srcdir/$pkgname-go-$pkgver"
	install -D -m 0755 dtnd "$pkgdir/usr/bin/dtnd"
	install -D -m 0755 dtn-tool "$pkgdir/usr/bin/dtn-tool"
}
