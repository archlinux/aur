# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=mole
pkgname=lib${_base}
pkgver=1.3.0
pkgrel=1
pkgdesc="Mimetic Operators Library Enhanced"
url="https://github.com/csrc-sdsu/${_base}"
license=(GPL-3.0-only)
arch=(x86_64)
depends=(armadillo octave)
makedepends=(cmake doxygen eigen graphviz openblas git)
checkdepends=(gtest)
optdepends=('eigen3: for the sparse LU factorization')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz
  git+https://github.com/gllmflndn/m2html.git#branch=main)
sha512sums=('0719fba7096b3fba6441703b4436b5ea0502683438074626cf033e1fc59150334d35d4057c824dce7f692ed08addb46227af7ca92112090ff1b073c4f9cd82bf'
            'SKIP')

prepare() {
  # Similar issue https://lists.altlinux.org/pipermail/sisyphus-cybertalk/2025-May/126338.html
  sed -i 's/^set(CMAKE_CXX_STANDARD 14/set(CMAKE_CXX_STANDARD 17/' ${_base}-${pkgver}/CMakeLists.txt
  # We like use system-wide packages
  sed -i '/^if(UNIX/,+6 s/^/#/' ${_base}-${pkgver}/CMakeLists.txt
  sed -i '/^set(ARMADILLO_VERSION/,+68 s/^/#/' ${_base}-${pkgver}/CMakeLists.txt
  sed -i '/^set(LINK_LIBS/,+3 s/^/#/' ${_base}-${pkgver}/CMakeLists.txt
  sed -i '144i set(LINK_LIBS ${ARMADILLO_LIBRARIES} ${OpenBLAS_LIBRARIES} ${SUPERLU_INSTALL_DIR}/lib/libsuperlu.so ${LAPACK_LIBRARY})' ${_base}-${pkgver}/CMakeLists.txt
  sed -i '/^include(/,+9 s/^/#/' ${_base}-${pkgver}/tests/cpp/CMakeLists.txt
  sed -i 's/^	@python/	#@python/' ${_base}-${pkgver}/doc/sphinx/Makefile
  mv ${srcdir}/m2html ${srcdir}/${_base}-${pkgver}
}

build() {
  cmake \
    -S ${_base}-${pkgver} \
    -B build \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_CXX_COMPILER=g++ \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build --target mole_C++
  cd ${_base}-${pkgver}
  octave -q -p m2html --eval "m2html('mfiles', 'src/matlab_octave', 'htmldir', 'doc/doxygen/matlab_octave', 'global', 'on', 'template', 'blue')"
  cd doc/sphinx/
  make doc-doxygen
}

check() {
  cmake --build build --target run_tests
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -d ${pkgdir}/usr/include/${_base}
  install ${_base}-${pkgver}/src/cpp/*.h ${pkgdir}/usr/include/${_base}

  install -d "${pkgdir}/usr/share/${pkgname}"
  mv ${_base}-${pkgver}/src/matlab_octave ${pkgdir}/usr/share/${pkgname}

  # install docs
  install -d ${pkgdir}/usr/share/doc/${pkgname}
  mv ${_base}-${pkgver}/doc/doxygen ${pkgdir}/usr/share/doc/${pkgname}

  # install tutorials
  install -d ${pkgdir}/usr/share/doc/${pkgname}/examples
  mv ${_base}-${pkgver}/examples/cpp ${pkgdir}/usr/share/doc/${pkgname}/examples
  mv ${_base}-${pkgver}/examples/matlab_octave ${pkgdir}/usr/share/doc/${pkgname}/examples

  install -Dm 644 ${_base}-${pkgver}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
