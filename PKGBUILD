# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=py-pde
pkgname=python-${_base}
pkgdesc="Python package for solving partial differential equations"
pkgver=0.58.0
pkgrel=1
arch=(any)
url="https://github.com/zwicker-group/${_base}"
license=(MIT)
depends=(python-matplotlib python-numba python-scipy python-sympy python-tqdm python-typing_extensions)
makedepends=(python-build python-installer python-setuptools-scm)
checkdepends=(python-pytest-cov python-h5py-openmpi python-pandas jupyter-notebook python-numba-mpi)
optdepends=('python-h5py: storing data in the hierarchical file format'
  'python-pandas: handling tabular data'
  'napari: displaying images interactively'
  'python-ffmpeg-python: creating movies from matplotlib figures'
  'python-ipywidgets: jupyter notebook support'
  'python-mpi4py: parallel processing using MPI'
  'python-numba-mpi: parallel processing using MPI+numba'
  'python-pyfftw: Faster Fourier transforms'
  'python-rocket-fft: Numba-compiled fast Fourier transforms'
  'python-py-modelrunner: running simulations and handling I/O'
  'python-jax: using jax as a backend'
  'python-pytorch: Using torch as a backend')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('7c8069867c5ad69163df2e3d46a299b1bc9b1ab2963f74ac6529f21487bb004596e39f670738bc5a4cf987c2ac14af660dcc42990c161c35bc635fd2359634b6')

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
