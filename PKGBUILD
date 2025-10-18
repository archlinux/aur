# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=optimistix
pkgname=python-${_base}
pkgdesc="Nonlinear optimisation in JAX and Equinox"
pkgver=0.0.11
pkgrel=1
arch=(any)
url="https://github.com/patrick-kidger/${_base}"
license=(Apache-2.0)
depends=(python-lineax)
makedepends=(python-build python-installer python-hatchling python-wheel)
checkdepends=(python-pytest python-beartype)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('ce426f5c533d3b55214cdcfee7d166abda2f245d3ddf414eafdfd4eba5c1304be4838f5a16eb370431e27f02ffaa7879e0db53d01928dc4d511088824ad5bda9')

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
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
