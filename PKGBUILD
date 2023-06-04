# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pygmsh
pkgname=python-${_base}
pkgdesc="Gmsh for Python"
pkgver=7.1.17
pkgrel=3
arch=(x86_64)
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python-meshio gmsh)
makedepends=(python-build python-flit-core python-installer)
checkdepends=(python-pytest-codeblocks python-matplotlib)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('f43716750d43c44121f06d7275540c0a6fb0fcb619b9475377b43b46c2e8f6c336e23b80a25383b617f6a0843ec86521699faae573aca01b1d4e12970cc72987')

build() {
  cd ${_base}-${pkgver}
  PYTHONPATH="/usr/share/gmsh/api/python:${PYTHONPATH}" python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  MPLBACKEND=Agg PYTHONPATH="/usr/share/gmsh/api/python:${PYTHONPATH}" test-env/bin/python -m pytest \
    --codeblocks \
    -k 'not circle and not ellipsoid and not swiss_cheese'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  echo 'Important note: for the python-gmsh module to be available you need to add export PYTHONPATH="$PYTHONPATH:/usr/share/gmsh/api/python" in ~/.bashrc, ~/.zshrc, etc. :-)'
}
