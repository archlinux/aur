# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Michel Zou <xantares09@hotmail.com>
pkgname=codon
pkgver=0.19.4
pkgrel=1
pkgdesc="A high-performance, zero-overhead, extensible Python compiler using LLVM"
license=(Apache-2.0)
arch=(x86_64)
url="https://github.com/exaloop/${pkgname}"
depends=(llvm-libs ncurses gcc-libs glibc fast_float tomlplusplus semver fmt python)
makedepends=(cmake llvm git gcc-fortran clang) # cpp-peglib
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
  # googletest.zip::https://github.com/google/googletest/archive/03597a01ee50ed33e9dfd640b249b4be3799d395.zip
sha512sums=('b7f3c2699dd8b461278d6a41b26739b5883bda5830d8b5a181fc1585a59da217e5e579362ae633cb4dd39dbc613623841f18dce7eccfc517735f016e4b7f1eae')
# '404a954c72adfb4206c909bd59a0ab0d59d84bf8703c97133b52d0e6a58755310907db62bda13fe352e17250bd5c728fad1fd50d2cbf02154db930fe44754817'

prepare() {
  cd ${pkgname}-${pkgver}
  # sed -i 's|VERSION 2022-06-01|# VERSION 2022-06-01|g' cmake/deps.cmake
  # sed -i 's|CPMAddPackage(|# CPMAddPackage(|g' cmake/deps.cmake
  # link to the single lib
  # sed -i "s|\${LLVM_LIBS}|LLVM-20|g" CMakeLists.txt
  # undefined reference to symbol '_ZN4llvm27createRegionOnlyPrinterPassEv@@LLVM_17'
  # echo "target_link_libraries(codon PRIVATE LLVM-20)" >> CMakeLists.txt
  # echo "target_link_libraries(codon_test LLVM-20)" >> CMakeLists.txt
}

build() {
  export CODON_SYSTEM_LIBRARIES=/usr/lib
  cmake \
    -S ${pkgname}-${pkgver} \
    -B build \
    -DBUILD_SHARED_LIBS=TRUE \
    -DBUILD_TESTING=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_CXX_COMPILER=clang++ \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_Fortran_COMPILER=gfortran \
    -DCMAKE_CXX_STANDARD=17 \
    -DCODON_GPU=OFF \
    -DCPM_USE_LOCAL_PACKAGES=ON \
    -DLIBOMP_USE_VERSION_SYMBOLS=OFF \
    -DLLVM_DIR=/usr/lib/cmake/llvm \
    -Wno-dev
  cmake --build build --target all
}

# -DFETCHCONTENT_FULLY_DISCONNECTED=ON \
# -DFETCHCONTENT_SOURCE_DIR_BDWGC="$srcdir/googletest" \
# -DFETCHCONTENT_SOURCE_DIR_FAST_FLOAT="$srcdir/googletest" \
# -DFETCHCONTENT_SOURCE_DIR_FMT="$srcdir/googletest" \
# -DFETCHCONTENT_SOURCE_DIR_HIGHWAY="$srcdir/googletest" \
# -DFETCHCONTENT_SOURCE_DIR_OPENBLAS="$srcdir/googletest" \
# -DFETCHCONTENT_SOURCE_DIR_PEGLIB="$srcdir/googletest" \
# -DFETCHCONTENT_SOURCE_DIR_RE2="$srcdir/googletest" \
# -DFETCHCONTENT_SOURCE_DIR_SEMVER="$srcdir/googletest" \
# -DFETCHCONTENT_SOURCE_DIR_TOML="$srcdir/googletest" \
# -DFETCHCONTENT_SOURCE_DIR_XZ="$srcdir/googletest" \
# -DFETCHCONTENT_SOURCE_DIR_ZLIBNG="$srcdir/googletest" \

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  # install -Dm644 ${pkgname}-${pkgver}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # rm -r "$pkgdir"/usr/python
  # rm -r "$pkgdir"/usr/include/fmt
  # rm "$pkgdir"/usr/include/peglib.h  
  # rm "$pkgdir"/usr/lib/libfmt.a
  # rm -r "$pkgdir"/usr/lib/cmake/fmt/
  # rm "$pkgdir"/usr/lib/pkgconfig/fmt.pc
}

