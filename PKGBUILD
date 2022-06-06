# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Sam L. Yes <samlukeyes123@gmail.com>

pkgname=python-pyreadstat
_pkg=${pkgname#python-}
pkgver=1.1.7
pkgrel=1
pkgdesc="Reads sas, spss and stata files into Pandas data frames."
license=('Apache' 'MIT')
arch=('x86_64')
url="https://github.com/Roche/pyreadstat"
depends=('python-pandas')
makedepends=('python-setuptools' 'cython' 'python-build' 'python-installer' 'python-wheel')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9b72cd5ac1d8d48fdf9e7cb428ca4985a46f83773451c6e99b596c5f5ec4e91b')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg-$pkgver"
	local _ver="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
	PYTHONPATH="$PWD/build/lib.linux-$CARCH-$_ver" python tests/test_basic.py
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/$_pkg-$pkgver.dist-info/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/"
}
