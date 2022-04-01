# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-timingsutil
pkgver=1.7.0
pkgrel=2
pkgdesc="Collection of timing utilities"
url="https://bitbucket.org/daycoder/timingsutil"
arch=('any')
license=('MIT')
depends=('python-logging-helper')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/t/timingsutil/timingsutil-$pkgver.tar.gz")
sha256sums=('0a24db06da6270d2f883b7a87b5aae92bb655c34849f525ad1ee4a59dcdabd6d')

prepare() {
	cd "timingsutil-$pkgver"
	sed -i "/packages=/c\packages=['timingsutil']," setup.py
}

build() {
	cd "timingsutil-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "timingsutil-$pkgver"
	python -m unittest timingsutil/unittests/*.py
}

package() {
	cd "timingsutil-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"

	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/timingsutil-$pkgver.dist-info/LICENSE.txt" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
