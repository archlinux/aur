# Maintainer: Gerasimos Chourdakis <chourdak at in dot tum dot de>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=micro-manager
pkgname=python-${_base}-precice
pkgdesc="micro-manager-precice is a package which facilitates two-scale macro-micro coupled simulations using preCICE"
pkgver=0.3.0
pkgrel=1
arch=(any)
url="https://precice.org/tooling-${_base}-overview.html"
license=(LGPL3)
depends=(python-pyprecice)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::https://github.com/precice/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('046c8bb9dc7b914f22271f87c27856869a0dad546c6cd5e352be474e2259a30be04c198984e791c5bb48eda9f7faea4e4ef6baa6c2df17e419392ab55dd4f724')

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

  cd ${srcdir}/${_base}-${pkgver}/examples
  ${srcdir}/${_base}-${pkgver}/test-env/bin/python macro_dummy.py &
  ${srcdir}/${_base}-${pkgver}/test-env/bin/python python-dummy/run_micro_manager.py --config micro-manager-config.json

  ${srcdir}/${_base}-${pkgver}/test-env/bin/python macro_dummy.py &
  ${srcdir}/${_base}-${pkgver}/test-env/bin/python python-dummy/run_micro_manager.py --config micro-manager-adaptivity-config.json
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base/-/_}_precice-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
