# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-mutf8
_pkg=mutf8
pkgver=1.0.3
pkgrel=1
pkgdesc="MUTF-8 encoder/decoder"
arch=('x86_64')
url="https://github.com/tktech/mutf8"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('bf7fcf53c8d8e7af7c0b38fcf404ef564715ab3293dcd5dc9017c1f515f6941a')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg-$pkgver"
	local _pyver="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
	PYTHONPATH="$PWD/build/lib.linux-$CARCH-$_pyver" pytest -x
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_pkg-$pkgver.dist-info/LICENCE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
