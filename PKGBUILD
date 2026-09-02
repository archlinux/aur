# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: M. Jarvis
_base=TreeCorr
pkgname=python-${_base,,}
pkgver=5.1.4
pkgrel=1
pkgdesc="Module for computing 2-point correlation functions"
arch=(x86_64)
url="https://github.com/rmjarvis/${_base}"
license=(BSD-2-Clause-FreeBSD)
depends=(python-numpy python-yaml python-coord)
makedepends=(python-build python-installer python-setuptools python-wheel pybind11)
optdepends=('python-fitsio: reads FITS catalogs or writes to FITS output files'
  'python-pandas: speeds up reading from ASCII catalogs'
  'python-h5py: reads HDF5 catalogs')
# checkdepends=(python-pytest python-pandas python-fitsio python-mockmpi) # python-scipy python-hdpy
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('9d8698f8e7ee246491bc844f6c45457fca7b91eeb78ca3e565fec1659968316d39bd8731529e5362535273559eb6b46aa19e3cd8b8614de3ff88683f7894ebcc')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   local _pyversion=$(python -c "import sys; print(f'{sys.version_info.major}{sys.version_info.minor}')")
#   mv build/lib.linux-$CARCH-cpython-${_pyversion}/${_base,,}/_${_base,,}.cpython-${_pyversion}-$CARCH-linux-gnu.so ${_base,,}/_${_base,,}.so
#   test-env/bin/python -m pytest tests
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 ${_base}_LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
