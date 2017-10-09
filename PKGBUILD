# $Id: PKGBUILD 151545 2015-12-10 03:56:01Z foutrelis $
# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: Alexandre Bique <bique.alexandre@gmail.com>
# Contributor: Louis R. Marascio <lrm@fitnr.com>
# Contributor: Cody Maloney <cmaloney@theoreticalchaos.com>

pkgname=mingw-w64-gtest
pkgver=1.8.0
pkgrel=1
pkgdesc="Google Test - C++ testing utility based on the xUnit framework (like JUnit)"
arch=(any)
url="https://github.com/google/googletest"
license=(custom:BSD3)
depends=(mingw-w64-crt)
makedepends=(mingw-w64-cmake python2)
options=(!buildflags staticlibs !strip)
source=("https://github.com/google/googletest/archive/release-${pkgver}.tar.gz")
sha512sums=('1dbece324473e53a83a60601b02c92c089f5d314761351974e097b2cf4d24af4296f9eb8653b6b03b1e363d9c5f793897acae1f0c7ac40149216035c4d395d9d')

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
        mkdir -pm 0755 "${pkgdir}/usr/${_arch}"/{bin,lib,include/gtest/internal,share/licenses/${pkgname},src/gtest/src,src/gtest/cmake}
        install -m 0644 "build_${_arch}"/libgtest{,_main}.dll "${pkgdir}/usr/${_arch}"/bin
        install -m 0644 "build_${_arch}"/libgtest{,_main}.dll.a "${pkgdir}/usr/${_arch}"/lib
        install -m 0644 include/gtest/*.h "${pkgdir}/usr/${_arch}"/include/gtest
        install -m 0644 include/gtest/internal/*.h "${pkgdir}/usr/${_arch}"/include/gtest/internal/
        install -m 0644 LICENSE "${pkgdir}/usr/${_arch}"/share/licenses/${pkgname}/
        install -m 0644 fused-src/gtest/* "${pkgdir}/usr/${_arch}"/src/gtest/src/
        install -m 0644 CMakeLists.txt "${pkgdir}/usr/${_arch}"/src/gtest/
        install -m 0644 cmake/* "${pkgdir}/usr/${_arch}"/src/gtest/cmake/
    done
}
