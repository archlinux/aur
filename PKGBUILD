# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-conversionutil
pkgver=1.4.6
pkgrel=1
pkgdesc="Collection of conversion utilities"
url='https://pypi.org/project/conversionutil'
arch=('any')
license=('MIT')
depends=('python-timingsutil' 'python-six' 'python-logging-helper' 'python-openpyxl')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/c/conversionutil/conversionutil-$pkgver.tar.gz")
sha256sums=('c5bf212953e9355ef8d5ded745165f2098e6833da79b090d4efc06bfc16fcf1d')

prepare() {
	cd "conversionutil-$pkgver"
	sed -i "/packages=/s/()/(exclude=['*unittests*'])/" setup.py
}

build() {
	cd "conversionutil-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "conversionutil-$pkgver"
	## missing test data, ignore test_json_to_xlsx.py
	python -m unittest conversionutil/unittests/test_convert.py
}

package() {
	cd "conversionutil-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl

	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/conversionutil-$pkgver.dist-info/LICENSE.txt" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
