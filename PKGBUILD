_base=colorio
pkgname=python-${_base}
pkgdesc="Tools for color models"
pkgver=0.7.5
pkgrel=1
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python-matplotlib python-npx)
makedepends=(python-setuptools git-lfs)
checkdepends=(python-tox gmsh)
optdepends=('python-meshio: for creation mesh'
  'python-meshzoo: for creation triangle and cube mesh'
  'python-optimesh: for triangular mesh optimization'
  'python-pygmsh: for xy gamut mesh support'
  'python-pyvista: for creation unstructured grid and plotter'
  'python-scipy: for curve fit support'
  'vtk: for create VTK hexahedron support')
source=(git+${url}.git#tag=v${pkgver})
sha512sums=('SKIP')

export PYTHONPYCACHEPREFIX="${BUILDDIR}/${pkgname}/.cache/cpython/"

prepare() {
  cd "${_base}"
  git remote set-url origin "${url}.git"
  git lfs install
  git lfs fetch
  git lfs checkout
}

build() {
  cd "${_base}"
  python -c "from setuptools import setup; setup();" build
}

check() {
  cd "${_base}"
  tox -e py$(python -c "import sys; print(sys.version[:3].replace('.', ''))")
}

package() {
  cd "${_base}"
  export PYTHONHASHSEED=0
  python -c "from setuptools import setup; setup();" install --root="$pkgdir" --optimize=1
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
