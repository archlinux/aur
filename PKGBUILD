# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-logging-helper
pkgver=1.9.0
pkgrel=3
pkgdesc="Provides enhancements to built-in logging module"
url="https://pypi.python.org/pypi/logging-helper"
arch=('any')
license=('MIT')
depends=('python-better-exceptions' 'python-logging_tree' 'python-future')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-testfixtures')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/l/logging_helper/logging_helper-$pkgver.tar.gz")
sha256sums=('03aaff3c4e6967f7a18d576acba1adf22c47d30df4d4bf9164514d046c818645')

prepare() {
	cd "logging_helper-$pkgver"
	sed -i '/packages=/s/()/(exclude=["*unittests*"])/' setup.py
}

build() {
	cd "logging_helper-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "logging_helper-$pkgver"
	python -m unittest logging_helper/unittests/test_logging_helper.py
}

package() {
	cd "logging_helper-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl

	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/logging_helper-$pkgver.dist-info/LICENSE.txt" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
