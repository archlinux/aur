# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-numpoly
pkgver=1.2.3
pkgrel=2
pkgdesc="NumPy compatible polynomial representation"
arch=('any')
url='https://github.com/jonathf/numpoly'
license=('BSD')
depends=('python-numpy')
makedepends=('python-poetry' 'python-build' 'python-installer' 'python-sphinx')
checkdepends=('python-pytest' 'python-sympy')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('934bb44efa5e5988debdb4409a6c2556bd67481d04f97364ef5d2b48c289e966')

build() {
	cd "numpoly-$pkgver"
	python -m build --wheel --no-isolation
	PYTHONPATH="$PWD" make -C docs man
}

check() {
	cd "numpoly-$pkgver"
	pytest -x --disable-warnings
}

package() {
	export PYTHONHASHSEED=0
	cd "numpoly-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 docs/.build/man/numpoly.1 -t "$pkgdir/usr/share/man/man1/"

	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/numpoly-$pkgver.dist-info/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/"
}
