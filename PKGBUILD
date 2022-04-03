# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-ducc
_name=ducc0
pkgver=0.22.0
pkgrel=1
pkgdesc="Distinctly Useful Code Collection"
arch=('x86_64')
url='https://gitlab.mpcdf.mpg.de/mtr/ducc'
license=('GPL2' 'BSD')
depends=('python>=3.7' 'python-numpy')
makedepends=(
	'pybind11'
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-wheel')
# checkdepends=('python-pytest')
changelog=CHANGELOG
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/d/$_name/$_name-$pkgver.tar.gz")
sha256sums=('cd61f00f178d59271c048154849784f5f6d2a05e29bd0d8f1b1740ad7cf3c247')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

## FIXME: tests fail because of nonexistent module ducc0.misc
# check() {
# 	cd "$_name-$pkgver"
# 	PYTHONPATH="$PWD/src" pytest -x --disable-warnings
# }

package() {
	cd "$_name-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl

	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/$_name-$pkgver.dist-info/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/"
}
