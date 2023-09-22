# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=py-pde
pkgname=python-${_base}
pkgdesc="Python package for solving partial differential equations"
pkgver=0.33.0
pkgrel=1
arch=(any)
url="https://github.com/zwicker-group/${_base}"
license=(MIT)
depends=(python-matplotlib python-numba python-scipy python-sympy python-tqdm)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
checkdepends=(python-pytest-cov python-h5py-openmpi python-pandas jupyter-notebook python-numba-mpi) # napari
optdepends=('python-h5py: for storing data in the hierarchical file format'
  'python-pandas: for handling tabular data'
  'napari: for displaying images interactively'
  'python-ipywidgets: for interactive widgets'
  'python-numba-mpi: for njittable MPI wrapper'
  'python-mpi4py: for parallel processing using MPI')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('119dc2e1694d895544612165ff49d94b3ec8cb2dceed89bd84b65b689cad88083220d1f3011486e0af7a4892673fa7738c0fafdf4b2a0fa973941376b52b912b')

build() {
  cd ${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}/scripts
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer ../dist/*.whl
  MPLBACKEND=Agg NUMBA_WARNINGS=1 test-env/bin/python run_tests.py --unit --use_mpi
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base/-/_}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
