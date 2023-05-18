# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: M. Jarvis
_base=TreeCorr
pkgname=python-${_base,,}
pkgver=4.3.3
pkgrel=1
pkgdesc="Module for computing 2-point correlation functions"
arch=('x86_64')
url="https://github.com/rmjarvis/${_base}"
license=('BSD')
depends=(python-numpy python-cffi python-yaml python-coord)
makedepends=(python-build python-installer python-setuptools python-wheel python-sphinx)
optdepends=('python-fitsio: reads FITS catalogs or writes to FITS output files'
  'python-pandas: speeds up reading from ASCII catalogs'
  'python-h5py: reads HDF5 catalogs')
checkdepends=(python-pytest) # python-fitsio python-pandas python-hdpy python-scipy
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('9474e1539b13b5e4e588714b5a099542e35895d83d08912c335586120777e2edebbe44e3f56a56e376065bd6c6e4b274c6d6f8a9ef09440d910f28ff31601703')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
  local _pyversion=$(python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
  PYTHONPATH="${PWD}/build/lib.linux-$CARCH-cpython-${_pyversion}" make -C docs man
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 ${_base}_LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 docs/_build/man/${_base}.1 -t "${pkgdir}/usr/share/man/man1/"
}
