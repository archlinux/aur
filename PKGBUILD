# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=islpy
pkgname=python-${_base}
pkgdesc="Wrapper around isl, an integer set library"
pkgver=2026.1
pkgrel=1
arch=(x86_64)
url="https://documen.tician.de/${_base}"
license=(MIT)
depends=(barvinok imath libisl python)
makedepends=(python-build python-installer python-setuptools python-wheel
  nanobind python-scikit-build-core python-pcpp git python-typing_extensions)
# checkdepends=(python-pytest)
source=(git+https://github.com/inducer/${_base}.git?signed#tag=v${pkgver}
  git+https://github.com/inducer/isl.git)
validpgpkeys=('900A958D9A0ACA58B1468F2471AA298BCA171145') # Andreas Kloeckner <mathem@tician.de>
sha512sums=('ed35882f9749962299cb4ce34f0b69317417aee579f2cea9ada3c31f823b63c7e348447ce2964ee806b72bd677786c50d9bbca3ea9c734115af32114272814b3'
            'SKIP')

prepare() {
  cd ${_base}
  git submodule init
  git config submodule.libs/isl.url "${srcdir}/isl"
  git -c protocol.file.allow=always submodule update
  sed -i 's/^option(USE_SHIPPED_ISL "Use shipped ISL" ON)/option(USE_SHIPPED_ISL "Use shipped ISL" OFF)/' CMakeLists.txt
  sed -i 's/^option(USE_SHIPPED_IMATH "Use shipped IMATH" ON)/option(USE_SHIPPED_IMATH "Use shipped IMATH" OFF)/' CMakeLists.txt
  sed -i 's/^option(USE_BARVINOK "Use Barvinok (beware of GPL license)" OFF)/option(USE_BARVINOK "Use Barvinok (beware of GPL license)" ON)/' CMakeLists.txt
  sed -i '176 a set(ISL_INC_DIRS \/usr\/include)' CMakeLists.txt
  sed -i '176 a set(ISL_LIB_DIRS \/usr\/lib)' CMakeLists.txt
}

build() {
  cd ${_base}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer ${_base}/dist/*.whl
#   local _pyversion=$(python -c "import sys; print(f'{sys.version_info.major}{sys.version_info.minor}')")
#   LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${srcdir}/${_base}/build/lib/lib.linux-${CARCH}-cpython-${_pyversion}" test-env/bin/python -m pytest ${_base}/test
# }

package() {
  cd ${_base}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
