# Maintainer: Martin Rys <rys.pw/contact>

pkgname=bookstack
_camelname=BookStack
pkgver=23.12.2
pkgrel=1
pkgdesc='A simple, self-hosted, easy-to-use platform for organising and storing information'
arch=('any')
url="https://github.com/BookStackApp/BookStack"
license=('MIT')
# https://www.bookstackapp.com/docs/admin/installation/
depends=(
	'php'
	'php-gd'
)
optdepends=(
	'php-apache: webserver and a PHP implementation'
	'php-fpm: fastCGI'
	'mariadb: database'
	'nginx: webserver'
)
makedepends=('composer')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/BookStackApp/BookStack/archive/v${pkgver}.tar.gz"
	'bookstack.conf'
)
sha256sums=('765450659028641019d2ef8519848da2cddbb834edc08488c92fba3988f8b6c0'
            '82152fc91366d1bd623c559c03240f070e08d45a084a4c6e2e211f671bee8c78')
options=('!strip')
backup=("etc/webapps/$pkgname/config.env")

package() {
	cd "$srcdir/$_camelname-$pkgver"
	COMPOSER_ALLOW_SUPERUSER=1 composer install --no-dev --ignore-platform-reqs --no-interaction

	install -d "$pkgdir/usr/share/webapps/$pkgname" "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/etc/webapps/$pkgname"
	cp -r * "$pkgdir/usr/share/webapps/$pkgname"
	install -D "$srcdir/$_camelname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"

	cp .env.example "$pkgdir/etc/webapps/$pkgname/config.env"

	ln -s "/etc/webapps/$pkgname/config.env" "$pkgdir/usr/share/webapps/$pkgname/.env"
	rm -rf "$pkgdir/usr/share/webapps/$pkgname/bootstrap/cache"

	mkdir -p "$pkgdir/var/cache/$pkgname"
	ln -s "/var/cache/$pkgname" "$pkgdir/usr/share/webapps/$pkgname/bootstrap/cache"

	mkdir -p "$pkgdir/var/lib"
	mv "$pkgdir/usr/share/webapps/$pkgname/storage" "$pkgdir/var/lib/$pkgname"
	ln -s "/var/lib/$pkgname" "$pkgdir/usr/share/webapps/$pkgname/storage"

	install -Dm644 "${srcdir}/bookstack.conf" "${pkgdir}/usr/lib/tmpfiles.d/bookstack.conf"
}
