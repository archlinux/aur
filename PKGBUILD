# Maintainer: Gerasimos Chourdakis <chourdak at in dot tum dot de>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=micro-manager
pkgname=python-${_base}-precice
pkgdesc="micro-manager-precice is a package which facilitates two-scale macro-micro coupled simulations using preCICE"
pkgver=0.4.0
pkgrel=1
arch=(any)
url="https://precice.org/tooling-${_base}-overview.html"
license=(LGPL-3.0-or-later)
depends=(python-pyprecice)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::https://github.com/precice/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('72c1ddbd6a759075b0f47200b8290b286aae7acfe0a425b28bbf7681f712e7c7a0d94357ea9e5335deedad2284f41234648888b0152b10c104eeefb8cb8e6567')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl

  cd ${srcdir}/${_base}-${pkgver}/tests/integration/test_unit_cube
  ${srcdir}/${_base}-${pkgver}/test-env/bin/python unit_cube.py &
  ${srcdir}/${_base}-${pkgver}/test-env/bin/python run_micro_manager.py --config micro-manager-config-local-adaptivity.json

  ${srcdir}/${_base}-${pkgver}/test-env/bin/python unit_cube.py &
  ${srcdir}/${_base}-${pkgver}/test-env/bin/python run_micro_manager.py --config micro-manager-config-global-adaptivity.json

  cd ${srcdir}/${_base}-${pkgver}/tests/unit
  ${srcdir}/${_base}-${pkgver}/test-env/bin/python -m unittest test_micro_manager.py
  ${srcdir}/${_base}-${pkgver}/test-env/bin/python -m unittest test_domain_decomposition.py
  ${srcdir}/${_base}-${pkgver}/test-env/bin/python -m unittest test_adaptivity_serial.py

  cd ${srcdir}/${_base}-${pkgver}/examples
  ${srcdir}/${_base}-${pkgver}/test-env/bin/python macro_dummy.py &
  ${srcdir}/${_base}-${pkgver}/test-env/bin/python python-dummy/run_micro_manager.py --config micro-manager-config.json

  ${srcdir}/${_base}-${pkgver}/test-env/bin/python macro_dummy.py &
  ${srcdir}/${_base}-${pkgver}/test-env/bin/python python-dummy/run_micro_manager.py --config micro-manager-adaptivity-config.json
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"
}
