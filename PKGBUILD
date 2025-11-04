# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=symfem
pkgname=python-${_base}
pkgver=2025.11.0
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
sha512sums=('85e67b1c14c7aee55ed18c054f2a7186e86467f6b4a8e64bf2673e6d3dde8177750b7a6ec20089e943f761eb4270d858c865f43f2549c5d70c0916f74cbe1b40')

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
