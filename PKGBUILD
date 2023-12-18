# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Ghassan Alduraibi <git@ghassan.dev>
_base=Jumpy
pkgname=python-jax-${_base,,}
pkgver=1.0.0
pkgrel=1
pkgdesc="Common backend for Jax or Numpy"
arch=(any)
url="https://github.com/Farama-Foundation/${_base}"
license=(Apache)
depends=(python-numpy)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-jax)
optdepends=('python-jax: for JAX backend')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('38d365fe15a8533650b89610cbaa589ff6b948201cab0e5d272a24f971d58fe29552d6517627434a35089d47db5f580cd07e8263039bd824111dfe45ae56cffa')

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
