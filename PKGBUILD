# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=colorio
pkgname=python-${_base}
pkgdesc="Tools for color models"
pkgver=0.8.3
pkgrel=1
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=('GPL3')
depends=('python-matplotlib' 'python-npx')
makedepends=('python-setuptools' 'git-lfs')
# checkdepends=('python-pytest-codeblocks' 'python-perfplot' 'gmsh' 'python-colorspacious' 'python-colour-science' 'python-pyvista' 'python-optimesh')
optdepends=('python-meshio: for creation mesh'
  'python-meshzoo: for creation triangle and cube mesh'
  'python-optimesh: for triangular mesh optimization'
  'python-pygmsh: for xy gamut mesh support'
  'python-pyvista: for creation unstructured grid and plotter'
  'python-scipy: for curve fit support'
  'vtk: for create VTK hexahedron support')
source=("git+${url}.git#tag=${pkgver}")
sha512sums=('SKIP')

export GIT_LFS_SKIP_SMUDGE=1

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

# check() {
#   cd "${_base}"
#   python -c "from setuptools import setup; setup();" install --root="${PWD}/tmp_install" --optimize=1 --skip-build
#   MPLBACKEND=Agg PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):/usr/share/gmsh/api/python:${PYTHONPATH}" python -m pytest --codeblocks
# }

package() {
  cd "${_base}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --root="$pkgdir" --optimize=1
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
