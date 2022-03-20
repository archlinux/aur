# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-technical
pkgver=1.3.0
pkgrel=2
epoch=1
pkgdesc='Various indicators developed or collected for the freqtrade'
url='https://github.com/freqtrade/technical'
arch=('any')
license=('GPL3')
depends=('python-arrow' 'python-pandas' 'python-ta-lib')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-mock')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        'remove-tests.patch')
sha256sums=('8604750f1aced810c320a0a844f91511ae807bce8701d1599afedebef38b4aaa'
            'f819291c544fe57d547c6e5e37fde4304bf72c89843bbd419e18c0dd3640ef03')

prepare() {
	patch -p1 -d "technical-$pkgver" < remove-tests.patch
}

build() {
	cd "technical-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "technical-$pkgver"
	pytest -x --disable-warnings
}

package() {
	export PYTHONHASHSEED=0
	cd "technical-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
