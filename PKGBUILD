# Maintainer: Arthur D'Andréa Alemar <aalemmar@gmail.com>

pkgname=prometheus
pkgver=0.15.1
pkgrel=1
pkgdesc="An open-source service monitoring system and time series database."
arch=('i686' 'x86_64')
url="http://prometheus.io"
license=('APACHE')
install="$pkgname.install"
backup=('etc/prometheus.yml')
source=("https://github.com/prometheus/prometheus/archive/$pkgver.tar.gz"
        'prometheus.service'
        'prometheus.patch')
sha256sums=('72024ca2fa291e78ccca6fc22e0b5aa5033a26436ceac3d9eb3955404d033163'
            '62e55095ee2b59b6432c52bac18750bc68a26d0ba9a65fce1d1a7b3a9d548e87'
            '6bcfa8a2be27cb4c786d1780685b643467f06027f51be60c901027815ef3a6ba')
build() {
	cd "$srcdir/$pkgname-$pkgver"
	patch < "$srcdir/prometheus.patch"
	make build
}

# check() {
#     make -C "$srcdir/$pkgname-$pkgver" test
# }

package() {
	install -dm755 "$pkgdir/usr/bin/$pkgsrc"
	install -m755 "$srcdir/$pkgname-$pkgver/prometheus" "$pkgdir/usr/bin/$pkgsrc"

	install -dm755 "$pkgdir/etc"
	install -m644 "$srcdir/$pkgname-$pkgver/documentation/examples/prometheus.yml" "$pkgdir/etc"
	
	install -dm755 "$pkgdir/usr/lib/systemd/system"
	install -m644 "${srcdir}/prometheus.service" "$pkgdir/usr/lib/systemd/system/prometheus.service"
}
