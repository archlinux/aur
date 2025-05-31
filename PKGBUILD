# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=opytional
pkgname=python-${_base}
pkgdesc="makes working with values that might be None safer and easier"
pkgver=0.1.0
pkgrel=1
arch=(any)
url="https://github.com/mmore500/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('d387af463b4dda672064183f8d2a13a7d14aed0f8ccfbed1a71c040eed2f77c4918f79a2ba77c351dc51e111ccf5655aeeff06a620040c6e293687ec67251f43')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
