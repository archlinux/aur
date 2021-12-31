# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=little-brother
pkgver=0.4.12
pkgrel=1
pkgdesc="Parental controls for children"
arch=('any')
url='https://github.com/marcus67/little_brother'
license=('GPL3')
depends=(
	'python-alembic'
	'python-lagom'
	'python-requests'
	'python-psutil'
	'python-dateutil'
	'python-sqlalchemy'
	'python-pymysql'
	'python-flask'
	'python-flask-login'
	'python-flask-babel'
	'python-flask-migrate'
	'python-flask-wtf'
	'python-secure'
	'python-selenium'
	'python-urllib3'
	'python-prometheus_client'
	'python-humanize')
makedepends=('python-setuptools')
changelog=CHANGES.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "$pkgname.sysusers")
sha256sums=('2fe8d3fe846193d2917c52d85e8f3c3a782357654d796fcb9957be4328fda0ee'
            '2d4477508d5562bf47cf382f1530175808a3034329daa11a62a5276a709d9b35')

prepare() {
	cd "little_brother-$pkgver"
	sed -i "s/==/>=/g" requirements.txt
	sed -i 's|/local||g' "etc/$pkgname.service"
	sed -i '/little_brother.test*/d' setup.py
}

build() {
	cd "little_brother-$pkgver"
	python setup.py build
}

package() {
	export PYTHONHASHSEED=0
	cd "little_brother-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 "etc/$pkgname.service" -t "$pkgdir/usr/lib/systemd/system/"
	install -Dm644 "etc/$pkgname.sudo" "$pkgdir/etc/sudoers.d/$pkgname"
	install -Dm644 "etc/$pkgname.tmpfile" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
	install -Dm644 etc/*.config -t "$pkgdir/etc/$pkgname/"
	install -Dm644 "$srcdir/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}
