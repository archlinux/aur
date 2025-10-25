# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgbase=opm-common
pkgname=("${pkgbase}" python-"${pkgbase}")
_dunever=2.10.0
pkgver=2025.10
pkgrel=1
pkgdesc="Open Porous Media Initiative shared infrastructure"
arch=(x86_64)
url="https://github.com/OPM/${pkgbase}"
license=(GPL-3.0-or-later)
makedepends=("dune-common>=${_dunever}" boost fmt cjson suitesparse texlive-basic doxygen graphviz
  pybind11 python-scikit-build python-setuptools-scm python-pytest-runner)
options=(!emptydirs)
source=(${pkgbase}-release-${pkgver}-final.tar.gz::${url}/archive/release/${pkgver}/final.tar.gz)
sha512sums=('a99c1e4f9166ab48f68a9d952832ddc7625bb76c273c41b365b31b38f26eeb85424c76310245e0f605576066cc3383611f1ff8e320bf2d5e8ea37c00a8880dca')

build() {
  cmake \
    -S ${pkgbase}-release-${pkgver}-final \
    -B build-cmake \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=1 \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_C_COMPILER=gcc \
    -DCMAKE_CXX_COMPILER=g++ \
    -DCMAKE_C_FLAGS='-Wall -fdiagnostics-color=always' \
    -DCMAKE_CXX_FLAGS="-Wall -fdiagnostics-color=always -mavx" \
    -DCMAKE_POSITION_INDEPENDENT_CODE=TRUE \
    -DUSE_MPI=1 \
    -DOPM_ENABLE_PYTHON=ON \
    -DOPM_ENABLE_EMBEDDED_PYTHON=OFF \
    -DOPM_INSTALL_PYTHON=OFF \
    -DBUILD_EXAMPLES=OFF \
    -Wno-dev
  cmake --build build-cmake --target opmcommon_python
}

package_opm-common() {
  depends=("dune-common>=${_dunever}" boost fmt cjson)
  provides=('arraylist' 'co2brinepvt' 'compareECL' 'convertECL' 'opmhash' 'opmi' 'opmpack' 'rewriteEclFile' 'rst_deck' 'summary')
  optdepends=('bash-completion: for completion when using bash'
    'man-db: manual pages for compareECL, convertECL, opmhash, opmpack, rst_deck and summary')
  DESTDIR="${pkgdir}" cmake --build build-cmake --target install install-html
  install -Dm644 ${pkgbase}-release-${pkgver}-final/LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
  cd "${pkgdir}"
  rm -r usr/build-cmake
}

package_python-opm-common() {
  depends=("opm-common>=${pkgver}" python-numpy)
  pkgdesc+=" (python bindings)"
  cd build-cmake/python
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  mv opm ${pkgdir}/${site_packages}/opm
}
