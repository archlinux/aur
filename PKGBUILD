# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Daniel Bermond <dbermond@archlinux.org>

pkgname=python-bencoder-pyx
_name=bencoder.pyx
pkgver=3.0.0
pkgrel=1
pkgdesc='Fast bencode implementation in Cython'
arch=('x86_64')
url='https://github.com/whtsky/bencoder.pyx/'
license=('BSD')
depends=('python')
makedepends=(
	'cython'
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-wheel')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('14c40ae805bba06ebe6ffe5f3b030d9b923477af001eea3b9cbc18bec368e040')

prepare() {
	cd "$_name-$pkgver"
	sed -i '/extra_compile_args/s/O3/O2/' setup.py
	sed -i '/requires/s/==/>=/' pyproject.toml
}

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_name-$pkgver"
	local _pyver
	_pyver="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
	PYTHONPATH="$(pwd)/build/lib.linux-${CARCH}-${_pyver}" pytest -x
}

package() {
	cd "$_name-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl

	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/$_name-$pkgver.dist-info/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/"
}
