# Maintainer: Blair Bonnett <blair dot bonnett @ gmail dot com>
# Contributor: richli <rich at dranek dot com>

pkgname=python-h5netcdf
pkgver=1.1.0
pkgrel=2
pkgdesc="Pythonic interface to netCDF4 via h5py"
arch=('any')
url='https://h5netcdf.org'
license=('BSD')
depends=('python-h5py' 'python-packaging')
optdepends=(
  'python-h5pyd: open remote datasets using the HDF REST interface'
)
makedepends=(
  'python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm'
  'python-wheel'
)
checkdepends=('python-netcdf4' 'python-pytest')

_pypi=h5netcdf
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
  'github-pr-206.patch::https://patch-diff.githubusercontent.com/raw/h5netcdf/h5netcdf/pull/206.patch'
)
sha256sums=(
  '932c3b573bed7370ebfc9e802cd60f1a4da5236efb11b36eeff897324d76bf56'
  '2517d389ea36edc1b7c895a1b7aaa533f74d6be809c289c9531e5def00059ac5'
)

prepare() {
    cd "$_pypi-${pkgver}"
    patch -p1 -i "$srcdir/github-pr-206.patch"
}

build() {
    cd "$_pypi-${pkgver}"
    python -m build --wheel --no-isolation

}

check() {
    cd "$_pypi-${pkgver}"
    PYTHONPATH="./build/lib" pytest -v --disable-warnings
}

package() {
    cd "$_pypi-${pkgver}"
    python -m installer --destdir="$pkgdir" "dist/$_pypi-$pkgver-"*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set et sw=4 ts=4 sts=4:
