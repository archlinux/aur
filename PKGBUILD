# Maintainer: Arthur D'Andréa Alemar <aalemmar@gmail.com>

pkgname=prometheus
pkgver=0.15.1
pkgrel=2
pkgdesc="An open-source service monitoring system and time series database."
depends=('glibc')
arch=('i686' 'x86_64')
url="http://prometheus.io"
license=('APACHE')
install="$pkgname.install"
backup=('etc/prometheus/prometheus.yml')
source=("https://github.com/prometheus/prometheus/archive/$pkgver.tar.gz"
				'prometheus.service'
				'01-Do_not_embed_blobs.patch'
				'02-Default_settings.patch')
sha256sums=('72024ca2fa291e78ccca6fc22e0b5aa5033a26436ceac3d9eb3955404d033163'
						'8446311e207d42f80844c8628b720dc16003217c79edccd5b0efbd0ae6ff32ca'
						'8c0b16892c156bfd77c1ebc6d53d01253c2e5d7f6bb24df8ae06741722af6bfd'
						'8e1c341b19c2629402c7d8233e57620fff7cb865e08821ddb7cc28fca7384eb9')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	patch -p1 -i "$srcdir/01-Do_not_embed_blobs.patch"
	patch -p1 -i "$srcdir/02-Default_settings.patch"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make build
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make test
}

package() {
	install -dm755 "$pkgdir/usr/bin/$pkgsrc"
	install -m755 "$srcdir/$pkgname-$pkgver/prometheus" "$pkgdir/usr/bin/$pkgsrc"

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
