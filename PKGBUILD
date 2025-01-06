# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Michał Janiszewski <janisozaur+aur@gmail.com>
# Contributor: Philipp Claßen <philipp.classen@posteo.de>

_name="benchmark"
pkgname="lib32-${_name}"
pkgver=1.9.1
pkgrel=1
pkgdesc="A microbenchmark support library (32-bit)"
arch=('x86_64')
url="https://github.com/google/${_name}"
license=('Apache-2.0')
depends=("${_name}" 'lib32-gcc-libs' 'lib32-glibc')
makedepends=('cmake>=3.13')
provides=("lib${_name}"{,'_main'}'.so')
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz")
sha256sums=('32131c08ee31eeff2c8968d7e874f3cb648034377dfc32a4c377fa8796d84981')

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${srcdir}"
  cmake \
    -G 'Unix Makefiles' \
    -B "${_pkgsrc}/build" \
    -S "${_pkgsrc}" \
    -DCMAKE_BUILD_TYPE:STRING='None' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -DCMAKE_INSTALL_LIBDIR='lib32' \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DBENCHMARK_ENABLE_LTO:BOOL=ON \
    -DBENCHMARK_ENABLE_GTEST_TESTS:BOOL=OFF \
    -Wno-dev
    # -DBENCHMARK_ENABLE_GTEST_TESTS:BOOL=ON \
    # -DGOOGLETEST_PREFIX:PATH='/usr/src/googletest' \
    # -DGOOGLETEST_PATH:PATH='/usr/src/googletest' \
  cmake --build "${_pkgsrc}/build"
}

check() {
  cd "${srcdir}"
  ctest --test-dir "${_pkgsrc}/build" --output-on-failure --stop-on-failure
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"
}
