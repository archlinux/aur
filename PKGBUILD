# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=symfem
pkgname=python-${_base}
pkgver=2025.9.0
pkgrel=1
pkgdesc="Symbolic finite element definition library"
url="https://github.com/mscroggs/${_base}"
license=(MIT)
arch=(any)
depends=(python-sympy python-appdirs)
makedepends=(python-build python-installer python-flit-core python-wheel)
checkdepends=(python-pytest python-cairosvg) # python-numpy python-fenics-basix texlive-latexextra
optdepends=('python-cairosvg: for plotting PNGs')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('030c12a3e00b9120daf06e3b3a2a03efad08918143788b113e9f4bfba1afa3107d8ecf12d859ff40d97bfa9b3a533a1f58b171c96c7e1450aa620df55e391874')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest test/test_dof_descriptions.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
