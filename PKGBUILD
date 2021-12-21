# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=islpy
pkgname=python-${_base}
pkgdesc="Python wrapper for isl, an integer set library"
pkgver=2021.1
pkgrel=4
arch=('x86_64')
url="https://documen.tician.de/${_base}"
license=(MIT)
depends=(python-pytools pybind11)   # isl
makedepends=(python-setuptools git) # barvinok boost
checkdepends=(python-pytest)        # python-pcpp
source=("git+https://github.com/inducer/${_base}.git?signed#tag=v${pkgver}")
validpgpkeys=('900A958D9A0ACA58B1468F2471AA298BCA171145') # Andreas Kloeckner
sha512sums=('SKIP')

build() {
  cd "${_base}"
  git submodule init && git submodule update
  python3 ./configure.py \
    --enable-shared \
    --python-exe=python3 \
    --no-use-shipped-imath \
    --isl-inc-dir=/usr/include \
    --isl-lib-dir=/usr/lib \
    --prefix=/usr
  python setup.py build
  # make
}
# --no-use-shipped-isl \
# --use-barvinok \
check() {
  cd "${_base}"
  local _pyversion=$(python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
  PYTHONPATH="${PWD}/build/lib.linux-${CARCH}-${_pyversion}:${PYTHONPATH}" python test/test_isl.py
}

package() {
  cd "${_base}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  # install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
