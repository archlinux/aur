# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-uiutil
_name=uiutil
pkgver=1.38.0
pkgrel=1
pkgdesc="Utility module to assist creating Tk GUIs"
arch=('any')
url='https://pypi.org/project/uiutil'
license=('custom:PSF')
depends=(
	'python-attrs'
	'python-classutils'
	'python-configurationutil'
	'python-conversionutil'
	'python-fdutil'
	'python-future'
	'python-logging-helper'
	'python-pillow'
	'python-stateutil'
	'python-timingsutil')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/u/$_name/$_name-$pkgver.tar.gz")
sha256sums=('4044acd0b1eed09b582fbc86139c0544543fd86e5a1f30bd94ef46a41907d8e1')

prepare() {
	cd "$_name-$pkgver"
	sed -i "/packages=/s/()/(exclude=['*unittests*', 'docs*'])/" setup.py
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
