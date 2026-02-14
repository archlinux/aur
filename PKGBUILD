# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-normality
_pkg="${pkgname#python-}"
pkgver=3.0.2
pkgrel=1
pkgdesc='Micro-library for normalizing text strings'
license=('MIT')
arch=('any')
url='https://github.com/pudo/normality'
depends=('python' 'python-banal' 'python-chardet' 'python-charset-normalizer' 'python-pyicu')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('70956ae1472b3762746eb15906a30161e0c564bd0a9f3f6e97f0ec6f34bfea16')

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
