# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-numpoly
pkgver=1.2.3
pkgrel=1
pkgdesc="NumPy compatible polynomial representation"
arch=('any')
url='https://github.com/jonathf/numpoly'
license=('BSD')
depends=('python-numpy')
makedepends=('python-setuptools' 'python-dephell' 'python-sphinx')
checkdepends=('python-pytest' 'python-sympy')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('934bb44efa5e5988debdb4409a6c2556bd67481d04f97364ef5d2b48c289e966')

prepare() {
	cd "numpoly-$pkgver"
	dephell deps convert --from pyproject.toml --to setup.py
}

build() {
	cd "numpoly-$pkgver"
	python setup.py build
	cd docs
	PYTHONPATH=../ make man
}

check() {
	cd "numpoly-$pkgver"
	pytest
}

package() {
	cd "numpoly-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm 644 docs/.build/man/numpoly.1 -t "$pkgdir/usr/share/man/man1/"
}
