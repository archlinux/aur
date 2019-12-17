# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

pkgname=matrix-registration
pkgver=0.5.5
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
	"https://github.com/Bubu/matrix-registration/commit/0b1f172d5d5409ae83d23052b3e261562cfa2dc3.patch"
	"https://github.com/Bubu/matrix-registration/commit/822c426d1a2015a9d383a41ef245c590abd130de.patch"
	"matrix-registration.service")

sha256sums=('77167413fdf46a2e5b6b38d6822208ee0550abd55091c2c27449555333afb9eb'
            '13ae49f07d00ce8567422634ccc15fd4d2331ee3bb127a980b99dde0ccc64c12'
            '315582a06dbe20778def87ca95f85fd15d16a582136c0a60ee5fbaed157b9b44'
            'e6855f64adaeff6be8cdf1106f62d1fe0f66e5015ff856e6db41e05f25bcd29a')
install=matrix-registration.install

prepare() {
        cd $pkgname-$pkgver
	patch -p1 -i ../0b1f172d5d5409ae83d23052b3e261562cfa2dc3.patch
	patch -p1 -i ../822c426d1a2015a9d383a41ef245c590abd130de.patch
}

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
