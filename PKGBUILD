# Maintainer: Gerasimos Chourdakis <chourdak at in dot tum dot de>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=micro-manager
pkgname=python-${_base}-precice
pkgdesc="A tool which facilitates two-scale macro-micro coupled simulations using preCICE"
pkgver=0.5.0
pkgrel=1
arch=(any)
url="https://precice.org/tooling-${_base}-overview.html"
license=(LGPL-3.0-or-later)
depends=(python-pyprecice)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-scikit-learn python-h5py-openmpi pybind11)
optdepends=('python-scikit-learn: for crash handling by interpolation'
  'python-h5py: for snapshot computations')
source=(${_base}-${pkgver}.tar.gz::https://github.com/precice/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('ae78aee94ba673750685f0bcfb7c71637f1fb3413d4c3f29bb9735f04b79dab054052bd3d8423ebb9d38e3c2783a22137951e6f816a3e9e3487b73fdce73ae3d')

prepare() {
  sed -i 's/GPL/LGPL/' ${_base}-${pkgver}/pyproject.toml
  sed -i 's/GNU/GNU Lesser/' ${_base}-${pkgver}/pyproject.toml
}

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl

  cd ${srcdir}/${_base}-${pkgver}/tests/integration/test_unit_cube
  ${srcdir}/${_base}-${pkgver}/test-env/bin/micro-manager-precice micro-manager-config-local-adaptivity.json &
  ${srcdir}/${_base}-${pkgver}/test-env/bin/python unit_cube.py

  ${srcdir}/${_base}-${pkgver}/test-env/bin/micro-manager-precice micro-manager-config-global-adaptivity.json &
  ${srcdir}/${_base}-${pkgver}/test-env/bin/python unit_cube.py

  cd ${srcdir}/${_base}-${pkgver}/tests/unit
  ${srcdir}/${_base}-${pkgver}/test-env/bin/python -m unittest test_micro_manager.py
  ${srcdir}/${_base}-${pkgver}/test-env/bin/python -m unittest test_interpolation.py
  ${srcdir}/${_base}-${pkgver}/test-env/bin/python -m unittest test_micro_simulation_crash_handling.py
  ${srcdir}/${_base}-${pkgver}/test-env/bin/python -m unittest test_hdf5_functionality.py
  ${srcdir}/${_base}-${pkgver}/test-env/bin/python -m unittest test_snapshot_computation.py

  ${srcdir}/${_base}-${pkgver}/test-env/bin/python -m unittest test_domain_decomposition.py
  ${srcdir}/${_base}-${pkgver}/test-env/bin/python -m unittest test_adaptivity_serial.py

  cd ${srcdir}/${_base}-${pkgver}/examples
  ${srcdir}/${_base}-${pkgver}/test-env/bin/micro-manager-precice micro-manager-python-config.json &
  ${srcdir}/${_base}-${pkgver}/test-env/bin/python macro_dummy.py

  ${srcdir}/${_base}-${pkgver}/test-env/bin/micro-manager-precice micro-manager-python-adaptivity-config.json &
  ${srcdir}/${_base}-${pkgver}/test-env/bin/python macro_dummy.py

  pushd cpp-dummy
  c++ -O3 -Wall -shared -std=c++11 -fPIC $(python3 -m pybind11 --includes) micro_cpp_dummy.cpp -o micro_dummy$(python3-config --extension-suffix)
  popd

  ${srcdir}/${_base}-${pkgver}/test-env/bin/micro-manager-precice micro-manager-cpp-config.json &
  ${srcdir}/${_base}-${pkgver}/test-env/bin/python macro_dummy.py

  ${srcdir}/${_base}-${pkgver}/test-env/bin/micro-manager-precice micro-manager-cpp-adaptivity-config.json &
  ${srcdir}/${_base}-${pkgver}/test-env/bin/python macro_dummy.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"
}
