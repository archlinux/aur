# Maintainer: Gerasimos Chourdakis <chourdak at in dot tum dot de>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=micro-manager
pkgname=python-${_base}-precice
pkgdesc="micro-manager-precice is a package which facilitates two-scale macro-micro coupled simulations using preCICE"
pkgver=0.2.1
pkgrel=1
arch=(x86_64)
url="https://github.com/precice/${_base}"
license=(LGPL3)
depends=(python-pyprecice)
makedepends=(python-setuptools python-wheel python-build python-install)
checkdepends=(openssh)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('c043d037a554dfa425e07ebd6504759e10c002c6b546769ba00cde8a916ba73f79c7980bf501642de34bf0ab5f9e43cb53957ea31bde70fcb7f410bd60d91f82')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m install --optimize=1 dist/*.whl
  chmod +x test-env/bin/${_base/-/_}
  cd examples/macro-micro-dummy
  ${srcdir}/${_base}-${pkgver}/test-env/bin/python macro_dummy.py &
  ${srcdir}/${_base}-${pkgver}/test-env/bin/python run_micro_manager.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m install --optimize=1 --destdir="${pkgdir}" dist/*.whl

  # https://github.com/FFY00/python-install/pull/6
  chmod +x ${pkgdir}/usr/bin/${_base/-/_}

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base/-/_}_precice-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
