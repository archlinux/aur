# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=fieldcompare
pkgname=python-${_base}
pkgdesc="Read and compare numerical data against reference data using exact, fuzzy or custom comparison operations"
pkgver=0.2.2
pkgrel=1
arch=(any)
url="https://gitlab.com/dglaeser/${_base}"
license=(GPL-3.0-or-later)
depends=(python-numpy python-colorama)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-meshio python-h5py-openmpi)
optdepends=('python-meshio: for a large number of further mesh file formats support')
source=(${url}/-/archive/${pkgver}/${_base}-${pkgver}.tar.gz)
sha512sums=('eba06a292d45297ab503037ea204b77c4b06deedfd097bf387d86ea4d75577024df6611520de89467854931f5ee74a1cd998ee2a213dcac45e058ec77750a97d')

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
