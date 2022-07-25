# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-icecream
_pkg="${pkgname#python-}"
pkgver=2.1.3
pkgrel=1
pkgdesc="Sweet and creamy print debugging"
arch=('any')
url="https://github.com/gruns/icecream"
license=('MIT')
depends=('python-colorama' 'python-pygments' 'python-executing' 'python-asttokens')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
provides=('icecream-debugging')
changelog=changelog.txt
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/i/icecream/icecream-$pkgver.tar.gz")
sha256sums=('0aa4a7c3374ec36153a1d08f81e3080e83d8ac1eefd97d2f4fe9544e8f9b49de')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg-$pkgver"
	python setup.py test
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_pkg-$pkgver.dist-info/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
