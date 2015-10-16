# Maintainer: Arthur D'Andréa Alemar <aalemmar@gmail.com>

pkgname=prometheus
pkgver=0.16.1
pkgrel=1
pkgdesc="An open-source service monitoring system and time series database."
depends=('glibc')
makedepends=('go')
arch=('i686' 'x86_64')
url="http://prometheus.io"
license=('APACHE')
install="$pkgname.install"
backup=('etc/prometheus/prometheus.yml')
source=("https://github.com/prometheus/prometheus/archive/$pkgver.tar.gz"
				'prometheus.service'
				'01-Do_not_embed_blobs.patch'
				'02-Default_settings.patch')
sha256sums=('b91eb5b8223b08bb42dbfd93b22427bd338be10a12413524c3273666f570f894'
            '8446311e207d42f80844c8628b720dc16003217c79edccd5b0efbd0ae6ff32ca'
            'd21de4f7ee5d78152b6aa3673d805d769f229f8558b563c6fcdf9513b5847ec7'
            'a971f44220418836c55e1ed83864f5d287517f41b50f0b5648b249092915aa19')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	patch -p1 -i "$srcdir/01-Do_not_embed_blobs.patch"
	patch -p1 -i "$srcdir/02-Default_settings.patch"
	export GOPATH="$srcdir/gopath"
	mkdir -p "$GOPATH/src/github.com/prometheus"
	rm -f "$GOPATH/src/github.com/prometheus/prometheus"
	ln -sr "$srcdir/$pkgname-$pkgver" "$GOPATH/src/github.com/prometheus/prometheus"
}

build() {
	export GOPATH="$srcdir/gopath"
	cd "$GOPATH/src/github.com/prometheus/prometheus"
	make build
}

check() {
	export GOPATH="$srcdir/gopath"
	cd "$GOPATH/src/github.com/prometheus/prometheus"
	make test
}

package() {
	install -dm755 "$pkgdir/usr/bin/$pkgsrc"
	install -m755 "$srcdir/$pkgname-$pkgver/prometheus" "$pkgdir/usr/bin/$pkgsrc"
	install -m755 "$srcdir/$pkgname-$pkgver/promtool" "$pkgdir/usr/bin/$pkgsrc"

	install -dm755 "$pkgdir/etc/prometheus"
	install -m644 "$srcdir/$pkgname-$pkgver/documentation/examples/prometheus.yml" "$pkgdir/etc/prometheus"

	install -dm755 "$pkgdir/etc/prometheus/console_libraries"
	install -dm755 "$pkgdir/etc/prometheus/consoles"

	install -dm755 "$pkgdir/usr/lib/systemd/system"
	install -m644 "${srcdir}/prometheus.service" "$pkgdir/usr/lib/systemd/system/prometheus.service"

	install -dm755 "$pkgdir/usr/share/doc/prometheus/examples"
	cp -R "$srcdir/$pkgname-$pkgver/consoles" "$pkgdir/usr/share/doc/prometheus/examples"
	cp -R "$srcdir/$pkgname-$pkgver/console_libraries" "$pkgdir/usr/share/doc/prometheus/examples"

	install -dm755 "$pkgdir/usr/share/prometheus/web"
	cp -R "$srcdir/$pkgname-$pkgver/web/blob/templates" "$pkgdir/usr/share/prometheus/web"
	cp -R "$srcdir/$pkgname-$pkgver/web/blob/static" "$pkgdir/usr/share/prometheus/web"
}
