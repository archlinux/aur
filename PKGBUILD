# Maintainer: Kino <cybao292261@163.com>

pkgname=eastl
_pkgname=EASTL
pkgver=3.21.23
pkgrel=1
pkgdesc="Electronic Arts Standard Template Library. It is an extensive and robust implementation that has an emphasis on high performance."
arch=('any')
url="https://github.com/electronicarts/EASTL"
license=("BSD-3-Clause")
makedepends=("cmake" "git")
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/electronicarts/EASTL/archive/${pkgver}.tar.gz")
sha256sums=('2bcb48f88f7daf9f91c165aae751c10d11d6959b6e10f2dda8f1db893e684022')

build() {
  # Clear default flags in makepkg.conf
  unset CFLAGS CXXFLAGS LDFLAGS LTOFLAGS

  cmake -B build -S $srcdir/$_pkgname-$pkgver \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_SHARED_LIBS=ON \
        -DEASTL_BUILD_TESTS=ON \
        -DEASTL_BUILD_BENCHMARK=OFF \
        -DEASTL_STD_ITERATOR_CATEGORY_ENABLED=ON \
        -Wno-dev
  cmake --build build --config Release
}

check() {
  ctest --test-dir build/test -C Release -VV
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm755 "${srcdir}/build/_deps/eaassert-build/libEAAssert.so" "${pkgdir}/usr/lib"
  install -Dm755 "${srcdir}/build/_deps/eastdc-build/libEAStdC.so" "${pkgdir}/usr/lib"
  install -Dm755 "${srcdir}/build/_deps/eathread-build/libEAThread.so" "${pkgdir}/usr/lib"

  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/3RDPARTYLICENSES.TXT" "${pkgdir}/usr/share/licenses/${pkgname}/3RDPARTYLICENSES.TXT"
}
