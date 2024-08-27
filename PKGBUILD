# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-argopy
pkgdesc='Retrieve and analyse data from the Argo network of ocean profilers'
pkgver=0.1.16
pkgrel=1
arch=('any')
url='https://argopy.readthedocs.io/'
license=('EUPL-1.2')

depends=(
  'python-aiohttp'
  'python-decorator'
  'python-erddapy'
  'python-fsspec'
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

_pypi=argopy
source=(
  "argopy-$pkgver.tar.gz::https://github.com/euroargodev/argopy/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=(
  '6cca63136113ea6a02d4c1f0ceca4b8669a2baaca1b7bd84881c3920e313ce92'
)

build() {
  cd "$_pypi-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pypi-$pkgver"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/"argopy-$pkgver"*.whl
  cd argopy/tests

  # Skip various tests which don't work with the system version of xarray
  # (whic has incomplete NumPy 2.0 support). If you have problems in use, I
  # would suggest using a virtual environment with xarray < 2024.3 (to avoid
  # another bug, see https://github.com/euroargodev/argopy/issues/373) and
  # numpy < 2.0.0.
  local skip_tests=(
    'test_to_xarray'
    'test_to_dataframe'
    'test_load'
    'test_domain'
    'test_fetching'
    'Test_ArgoNVSReferenceTables'
    'test_open_dataset'
    'test_open_mfdataset'
    'test_open_json'
    'test_open_mfjson'
    'test_read_csv'
    'test_cache_a_file'
    'test_clear_cache'
    'test_lscache'
  )
  local skipstr=""
  for testname in "${skip_tests[@]}"; do
    skipstr="$skipstr and not $testname"
  done
  skipstr="${skipstr:5}"  # Trim the leading ' and '.

  # We also skip some files where all tests fail, see above comment.
  ../../test-env/bin/python -m pytest -c pytest.ini \
    --ignore=test_fetchers_data_erddap.py \
    --ignore=test_fetchers_data_erddap_bgc.py \
    --ignore=test_fetchers_data_gdac.py \
    --ignore=test_xarray_engine.py \
    -k "$skipstr"
}

package() {
  cd "$_pypi-$pkgver"
  python -m installer --destdir="$pkgdir" dist/"argopy-$pkgver"*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # Remove the tests from the final package.
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -r "$pkgdir/$site_packages/argopy/tests"
}
