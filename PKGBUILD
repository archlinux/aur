# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-configurationutil
_name=configurationutil
pkgver=3.7.6
pkgrel=1
pkgdesc="Collection of state machine utilities"
arch=('any')
url='https://pypi.org/project/configurationutil'
license=('custom:PSF')
depends=('python-jsonschema')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
# checkdepends=('python-logging-helper' 'python-classutils' 'python-timingsutil')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/c/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a413f35ea4a6d0530b778d101f00065eab16a68216ecb930699a950ded8a8ea0')

prepare() {
	cd "$_name-$pkgver"
	sed -i "/packages=/s/()/(exclude=['*unittests*'])/" setup.py
}

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

## FIXME: tests missing test data
# check() {
# 	cd "$_name-$pkgver"
# 	python -m unittest discover
# }

package() {
	cd "$_name-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl

	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/$_name-$pkgver.dist-info/LICENSE.txt" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
