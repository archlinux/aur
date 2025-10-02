# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-argopy
pkgdesc='Retrieve and analyse data from the Argo network of ocean profilers'
pkgver=1.3.0
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
  "argopy-pr526.patch::https://patch-diff.githubusercontent.com/raw/euroargodev/argopy/pull/526.patch"
)
sha256sums=(
  '2d065689dd5a241fb95a7113cca0dc40c539f18ea27414e7a69ed4f56b3a240c'
  '26dd405930011648234f8cec98fbde0708e2655c1bda8773d345d994a14e88ff'
)

prepare() {
  cd "argopy-$pkgver"
  patch -p1 -i "$srcdir/argopy-pr526.patch"  # unreleased patch for xarray >= 2025.08
}


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
  ../../test-env/bin/python -m pytest -c pytest.ini
}

package() {
  cd "argopy-$pkgver"
  python -m installer --destdir="$pkgdir" dist/"argopy-$pkgver"*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # Remove the tests from the final package.
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -r "$pkgdir/$site_packages/argopy/tests"
}
