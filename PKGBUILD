# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=scikit-fem
pkgname=python-${_base}
pkgdesc="Simple finite element assemblers"
pkgver=12.0.1
pkgrel=1
arch=(x86_64)
url="https://github.com/kinnala/${_base}"
license=(BSD-3-Clause)
depends=(python-scipy)
makedepends=(python-build python-installer python-flit-core)
checkdepends=(python-pytest python-matplotlib python-meshio python-jax python-shapely)
source=(https://pypi.org/packages/source/${_base::1}/${_base//-/_}/${_base//-/_}-${pkgver}.tar.gz)
sha512sums=('e0840763e57e097e249ceb2156218f090902c4e8588251d979458136b72d26559d82a3833430f06a9c80f82ecdfcce863af45fdff2fb83a7044ab8dc73348c05')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  MPLBACKEND=Agg test-env/bin/python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
