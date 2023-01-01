# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-technical
_pkg="${pkgname#python-}"
pkgver=1.3.0
pkgrel=3
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
            '6ab0c2b27b1d9a8c3006c364c4ec26352d1efec2c432ec776008b4f88723883a')

prepare() {
	patch -p1 -d "$_pkg-$pkgver" < remove-tests.patch
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg-$pkgver"
	pytest -x --disable-warnings
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
