# Maintainer: Moritz Luedecke <ritze@skweez.net>

pkgname=prometheus-git
_pkgname=prometheus
pkgver=0.14.0.r34.gea8099a
pkgrel=1
pkgdesc="An open-source service monitoring system and time series database."
arch=('i686' 'x86_64')
url="http://prometheus.io"
license=('APACHE')
install="$_pkgname.install"
backup=('etc/prometheus.yml')
source=('git://github.com/prometheus/prometheus.git'
        'prometheus.service')
sha256sums=('SKIP'
            'b547e2ee7ef330a2123871237603dbb4e66852a00243f1aee0c8d0fcd8bf3595')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_pkgname"
	make build
}

check() {
	make -C "$srcdir/$_pkgname" test
}

package() {
	install -dm755 "$pkgdir/usr/bin/$pkgsrc"
	install -m755 "$srcdir/$_pkgname/prometheus" "$pkgdir/usr/bin/$pkgsrc"

	install -dm755 "$pkgdir/etc"
	install -m644 "$srcdir/$_pkgname/documentation/examples/prometheus.yml" "$pkgdir/etc"
	
	install -dm755 "$pkgdir/usr/lib/systemd/system"
	install -m644 "${srcdir}/prometheus.service" "$pkgdir/usr/lib/systemd/system/prometheus.service"
}
