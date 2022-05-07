# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Clint Valentine <valentine.clint@gmail.com>
# Contributor: Dmitriy Morozov <archlinux@foxcub.org>

pkgname=python-fastcluster
_pkg="${pkgname#python-}"
pkgver=1.2.6
pkgrel=2
pkgdesc="Fast hierarchical clustering routines for R and Python"
arch=('x86_64')
url="https://pypi.org/project/fastcluster"
license=('BSD')
depends=('python-numpy')
makedepends=(
	'python-setuptools'
	'python-build'
	'python-installer'
	'python-oldest-supported-numpy'
	'python-wheel')
checkdepends=('python-pytest' 'python-scipy')
changelog=NEWS.txt
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('aab886efa7b6bba7ac124f4498153d053e5a08b822d2254926b7206cdf5a8aa6')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg-$pkgver"
	local _py="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
	PYTHONPATH="$PWD/build/lib.linux-$CARCH-$_py" python setup.py test
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/$_pkg-$pkgver.dist-info/COPYING.txt" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
