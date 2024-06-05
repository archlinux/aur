# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Michael Clayfield <me@michaelclayfield.com>

pkgname=alerta
pkgver=9.0.3
pkgrel=1
pkgdesc="tool used to consolidate and de-duplicate alerts from multiple sources"
arch=('any')
url="https://github.com/alerta/alerta"
license=('Apache-2.0')
depends=(
	'python>=3.7'
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
	'python-pyparsing'
	'python-pytz'
	'python-requests'
	'python-requests-hawk'
	'python-sentry_sdk')
optdepends=('python-psycopg2' 'postgresql' 'python-pymongo' 'mongodb')
makedepends=(python-build python-installer python-wheel python-setuptools)
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	"alertad.service"
	"alerta.sysusers")
sha256sums=('cb61af5bdc6f3023d890a0cfdfe56e667cd0a53588a5d84f098f03d381bdcdb3'
            '4449acb346807229e4cbfeed68d9ba6006a165e65dec09487fb6e627088016c2'
            'f0a2f76266ba07275ab2baeab1497dfb2946305e85ae68e3b34dd14e2ac47423')

build() {
	cd $pkgname-$pkgver
	python -m build --wheel --no-isolation
}

## tests require a server

package() {
	export PYTHONHASHSEED=0
	cd "alerta-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 "$srcdir/alerta.sysusers" "$pkgdir/usr/lib/sysusers.d/alerta.conf"
	install -Dm644 "$srcdir/alertad.service" -t "$pkgdir/usr/lib/systemd/system/"
}
