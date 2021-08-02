_base=orthopy
pkgname=python-${_base}
pkgdesc="Orthogonal polynomials in all shapes and sizes"
pkgver=0.9.3
pkgrel=1
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python-numpy python-sympy)
makedepends=(python-setuptools)
checkdepends=(python-tox)
optdepends=('python-cplot: for SRGB1 coloring'
  'python-dufte: for minimalistic matplotlib style'
  'python-meshio: for creation sphere mesh'
  'python-meshzoo: for creation of sphere mesh generated from the icosahedron')
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('5548b35ca5613a1708342a812a3e126befbb3f396640a2d6f51ff6b3973169a6f7b9df0115fda23fe3bcf2ccc5d411be2fd271fab2cea135c9f1105b3c825e9d')

export PYTHONPYCACHEPREFIX="${BUILDDIR}/${pkgname}/.cache/cpython/"

build() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" build
}

check() {
  cd "${_base}-${pkgver}"
  tox -e py$(python -c "import sys; print(sys.version[:3].replace('.', ''))")
}

package() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" install --root="$pkgdir" --optimize=1
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
