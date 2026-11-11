# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-argopy
pkgdesc='Retrieve and analyse data from the Argo network of ocean profilers'
pkgver=1.5.0
pkgrel=1
arch=('any')
url='https://argopy.readthedocs.io/'
license=('EUPL-1.2')

depends=(
  'python-aiohttp'
  'python-decorator'
  'python-erddapy'
  'python-fsspec'
  'python-h5netcdf'
  'python-netcdf4'
  'python-packaging'
  'python-scipy'
  'python-toolz'
  'python-xarray'
  'python-requests'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'python-pytest-localftpserver'
)
optdepends=(
  'jupyterlab: interactive visualization of available data'
  'python-arrow: im-memory big data analytics'
  'python-cartopy: plotting of cartographic data'
  'python-dask: parallel access'
  'python-ipykernel: interactive visualization of available data'
  'python-matplotlib: plotting of profile data'
  'python-seaborn: visualization of statistical data'
  'python-tqdm: progress meters'
)

source=(
  "argopy-$pkgver.tar.gz::https://github.com/euroargodev/argopy/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=(
  '3f7223be90feac83f2880f11746f949880f0663a43ee6d73dc1a320cd2881b7e'
)

build() {
  cd "argopy-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "argopy-$pkgver"
  rm -rf test-env
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/"argopy-$pkgver"*.whl
  cd argopy/tests
  ../../test-env/bin/python -m pytest -c pytest.ini --ignore=test_stores_fsspec.py -k 'not fetchers_data_erddap'
}

package() {
  cd "argopy-$pkgver"
  python -m installer --destdir="$pkgdir" dist/"argopy-$pkgver"*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
