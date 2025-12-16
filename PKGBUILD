# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=py-pde
pkgname=python-${_base}
pkgdesc="Python package for solving partial differential equations"
pkgver=0.50.0
pkgrel=1
arch=(any)
url="https://github.com/zwicker-group/${_base}"
license=(MIT)
depends=(python-matplotlib python-numba python-scipy python-sympy python-tqdm)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
checkdepends=(python-pytest-cov python-h5py-openmpi python-pandas
  jupyter-notebook) # python-numba-mpi python-ffmpeg-python
optdepends=('python-h5py: storing data in the hierarchical file format'
  'python-ipywidgets: jupyter notebook support'
  'python-mpi4py: parallel processing using MPI'
  'napari: displaying images interactively'
  'python-numba-mpi: parallel processing using MPI+numba'
  'python-pandas: handling tabular data'
  'python-pyfftw: Faster Fourier transforms'
  'python-rocket-fft: Numba-compiled fast Fourier transforms'
  'python-ffmpeg-python: creating movies from matplotlib figures')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('6d73eec4181e978423cac84a7b311c237dd6420c2586ddacf8cc0fcb7bb5fe0dcd15cd479921c2d46c054ac23b7f1eda0ebe0dfff5c40abf52ef21829e159f11')

build() {
  cd ${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}/scripts
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer ../dist/*.whl
  MPLBACKEND=Agg NUMBA_WARNINGS=1 test-env/bin/python run_tests.py --unit #--use_mpi
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
