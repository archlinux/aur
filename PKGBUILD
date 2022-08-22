# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: M. Jarvis

pkgname=python-treecorr
_pkg=TreeCorr
pkgver=4.3.0
pkgrel=1
pkgdesc="Library that efficiently computes 2-point and 3-point correlation functions"
arch=('x86_64')
url="https://github.com/rmjarvis/treecorr"
license=('BSD')
depends=('python-cffi' 'python-coord' 'python-numpy' 'python-yaml')
optdepends=(
	'python-fitsio: reads FITS catalogs or writes to FITS output files'
	'python-pandas: speeds up reading from ASCII catalogs'
	'python-h5py: reads HDF5 catalogs')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-sphinx' 'python-wheel')
# checkdepends=('python-fitsio' 'python-pandas' 'python-hdpy' 'python-scipy')
changelog=CHANGELOG.rst
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7ede747f29079f7bba083511519164446ee8b56313e33a1ed1dde674c10fc56f')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
	local _ver="$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')"
	PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$_ver" make -C docs man
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 TreeCorr_LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 docs/_build/man/TreeCorr.1 -t "$pkgdir/usr/share/man/man1/"
}
