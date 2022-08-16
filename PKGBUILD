# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=islpy
pkgname=python-${_base}
pkgdesc="Python wrapper for isl, an integer set library"
pkgver=2022.2.1
pkgrel=2
arch=('x86_64')
url="https://documen.tician.de/${_base}"
license=(MIT)
depends=(imath libisl barvinok python-pytest)
makedepends=(git python-setuptools pybind11 python-pcpp)
source=("git+https://github.com/inducer/${_base}.git?signed#tag=v${pkgver}")
validpgpkeys=('900A958D9A0ACA58B1468F2471AA298BCA171145') # Andreas Kloeckner
sha512sums=('SKIP')

build() {
  cd ${_base}
  git submodule init && git submodule update
  python3 ./configure.py \
    --enable-shared \
    --python-exe=python3 \
    --isl-inc-dir=/usr/include \
    --isl-lib-dir=/usr/lib \
    --no-use-shipped-imath \
    --no-use-shipped-isl \
    --use-barvinok \
    --prefix=/usr
  python setup.py build
}

check() {
  cd ${_base}
  local _pyversion=$(python -c "import sys; print(f'{sys.version_info.major}{sys.version_info.minor}')")
  PYTHONPATH="${PWD}/build/lib.linux-${CARCH}-cpython-${_pyversion}:${PYTHONPATH}" python test/test_isl.py
}

package() {
  cd "${_base}"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
