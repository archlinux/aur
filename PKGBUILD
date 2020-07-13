# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

pkgname=matrix-registration
pkgver=0.7.0
pkgrel=1

pkgdesc="Webapp for token based matrix registration"
url="https://github.com/ZerataX/matrix-registration"
arch=('any')
license=('MIT')

depends=('python-appdirs' 'python-flask' 'python-flask-sqlalchemy' 'python-flask-cors'
         'python-flask-httpauth' 'python-flask-limiter' 'python-waitress'
         'python-dateutil' 'python-yaml' 'python-requests' 'python-wtforms' 'systemd')
checkdepends=('python-parameterized')

source=("matrix-registration-$pkgver.tar.gz::https://github.com/ZerataX/matrix-registration/archive/v$pkgver.tar.gz"
	"matrix-registration.service")

sha256sums=('19370d7a03338ec13fac426fb30d1b8a99ea2081cbbd986d03529f0f5bcf840a'
            '2b58afe380dc186ec1cb38838f8f6b819a1cdf5b1e674492986c80f39ed22dfd')
install=matrix-registration.install

build() {
	cd $pkgname-$pkgver
	sed -i 's|"config"|"/etc/matrix-registration"|' setup.py
	sed -i -e '/psycopg2-binary/d' setup.py
	python setup.py build
}

check() {
	cd $pkgname-$pkgver
	python -m tests.test_registration -v
}

package() {
	install -Dm644 ${pkgname}.service "$pkgdir"/usr/lib/systemd/system/${pkgname}.service

	cd $pkgname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1 --skip-build

	install -dm755 "$pkgdir"/etc/${pkgname}
}
