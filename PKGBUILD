# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

pkgname=matrix-registration
pkgver=0.5.6
pkgrel=1

pkgdesc="Webapp for token based matrix registration"
url="https://github.com/ZerataX/matrix-registration"
arch=('any')
license=('MIT')

depends=('python-appdirs' 'python-flask' 'python-flask-cors'
         'python-flask-httpauth' 'python-flask-limiter'
         'python-dateutil' 'python-yaml' 'python-requests' 'python-wtforms' 'systemd')
checkdepends=('flake8' 'python-parameterized')

source=("matrix-registration-$pkgver.tar.gz::https://github.com/ZerataX/matrix-registration/archive/v$pkgver.tar.gz"
	"matrix-registration.service")

sha256sums=('770a5033d119f87ad61601a3df3d1abc046f2a9b5dada9ced785df99f7f660d1'
            'e6855f64adaeff6be8cdf1106f62d1fe0f66e5015ff856e6db41e05f25bcd29a')
install=matrix-registration.install

build() {
	cd $pkgname-$pkgver
	sed -i 's|"config"|"/etc/matrix-registration"|' setup.py
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

	_requires="$pkgdir"/usr/lib/python3.8/site-packages/matrix_registration-${pkgver}-py3.8.egg-info/requires.txt
	sed -i 's/flask-limiter==.*/flask-limiter/' ${_requires}
	sed -i 's/flask-cors==.*/flask-cors/' ${_requires}
	sed -i 's/flask-httpauth==.*/flask-httpauth/' ${_requires}
	install -dm755 "$pkgdir"/etc/${pkgname}
}
