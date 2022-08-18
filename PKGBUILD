# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=python-twiggy
_pkg="${pkgname#python-}"
pkgver=0.5.1
pkgrel=2
pkgdesc="Pythonic logger"
arch=('any')
url="https://github.com/wearpants/twiggy"
license=('BSD')
depends=('python-six')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('b5acfc81647475f9f734d59d15e5eb6490d8bafd4e1886e01058c24c29e64a5f')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg-$pkgver"
	pytest || true
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/${_pkg^}-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
