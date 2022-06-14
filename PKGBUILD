# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgbase=opm-common
pkgname=(${pkgbase} python-${pkgbase})
pkgver=2022.04
pkgrel=1
pkgdesc="Tools for Eclipse reservoir simulation files"
arch=(x86_64)
url="https://github.com/OPM/${pkgbase}"
license=(GPL3)
_dunever=2.8.0
makedepends=("dune-common>=${_dunever}" boost fmt cjson cppcheck suitesparse texlive-core doxygen graphviz pybind11 python-pytest-runner python-setuptools-scm git)
source=("git+${url}.git?signed#tag=release/${pkgver}/final1")
sha512sums=('SKIP')
validpgpkeys=('ABE52C516431013C5874107C3F71FE0770D47FFB') # Markus Blatt (applied mathematician and DUNE core developer) <markus@dr-blatt.de>

build() {
  cmake \
    -S ${pkgbase} \
    -B build-cmake \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=1 \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_C_COMPILER=gcc \
    -DCMAKE_CXX_COMPILER=g++ \
    -DCMAKE_CXX_FLAGS="-Wall -fdiagnostics-color=always -mavx" \
    -DCMAKE_POSITION_INDEPENDENT_CODE=TRUE \
    -DUSE_MPI=1 \
    -DOPM_ENABLE_PYTHON=ON \
    -DOPM_ENABLE_EMBEDDED_PYTHON=OFF \
    -DOPM_INSTALL_PYTHON=OFF \
    -DBUILD_EXAMPLES=OFF \
    -DBUILD_TESTING=OFF \
    -Wno-dev
  cmake --build build-cmake --target all
}

package_opm-common() {
  depends=("dune-common>=${_dunever}" boost fmt cjson)
  provides=('arraylist' 'compareECL' 'convertECL' 'rewriteEclFile' 'summary')
  optdepends=('bash-completion: for completion when using bash'
    'man-db: manual pages for compareECL, convertECL, opmhash, opmpack, rst_deck and summary')
  DESTDIR="${pkgdir}" cmake --build build-cmake --target install install-html
  install -Dm644 ${pkgbase}/LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
  cd "${pkgdir}"
  rm -r tmp
  find "${pkgdir}" -type d -empty -delete
}

package_python-opm-common() {
  depends=("opm-common>=${pkgver}" python-numpy)
  pkgdesc+=" (python bindings)"
  cd build-cmake/python
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  local _pyversion=$(python -c "import sys; print(f'{sys.version_info.major}{sys.version_info.minor}')")
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  mv opm/libopmcommon_python.cpython-${_pyversion}-${CARCH}-linux-gnu.so ${pkgdir}/${site_packages}/opm
}
