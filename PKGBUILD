# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=meshpy
pkgname=python-${_base}
pkgdesc="2D/3D simplicial mesh generator interface for Python (Triangle, TetGen, gmsh)"
pkgver=2020.1
pkgrel=1
arch=('x86_64')
url="https://documen.tician.de/${_base}"
license=(MIT)
depends=(pybind11 python-gmsh_interop) # boost
makedepends=(python-setuptools git)    # ctags
checkdepends=(python-pytest python-matplotlib)
source=("git+https://github.com/inducer/${_base}.git?signed#tag=v${pkgver}")
validpgpkeys=("900A958D9A0ACA58B1468F2471AA298BCA171145") # Andreas Kloeckner
sha512sums=('SKIP')

export PYTHONPYCACHEPREFIX="${BUILDDIR}/${pkgname}/.cache/cpython/"

build() {
  cd "${_base}"
  python3 ./configure.py --python-exe=python3
  make
}

check() {
  cd "${_base}"
  python setup.py install --root="${PWD}/tmp_install" --optimize=1 --skip-build
  local _pyversion=$(python -c "import sys; print(sys.version[:3])")
  PYTHONPATH="${PWD}/build/lib.linux-${CARCH}-${_pyversion}:${PYTHONPATH}" python test/test_meshpy.py
}

package() {
  cd "${_base}"
  export PYTHONHASHSEED=0
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
