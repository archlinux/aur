# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-normality
_pkg="${pkgname#python-}"
pkgver=3.1.0
pkgrel=1
pkgdesc='Micro-library for normalizing text strings'
license=('MIT')
arch=('any')
url='https://github.com/pudo/normality'
depends=('python' 'python-banal' 'python-chardet' 'python-charset-normalizer' 'python-pyicu')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('9d2d3705ec5458b36986d5a0ec32b07f4805780c74700c6fd6cb998017d1091f')

latestver() {
	curl -fsSL "https://pypi.org/pypi/${_pkg}/json" | jq -r '.info.version'
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg-$pkgver"
	pytest -x
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
