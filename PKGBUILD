# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=optimistix
pkgname=python-${_base}
pkgdesc="Nonlinear optimisation in JAX and Equinox"
pkgver=0.0.9
pkgrel=1
arch=(any)
url="https://github.com/patrick-kidger/${_base}"
license=(Apache-2.0)
depends=(python-lineax)
makedepends=(python-build python-installer python-hatchling python-wheel)
checkdepends=(python-pytest python-beartype)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('a5e77d1f5f3a1ccc68817aa301bdcc15da2fb125781db986a1a1cc045f9854b9afb5344794d450bde78bf94e144c8af93fd27a66e77bb28ae5bcf57170984cb9')

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
