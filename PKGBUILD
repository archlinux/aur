_base=krylov
pkgname=python-${_base}
pkgdesc="Krylov subspace methods for Python"
pkgver=0.1.0
pkgrel=1
arch=('any')
url="https://github.com/nschloe/${_base}"
license=(MIT)
depends=(python-scipy)
makedepends=(python-setuptools)
checkdepends=(python-scipyx python-pytest-codeblocks python-matplotlib)
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('90ab3463eefb0e55e95da018652a07dce2d17182db6a56e8c91e503cc1e435f8ee3466378e4ebb0cd1d683e1ac0d3616ca457ea9bcfe5e209ec68c3264ef544a')

build() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" build
}

check() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" install --root="${PWD}/tmp_install" --optimize=1 --skip-build
  PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest --codeblocks -k 'not compare_scipy'
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
