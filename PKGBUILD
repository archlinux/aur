# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Michael Clayfield <me@michaelclayfield.com>

pkgname=alerta
pkgver=8.6.0
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
	'python-flask>=2.0.1'
	'python-flask-cors>=3.0.2'
	'python-flask-compress>=1.4.0'
	'python-mohawk'
	'python-pyaml'
	'python-pyjwt'
	'python-pymongo>=3.6'
	'python-pyparsing'
	'python-pytz'
	'python-requests'
	'python-requests-hawk'
	'python-sentry_sdk>=0.10.2')
optdepends=('python-psycopg2' 'postgresql' 'mongodb')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "alertad.service"
        "alerta.sysusers")
sha256sums=('5f0795cfc81c412b057018a77d7ce3d6e3a19e1e8cd1f7b8b1b6bcb01b43d37e'
            '4449acb346807229e4cbfeed68d9ba6006a165e65dec09487fb6e627088016c2'
            'f0a2f76266ba07275ab2baeab1497dfb2946305e85ae68e3b34dd14e2ac47423')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py install --root "${pkgdir}" --optimize=1 --skip-build
	install -Dm 644 "${srcdir}/alerta.sysusers" "${pkgdir}/usr/lib/sysusers.d/alerta.conf"
	install -Dm 644 "${srcdir}/alertad.service" -t "${pkgdir}/usr/lib/systemd/system/"
}
