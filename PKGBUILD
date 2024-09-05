# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=islpy
pkgname=python-${_base}
pkgdesc="Python wrapper for isl, an integer set library"
pkgver=2024.2
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
sha512sums=('6fb264c16dae8a1c397df7521c462429c0edf42edf60226f1659ff04933e58fd796da38dbc3e6159e05c0a4ace94740790f819e33243c11eefddc0cf8797a0d2'
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
