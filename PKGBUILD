# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: darkprof <darkprof83@gmail.com>
# Contributor: asuka minato

pkgname=lib32-gtest
pkgver=1.18.0
pkgrel=1
pkgdesc="Google Test - C++ testing utility based on the xUnit framework (like JUnit)"
arch=(x86_64)
url="https://github.com/google/googletest"
license=(BSD)
depends=("gtest>=${pkgver}" lib32-glibc lib32-gcc-libs)
makedepends=(cmake)
options=(!buildflags staticlibs !strip)
source=("gtest-${pkgver}.tar.gz::https://github.com/google/googletest/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('ba0f5769ccf34acf1bc72d1f7e9ffb8202176d02b64f6f3d9047accfc0cf9026ff5a653d24935e2705fff8709566676452616c93ca0ca6277f1e21d79b58a10a')

build() {
  cd "googletest-${pkgver}"
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_SKIP_RPATH=ON \
    -Dgtest_disable_pthreads=ON \
    -DCMAKE_CXX_FLAGS=-m32 \
    -DCMAKE_SHARED_LINKER_FLAGS=-m32 \
    -DBUILD_GMOCK=ON \
    .
  cmake --build .
}

package() {
  cd "googletest-${pkgver}"

  mkdir -pm 0755 "${pkgdir}/usr/lib32"
  install -m 644 lib/libgmock{,_main}.so "${pkgdir}"/usr/lib32
  install -m 644 lib/libgtest{,_main}.so "${pkgdir}"/usr/lib32
  install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
