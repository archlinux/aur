# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=symfem
pkgname=python-${_base}
pkgver=2025.11.1
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
sha512sums=('b55b1b238deba5adc43f4aec6521ce67a126336be8844a7ac64a447d0b666de43e074311d0739e5613070150262d2c6397f712c4e6a585f7386b6e094f592af8')

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
