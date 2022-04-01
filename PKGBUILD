# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-tableutil
_name=tableutil
pkgver=2.4.5
pkgrel=1
pkgdesc="Collection of table creation utilities"
arch=('any')
url="https://bitbucket.org/daycoder/tableutil"
license=('MIT')
depends=(
	'python-future'
	'python-logging-helper'
	'python-conversionutil'
	'python-fdutil'
	'python-attrs'
	'python-dominate')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/t/$_name/$_name-$pkgver.tar.gz")
sha256sums=('81296bb8e59924414f40ba2e376f3b8fd7248a7bb92607303a6d49ab0cfbad45')

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
