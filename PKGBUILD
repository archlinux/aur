# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-eigency
_pkg="${pkgname#python-}"
pkgver=2.0.0
pkgrel=1
pkgdesc='Cython interface to Eigen library'
arch=('x86_64')
url="https://github.com/wouterboomsma/eigency"
license=('MIT')
depends=('eigen' 'python-numpy' 'python-setuptools')
makedepends=(
	'cython'
	'python-build'
	'python-installer'
	'python-oldest-supported-numpy'
	'python-setuptools-scm'
	'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz"
        'use-system-eigen.diff::https://patch-diff.githubusercontent.com/raw/wouterboomsma/eigency/pull/59.diff')
sha256sums=('a2b5e20631f7775490e8f1d648abbcd4686596b07344af0a3f62d42ec1309286'
            '8f8a7654d762b56a6fd4720c33c6a8d8a7e48778f1bff1e28ced61f734ab962f')

prepare() {
	cd "$_pkg-$pkgver"
	rm -rf "$_pkg/eigen"
	patch -p1 < "$srcdir/use-system-eigen.diff"
}

build() {
	cd "$_pkg-$pkgver"
	EIGEN_INC=/usr/include/eigen3/ python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$_pkg-$pkgver.dist-info/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
