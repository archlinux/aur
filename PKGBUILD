# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=meshpy
pkgname=python-${_base}
pkgdesc="2D/3D simplicial mesh generator interface for Python (Triangle, TetGen, gmsh)"
pkgver=2020.1
pkgrel=4
arch=('x86_64')
url="https://documen.tician.de/${_base}"
license=(MIT)
depends=(python-gmsh_interop)                # boost
makedepends=(python-setuptools pybind11 git) # ctags
checkdepends=(python-pytest)                 # python-matplotlib
source=("git+https://github.com/inducer/${_base}.git?signed#tag=v${pkgver}")
validpgpkeys=('900A958D9A0ACA58B1468F2471AA298BCA171145') # Andreas Kloeckner
sha512sums=('SKIP')

build() {
  cd "${_base}"
  python3 ./configure.py --python-exe=python3
  make
}

check() {
  cd "${_base}"
  local _pyversion=$(python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
  PYTHONPATH="${PWD}/build/lib.linux-${CARCH}-${_pyversion}:${PYTHONPATH}" python test/test_meshpy.py
}

package() {
  cd "${_base}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
