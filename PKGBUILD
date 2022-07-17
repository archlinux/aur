# Maintainer: Blair Bonnett <blair dot bonnett @ gmail dot com>
# Contributor: richli <rich at dranek dot com>

pkgname=python-h5netcdf
pkgver=1.0.1
pkgrel=1
pkgdesc="Pythonic interface to netCDF4 via h5py"
arch=('any')
url="https://github.com/shoyer/h5netcdf"
license=('BSD')
depends=('python-h5py' 'python-packaging')
optdepends=(
  'python-h5pyd: open remote datasets using the HDF REST interface'
)
makedepends=(
  'python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm'
  'python-setuptools-scm-git-archive' 'python-wheel'
)
checkdepends=('python-netcdf4' 'python-pytest')

_pypi=h5netcdf
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
  'boolean_indexing.patch::https://github.com/h5netcdf/h5netcdf/commit/68d125aa8141bd09511d3404afaaf8132444c859.patch'
  'tracking_order_test.patch::https://github.com/h5netcdf/h5netcdf/commit/d37661010976fb404212ed9b92d27bbfa3058ea4.patch'
)
sha256sums=(
  '776704facd8b82246d6d4068c505c389b3b70b9bf9920ccfbac7f35cdc634dac'
  '9657fcccfbde5baf11adceeb8f6b8487ee1f5fe6194c004d481c7627c63c9345'
  'ef3046a14a2ea337403d3db22e21dbda5df38381a8716e07f7f90eccebe30689'
)

prepare() {
    cd "$_pypi-${pkgver}"
    patch -p1 -i "$srcdir/boolean_indexing.patch"
    patch -p1 -i "$srcdir/tracking_order_test.patch"
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
