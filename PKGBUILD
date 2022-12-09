# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=py-pde
pkgname=python-${_base}
pkgdesc="Python package for solving partial differential equations"
pkgver=0.27.0
pkgrel=1
arch=(any)
url="https://github.com/zwicker-group/${_base}"
license=(MIT)
depends=(python-matplotlib python-numba python-scipy python-sympy python-tqdm)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
# checkdepends=(python-pytest python-h5py python-pandas napari)
optdepends=('python-h5py: for storing data in the hierarchical file format'
  'python-pandas: for handling tabular data'
  'napari: for displaying images interactively'
  'python-ipywidgets: for interactive widgets'
  'python-numba-mpi: for njittable MPI wrapper'
  'python-mpi4py: for parallel processing using MPI')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('2fd41b44367dfe215cc12d37262f1c6ca42848a4115b31d3087303163167d50c41185632e9125f7b39ee7dbf509d7dc7a2be399206ee9eb22653a1c0a9f57edc')

build() {
  cd ${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
# cd ${_base}-${pkgver}/tests
# python -m venv --system-site-packages test-env
# test-env/bin/python -m installer dist/*.whl
# MPLBACKEND=Agg NUMBA_WARNINGS=1 test-env/bin/python run_tests.py --unit # --use_mpi
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base/-/_}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
