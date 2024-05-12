# Maintainer: Alberto Oporto <otreblain@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Sam L. Yes <samlukeyes123@gmail.com>

pkgname=python-pyreadstat
_pkg=${pkgname#python-}
pkgver=1.2.7
pkgrel=1
pkgdesc="Reads sas, spss and stata files into Pandas data frames."
license=('Apache' 'MIT')
arch=('x86_64')
url="https://github.com/Roche/pyreadstat"
depends=('python-pandas')
makedepends=('python-setuptools' 'cython' 'python-build' 'python-installer' 'python-wheel')
makedepends=('cython' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
# source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('0118b0f6c945f71eef1dee94ce5865ddd61c7d1bc438f6fbb7c595e09b6167b9')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg-$pkgver"
	local _ver="$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')"
	PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$_ver" python tests/test_basic.py
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
