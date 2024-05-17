# Maintainer: Kino <cybao292261@163.com>

pkgname=eastl
_pkgname=EASTL
pkgver=3.21.12
pkgrel=3
pkgdesc="Electronic Arts Standard Template Library. It is an extensive and robust implementation that has an emphasis on high performance."
arch=('any')
url="https://github.com/electronicarts/EASTL"
license=("BSD-3-Clause")
makedepends=("cmake" "git")
source=("git+https://github.com/electronicarts/EASTL.git#tag=$pkgver")
sha256sums=('2c0fb5138a350a3773add4916860587b692799c2959c5dfa99c8e18093320c8a')

prepare() {
  cd $srcdir/$_pkgname

  sed -i 's|url.*eastl/EASTL$|url = https://github.com/electronicarts/EASTL.git|g' .git/config
  git submodule update --init

  # Add missing install
  sed -i '$a install(DIRECTORY include/Common/EABase DESTINATION include)' test/packages/EABase/CMakeLists.txt
}

build() {
  # Clear default flags in makepkg.conf
  unset CFLAGS CXXFLAGS LDFLAGS LTOFLAGS

  cmake -B build -S $srcdir/$_pkgname \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_SHARED_LIBS=ON \
        -DEASTL_BUILD_TESTS=ON \
        -DEASTL_BUILD_BENCHMARK=ON \
        -DEASTL_STD_ITERATOR_CATEGORY_ENABLED=ON \
        -Wno-dev
  cmake --build build --config Release
}

check() {
  ctest --test-dir build/test -C Release -VV
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm755 "${srcdir}/build/benchmark/EASTLBenchmarks" "${pkgdir}/usr/bin/EASTLBenchmarks"
  install -Dm755 "${srcdir}/build/test/EASTLTest" "${pkgdir}/usr/bin/EASTLTest"

  install -Dm755 "${srcdir}/build/test/packages/EAAssert/libEAAssert.so" "${pkgdir}/usr/lib"
  install -Dm755 "${srcdir}/build/test/packages/EAMain/libEAMain.so" "${pkgdir}/usr/lib"
  install -Dm755 "${srcdir}/build/test/packages/EAStdC/libEAStdC.so" "${pkgdir}/usr/lib"
  install -Dm755 "${srcdir}/build/test/packages/EATest/libEATest.so" "${pkgdir}/usr/lib"
  install -Dm755 "${srcdir}/build/test/packages/EAThread/libEAThread.so" "${pkgdir}/usr/lib"

  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/${_pkgname}/3RDPARTYLICENSES.TXT" "${pkgdir}/usr/share/licenses/${pkgname}/3RDPARTYLICENSES.TXT"
}
