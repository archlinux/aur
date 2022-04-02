# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-cachingutil
_name=cachingutil
pkgver=1.2.7
pkgrel=1
pkgdesc="Collection of caching utilities"
url="https://bitbucket.org/daycoder/cachingutil"
arch=('any')
license=('MIT')
depends=('python-fdutil' 'python-requests' 'python-timingsutil')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/c/$_name/$_name-$pkgver.tar.gz")
sha256sums=('1f576f5b6972e2b40329f5f1a3ea15335ab695822b63f7a518d5ccbe7ee74029')

prepare() {
	cd "$_name-$pkgver"
	sed -i "/packages=/s/()/(exclude=['*unittests*'])/" setup.py
}

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_name-$pkgver"
	python -m unittest discover
}

package() {
	cd "$_name-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"

	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/$_name-$pkgver.dist-info/LICENSE.txt" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
