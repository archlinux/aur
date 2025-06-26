# Maintainer: Blair Bonnett <blair dot bonnett @ gmail dot com>
# Contributor: richli <rich at dranek dot com>

pkgname=python-h5netcdf
pkgver=1.6.2
pkgrel=1
pkgdesc="Pythonic interface to netCDF4 via h5py"
arch=('any')
url='https://h5netcdf.org'
license=('BSD-3-Clause')

depends=(
  'python-h5py'
  'python-packaging'
)
optdepends=(
  'python-h5pyd: open remote datasets using the HDF REST interface'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
)
checkdepends=(
  'python-netcdf4'
  'python-pytest'
)

_pypi=h5netcdf
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
  '1592aa093ce1f8d0448bbb97d287b1e9995da0fd428e029c85e09e8af377aeb5'
)

build() {
  cd "$_pypi-${pkgver}"
  python -m build --wheel --no-isolation

}

check() {
  cd "$_pypi-${pkgver}"
  rm -rf test-env
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer "dist/$_pypi-$pkgver-"*.whl
  test-env/bin/python -m pytest -v --disable-warnings
}

package() {
  cd "$_pypi-${pkgver}"
  python -m installer --destdir="$pkgdir" "dist/$_pypi-$pkgver-"*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set et sw=4 ts=4 sts=4:
