# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=islpy
pkgname=python-${_base}
pkgdesc="Python wrapper for isl, an integer set library"
pkgver=2025.1.2
pkgrel=1
arch=(x86_64)
url="https://documen.tician.de/${_base}"
license=(MIT)
depends=(imath libisl barvinok python-pytest)
makedepends=(python-build python-installer python-setuptools python-wheel nanobind python-scikit-build python-pcpp git)
checkdepends=(python-pytest)
source=(git+https://github.com/inducer/${_base}.git?signed#tag=v${pkgver}
  git+https://github.com/inducer/isl.git)
validpgpkeys=('900A958D9A0ACA58B1468F2471AA298BCA171145') # Andreas Kloeckner <mathem@tician.de>
sha512sums=('12ce0f44f8c1a46721919c34a1abbd4388920aa0a596f6c7db4866f810ee7706255794f62dc18375a38ef5f3de90ceec418ed7efdd42b0e0486bed048a21e8f6'
            'SKIP')

prepare() {
  cd ${_base}
  git submodule init
  git config submodule.libs/isl.url "${srcdir}/isl"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd ${_base}
  python3 ./configure.py \
    --enable-shared \
    --python-exe=python3 \
    --isl-inc-dir=/usr/include \
    --isl-lib-dir=/usr/lib \
    --no-use-shipped-imath \
    --no-use-shipped-isl \
    --use-barvinok \
    --prefix=/usr
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer ${_base}/dist/*.whl
  local _pyversion=$(python -c "import sys; print(f'{sys.version_info.major}{sys.version_info.minor}')")
  LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${srcdir}/${_base}/build/lib/lib.linux-${CARCH}-cpython-${_pyversion}" test-env/bin/python -m pytest ${_base}/test
}

package() {
  cd ${_base}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
