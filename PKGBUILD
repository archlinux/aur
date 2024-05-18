# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgbase=opm-common
pkgname=("${pkgbase}" python-"${pkgbase}")
_dunever=2.9.1
pkgver=2024.04
pkgrel=1
pkgdesc="Open Porous Media Initiative shared infrastructure"
arch=(x86_64)
url="https://github.com/OPM/${pkgbase}"
license=(GPL-3.0-or-later)
makedepends=("dune-common>=${_dunever}" boost fmt cjson suitesparse texlive-basic doxygen graphviz
  pybind11 python-scikit-build python-setuptools-scm python-pytest-runner)
source=(${pkgbase}-release-${pkgver}-final.tar.gz::${url}/archive/release/${pkgver}/final.tar.gz
  gcc-14.patch::${url}/pull/4064.patch)
sha512sums=('60ca3cb83628b3efb0d7424b4a4bbc5c650f2b1095da5a32617f5e0ed94f2861156cd78bfbcc0e126cfb7727db8106a903f8a802ea380cc05313346099957d02'
            'c462d8149d70083abf536de8283633149319e16db439625073f89b7e65961c69e4fd9da2a4e21dfbcfbd37019afadc411b797e1f14279250b2c479e88976161d')

prepare() {
  cd ${pkgbase}-release-${pkgver}-final
  patch -p1 -i ../gcc-14.patch
}

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
  find "${pkgdir}" -type d -empty -delete
}

package_python-opm-common() {
  depends=("opm-common>=${pkgver}" python-numpy)
  pkgdesc+=" (python bindings)"
  cd build-cmake/python
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  mv opm ${pkgdir}/${site_packages}/opm
}
