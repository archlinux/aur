# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=colorio
pkgname=python-${_base}
pkgdesc="Tools for color research"
pkgver=0.11.0
pkgrel=2
arch=(any)
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python-matplotlib python-npx)
makedepends=(python-build python-flit-core python-install)
# checkdepends=(python-pytest-codeblocks python-colorspacious python-scipy python-meshio python-meshzoo python-optimesh python-pygmsh) # python-perfplot | python-pyvista
optdepends=('python-meshio: for creation mesh'
  'python-meshzoo: for creation triangle and cube mesh'
  'python-optimesh: for triangular mesh optimization'
  'python-pygmsh: for xy gamut mesh support'
  'python-pyvista: for creation unstructured grid and plotter'
  'python-scipy: for curve fit support'
  'vtk: for create VTK hexahedron support')
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('1a21ee8dcfd886326716ec6ca75cd9c426e0d2a0bb485a6ee3d978ba5f9a0eaaf680cb4a49bc6f60363520e68cc00567dffa96155e5bbd90270e40d8cd7c4549')

build() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m install --optimize=1 dist/*.whl
#   MPLBACKEND=Agg PYTHONPATH="/usr/share/gmsh/api/python:${PYTHONPATH}" test-env/bin/python -m pytest --codeblocks -k 'not combvd and not fairchild_chen and not hung_berns and not macadam_1942 and not rit_dupont and not slice and not tools'
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m install --optimize=1 --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${site_packages}/${_base}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
