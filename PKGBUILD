# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=little-brother
pkgver=0.4.19
pkgrel=4
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
	'python-humanize'
	'python-base-app'
	'python-some-flask-helpers'
	'python-ldap'
	'python-distro')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
backup=("etc/$pkgname/$pkgname.conf")
changelog=CHANGES.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "$pkgname.sysusers"
        "$pkgname.tmpfiles")
sha256sums=('dbfe9fefe4a9fb9c179042672239f214d1235b4bf2f318fcb66954e493d5713e'
            '2d4477508d5562bf47cf382f1530175808a3034329daa11a62a5276a709d9b35'
            'c427a5bbea15bb42d0738ee17437d5f01e0ba9e120bed812a95c29edb4827af7')

prepare() {
	cd "little_brother-$pkgver"
	sed -i 's|/local||g' "etc/$pkgname.service"
	sed -i '/little_brother.test*/d' setup.py
}

build() {
	cd "little_brother-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	export PYTHONHASHSEED=0
	cd "little_brother-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 "etc/$pkgname.service" -t "$pkgdir/usr/lib/systemd/system/"
	install -Dm644 "etc/$pkgname.sudo" "$pkgdir/etc/sudoers.d/$pkgname"
	install -Dm644 etc/master.config "$pkgdir/etc/$pkgname/$pkgname.config"
	install -Dm644 etc/*.config -t "$pkgdir/usr/share/$pkgname/"
	install -Dm644 "$srcdir/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	install -Dm644 "$srcdir/$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
