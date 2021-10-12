# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: M. Jarvis

pkgname=python-treecorr
pkgver=4.2.6
pkgrel=1
pkgdesc="Library that efficiently computes 2-point and 3-point correlation functions"
arch=('x86_64')
url="https://github.com/rmjarvis/treecorr"
license=('BSD')
depends=('python-numpy>=1.14' 'python-yaml>=3.13' 'python-cffi>=1.12' 'python-coord>=1.1')
optdepends=(
	'python-fitsio: reads FITS catalogs or writes to FITS output files'
	'python-pandas: speeds up reading from ASCII catalogs'
	'python-h5py: reads HDF5 catalogs')
makedepends=('python-setuptools' 'python-sphinx')
# checkdepends=('python-fitsio>=0.9' 'python-pandas>=0.20' 'python-hdpy' 'python-scipy>=1.2')
changelog=CHANGELOG.rst
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('78cb3a1bf43aef2c73dd89e1d0b03df955fd130943fcb3de0f447446b2142f5a')

build() {
	cd "TreeCorr-$pkgver"
	python setup.py build

	local _ver="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
	cd docs
	PYTHONPATH="../build/lib.linux-$CARCH-$_ver" make man
}

package() {
	cd "TreeCorr-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
	install -Dm 644 TreeCorr_LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm 644 docs/_build/man/TreeCorr.1 -t "$pkgdir/usr/share/man/man1/"
}
