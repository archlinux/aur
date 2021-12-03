# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>
_base=orthopy
pkgname=python-${_base}
pkgdesc="Orthogonal polynomials in all shapes and sizes"
pkgver=0.9.5
pkgrel=1
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python-numpy python-sympy)
makedepends=(python-setuptools)
checkdepends=(python-pytest-codeblocks python-ndim python-scipy python-meshzoo python-dufte python-cplot python-meshio)
optdepends=('python-cplot: for SRGB1 coloring'
  'python-dufte: for minimalistic matplotlib style'
  'python-meshio: for creation sphere mesh'
  'python-meshzoo: for creation of sphere mesh generated from the icosahedron')
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('43b2eee46d4395800902fb83a36b1af3c68020f06f28234aeac4c3fe9265c1b76709377fa7e92717c528ee14d089efba17211ab5b285cf7578bad013d289c8b9')

build() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" build
}

check() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" install --root="${PWD}/tmp_install" --optimize=1 --skip-build
  MPLBACKEND=Agg PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest --codeblocks
}

package() {
  cd "${_base}-${pkgver}"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
