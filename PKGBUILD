# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pytest-missing-modules
pkgname=python-${_base}
pkgver=0.2.2
pkgrel=1
pkgdesc="Pytest plugin for faking missing modules"
arch=(x86_64)
url="https://github.com/jeertmans/${_base}"
license=(MIT)
depends=(python-pytest)
makedepends=(python-build python-installer python-hatch-fancy-pypi-readme)
checkdepends=()
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('6d1da46f7667748657b8503f853c173b71ed127735fad3ecb8bf52aaf33fb20894e95d2ac85984b2154818508b0d132f7829a1fe9eccc59b9b2bb414fbcfacfb')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
