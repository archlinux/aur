# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=fieldcompare
pkgname=python-${_base}
pkgdesc="Read and compare numerical data against reference data using exact, fuzzy or custom comparison operations"
pkgver=0.2.0
pkgrel=1
arch=(any)
url="https://gitlab.com/dglaeser/${_base}"
license=(GPL3)
depends=(python-numpy python-colorama)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-meshio python-h5py-openmpi)
optdepends=('python-meshio: for a large number of further mesh file formats support')
source=(${url}/-/archive/${pkgver}/${_base}-${pkgver}.tar.gz)
sha512sums=('52940f66d450a4d6e659e85543be009814b1411f14ec9d5404341f88aee2e78bc71dfbb932cda00b47e588808e34e3f31a22377614b1f4f45358e96c2f6644b5')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest \
    -k 'not cli_directory_mode_missing_result_file and not cli_directory_mode_missing_reference_file and not api_examples'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSES/GPL-3.0-or-later.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
