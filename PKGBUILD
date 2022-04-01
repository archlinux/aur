# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-classutils
_name=classutils
pkgver=1.18.1
pkgrel=1
pkgdesc="Collection of utilites to enhance Python classes"
arch=('any')
url="https://bitbucket.org/daycoder/classutils"
license=('custom:PSF')
depends=(
	'python-future'
	'python-fdutil'
	'python-logging-helper'
	'python-timingsutil'
	'python-requests'
	'python-tableutil')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/c/$_name/$_name-$pkgver.tar.gz")
sha256sums=('b680a7cf71446a93347357e7156c055994799262a5b8508c25f8895f2b95c1fa')

prepare() {
	cd "$_name-$pkgver"
	sed -i "/packages=/s/()/(exclude=['*unittests*'])/" setup.py
}

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl

	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/$_name-$pkgver.dist-info/LICENSE.txt" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
