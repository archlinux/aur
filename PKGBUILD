# $Id: PKGBUILD 151545 2015-12-10 03:56:01Z foutrelis $
# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: Alexandre Bique <bique.alexandre@gmail.com>
# Contributor: Louis R. Marascio <lrm@fitnr.com>
# Contributor: Cody Maloney <cmaloney@theoreticalchaos.com>

pkgname=mingw-w64-gtest
pkgver=1.8.1
pkgrel=1
pkgdesc="Google Test - C++ testing utility based on the xUnit framework (like JUnit) (mingw-w64)"
arch=(any)
url="https://github.com/google/googletest"
license=(custom:BSD3)
depends=(mingw-w64-crt)
makedepends=(mingw-w64-cmake python2)
options=(!buildflags staticlibs !strip)
source=("https://github.com/google/googletest/archive/release-${pkgver}.tar.gz")
sha512sums=('e6283c667558e1fd6e49fa96e52af0e415a3c8037afe1d28b7ff1ec4c2ef8f49beb70a9327b7fc77eb4052a58c4ccad8b5260ec90e4bceeac7a46ff59c4369d7')

_mingw_arch=(i686-w64-mingw32 x86_64-w64-mingw32)

build() {
    cd "googletest-release-${pkgver}/googletest"

    for _arch in "${_mingw_arch[@]}"; do
        mkdir -p "build_${_arch}"
        pushd "build_${_arch}"
        "${_arch}-cmake" \
            -DCMAKE_BUILD_TYPE=Release \
            -DLIB_INSTALL_DIR=lib \
            -DBUILD_SHARED_LIBS=ON \
            -DCMAKE_SKIP_RPATH=ON \
            -Dgtest_disable_pthreads=ON \
            ..
        make
        popd
    done

    python2 scripts/fuse_gtest_files.py fused-src
}

package() {
    cd "googletest-release-${pkgver}/googletest"

    for _arch in "${_mingw_arch[@]}"; do
        mkdir -pm 0755 "${pkgdir}/usr/${_arch}"/{bin,lib,include/gtest/internal/custom,share/licenses/${pkgname},src/gtest/src,src/gtest/cmake}
        install -m 0644 "build_${_arch}"/libgtest{,_main}.dll "${pkgdir}/usr/${_arch}"/bin
        install -m 0644 "build_${_arch}"/libgtest{,_main}.dll.a "${pkgdir}/usr/${_arch}"/lib
        install -m 0644 include/gtest/*.h "${pkgdir}/usr/${_arch}"/include/gtest
        install -m 0644 include/gtest/internal/*.h "${pkgdir}/usr/${_arch}"/include/gtest/internal/
        install -m 0644 include/gtest/internal/custom/*.h "${pkgdir}/usr/${_arch}"/include/gtest/internal/custom
        install -m 0644 LICENSE "${pkgdir}/usr/${_arch}"/share/licenses/${pkgname}/
        install -m 0644 fused-src/gtest/* "${pkgdir}/usr/${_arch}"/src/gtest/src/
        install -m 0644 CMakeLists.txt "${pkgdir}/usr/${_arch}"/src/gtest/
        install -m 0644 cmake/* "${pkgdir}/usr/${_arch}"/src/gtest/cmake/
    done
}
