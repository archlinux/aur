# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=adaptmesh
pkgname=python-${_base}
pkgdesc="Adaptive mesh generation and refinement"
pkgver=0.3.3
pkgrel=2
arch=('x86_64')
url="https://github.com/kinnala/${_base}"
license=(MIT)
depends=(python-matplotlib python-scikit-fem)
makedepends=(python-build python-installer python-setuptools python-wheel) # python-pip
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('0fba25cd035178c373d8df5e53459bd50019dac8434d0370e8f79dc8fd5a3886f211b49886fd8bfcd056b588b16f97288f3b889abdb650603c8ede44465216ed')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
  # PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}"
  # python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
