# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=scikit-fem
pkgname=python-${_base}
pkgdesc="Simple finite element assemblers"
pkgver=12.0.2
pkgrel=1
arch=(x86_64)
url="https://github.com/kinnala/${_base}"
license=(BSD-3-Clause)
depends=(python-scipy)
makedepends=(python-build python-installer python-flit-core)
checkdepends=(python-pytest python-matplotlib python-meshio python-jax python-shapely)
source=(https://pypi.org/packages/source/${_base::1}/${_base//-/_}/${_base//-/_}-${pkgver}.tar.gz)
sha512sums=('58e85c67df6737160a82586158df83611dbae3f22b946eafdb798953f7888d28d190985a8fcd382cd9b24d86e353156ecadcaacdf86902182399cdf90ab1b00c')

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
