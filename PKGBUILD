# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Aaron DeVore <aaron.devore@gmail.com>

pkgname=python-ftputil
_pkg=ftputil
pkgver=5.0.3
pkgrel=2
pkgdesc="High-level FTP client library"
arch=('any')
url="https://ftputil.sschwarzer.net/"
license=('BSD')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
# checkdepends=('python-pytest' 'python-freezegun')
changelog=announcements.txt
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/f/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('9b86ee67c1980ce1d89b13752bc48b9493fee06349cb476828594e76e08f8488')

prepare() {
	## setup.py installs docs to an incorrect directory; exclude them
	sed -i '/data_files/d' "$_pkg-$pkgver/setup.py"
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

## tests don't run
# check() {
# 	cd "$_pkg-$pkgver"
# 	pytest -m 'not slow_test' test --disable-warnings
# }

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/$_pkg-$pkgver.dist-info/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/"
}
