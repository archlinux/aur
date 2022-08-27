# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-wradlib
_pkg=wradlib
pkgver=1.16.2
pkgrel=1
pkgdesc='Weather radar data processing'
arch=('any')
url="https://github.com/wradlib/wradlib"
license=('MIT')
depends=(
	'python-deprecation'
	'python-matplotlib'
	'python-numpy'
	'python-packaging'
	'python-scipy'
	'python-xarray')
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-setuptools-scm'
	'python-setuptools-scm-git-archive'
	'python-wheel')
checkdepends=('python-pytest' 'jupyter-nbformat' 'jupyter-nbconvert')
optdepends=()
changelog=
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz"
        'exclude-tests.patch')
sha256sums=('1200a7e72b5ed3055b40c1433cd69c7adaa833f79e8b654dfd518b4f15a4d152'
            '933847e41868e0e5643e1f903aef91a1965a55da11a16c6723440cf5a731e41f')

prepare() {
	patch -p1 -d "$_pkg-$pkgver" < exclude-tests.patch
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_pkg-$pkgver.dist-info/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
