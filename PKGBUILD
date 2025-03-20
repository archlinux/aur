# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=meshpy
pkgname=python-${_base}
pkgdesc="2D/3D simplicial mesh generator interface for Python (Triangle, TetGen, gmsh)"
pkgver=2025.1.1
pkgrel=1
arch=(x86_64)
url="https://documen.tician.de/${_base}"
license=(MIT)
depends=(python-gmsh_interop)                # boost
makedepends=(python-setuptools pybind11 git) # ctags
checkdepends=(python-pytest)                 # python-matplotlib
source=("git+https://github.com/inducer/${_base}.git?signed#tag=v${pkgver}")
validpgpkeys=('900A958D9A0ACA58B1468F2471AA298BCA171145') # Andreas Kloeckner
sha512sums=('d97f56f1497861c5170536ac4b105ba4d299bdb1ae54747b10393e9ab3ab8a184ee1cb66baae0e242a7184b076143c991ac72e78925630cc8f53ae4dc3761288')

build() {
  cd ${_base}
  python3 ./configure.py --python-exe=python3
  make
}

check() {
  cd ${_base}
  local _pyversion=$(python -c "import sys; print(f'{sys.version_info.major}{sys.version_info.minor}')")
  PYTHONPATH="${PWD}/build/lib.linux-${CARCH}-cpython-${_pyversion}:${PYTHONPATH}" python test/test_meshpy.py
}

package() {
  cd ${_base}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
