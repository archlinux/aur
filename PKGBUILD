# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Ronan Pigott <rpigott@berkeley.edu>

pkgname=python-pypresence
_pkg="${pkgname#python-}"
pkgver=4.2.1
pkgrel=2
pkgdesc='Discord RPC and Rich Presence wrapper library'
url='https://github.com/qwertyquerty/pypresence'
arch=('any')
license=('BSD')
depends=('python>=3.8')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-sphinx' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('c18fb3bbe945274ecea57da52e80ea6d3f0349596b18f0815d193b9b878d7dda')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
	PYTHONPATH="$PWD"
	cd docs/sphinx
	sphinx-build -b man ./ "$srcdir/man/"
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 "$srcdir/man/${_pkg}.1" -t "$pkgdir/usr/share/man/man1/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
