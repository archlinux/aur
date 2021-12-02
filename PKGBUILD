# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Michael Clayfield <me@michaelclayfield.com>

pkgname=alerta
pkgver=8.6.4
pkgrel=1
pkgdesc="A tool used to consolidate and de-duplicate alerts from multiple sources"
arch=('any')
url="https://github.com/alerta/alerta"
license=('APACHE')
depends=(
	'python>=3.6'
	'python-blinker'
	'python-bcrypt'
	'python-cryptography'
	'python-dateutil'
	'python-flask'
	'python-flask-cors'
	'python-flask-compress'
	'python-mohawk'
	'python-pyaml'
	'python-pyjwt'
	'python-pymongo'
	'python-pyparsing'
	'python-pytz'
	'python-requests'
	'python-requests-hawk'
	'python-sentry_sdk')
optdepends=('python-psycopg2' 'postgresql' 'mongodb')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "alertad.service"
        "alerta.sysusers")
sha256sums=('94c9af6ccead37f19e85756ea1b3255dd9f6b95a6d6087e1ffb61ff0fa8545e9'
            '4449acb346807229e4cbfeed68d9ba6006a165e65dec09487fb6e627088016c2'
            'f0a2f76266ba07275ab2baeab1497dfb2946305e85ae68e3b34dd14e2ac47423')

build() {
	cd "alerta-$pkgver"
	python setup.py build
}

## tests require a server

package() {
	cd "alerta-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 "$srcdir/alerta.sysusers" "$pkgdir/usr/lib/sysusers.d/alerta.conf"
	install -Dm644 "$srcdir/alertad.service" -t "$pkgdir/usr/lib/systemd/system/"
}
