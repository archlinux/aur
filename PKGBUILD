# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-graphyte
_pkg=graphyte
pkgver=1.7.1
pkgrel=1
pkgdesc='Library for sending data to a graphite metrics server'
arch=('any')
url="https://github.com/benhoyt/graphyte"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ce1f0df558298653043a5c3a4d43da4bd980207f36472080ca01cff7945ddc51')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg-$pkgver"
	python -m unittest test_graphyte.py
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/$_pkg-$pkgver.dist-info/LICENSE.txt" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
