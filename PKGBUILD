# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: M. Jarvis

pkgname=python-coord
_pkg=Coord
pkgver=1.2.3
pkgrel=1
pkgdesc="Python module for handling angle and celestial coordinates"
arch=('x86_64')
url="https://github.com/LSSTDESC/Coord"
license=('BSD')
depends=('libffi' 'python-cffi' 'python-future' 'python-numpy')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-sphinx' 'python-wheel')
checkdepends=('python-nose' 'python-astropy')
changelog=CHANGELOG.rst
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4fa4cab15dff39a1ca71cfe4af7afc72ef6ab9a74b3071a7d899d3061cb0c585')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
	PYTHONPATH="$PWD" make -C docs man
}

check() {
	cd "$_pkg-$pkgver"
	nosetests
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 docs/_build/man/coord.1 -t "$pkgdir/usr/share/man/man1/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/LSSTDESC.Coord-$pkgver.dist-info/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/"
}
