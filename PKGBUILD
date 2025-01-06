# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="FTXUI"
_name="${_Name,,}"
pkgname="lib32-${_name}"
pkgver=5.0.0
pkgrel=1
pkgdesc="A C++ Functional Terminal User Interface (32-bit)"
arch=('x86_64')
url="https://github.com/ArthurSonzogni/${_Name}"
license=('MIT')
depends=("${_name}")
makedepends=('cmake>=3.12' 'lib32-benchmark>=1.8.2' 'lib32-gtest>=1.10')
_pkgsrc="${_Name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${_name}_remove_non-existent_include_path.patch::https://sources.debian.org/data/main/${_name::1}/${_name}/${pkgver}-2/debian/patches/remove-non-existent-include-path.diff")
b2sums=('aaf6060641c3f63814002fcba3c17ad7a0d3d0681bc2f31cec8e666b25e35c55a4f0fdd9e2855ea91e9e546edcc2cad2c172e8a06dbc55ed7caf9ce9178b2302'
        '09ff76b33069c1e3670331eac32a09487974e5230b41f62005661a1333080eb4ed71abf70a00ab65d0412005948744e60d6581d402cae3336b93f137d42b0167')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${_name}_remove_non-existent_include_path.patch"
}

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
    -DFTXUI_ENABLE_INSTALL:BOOL=ON \
    -DFTXUI_BUILD_EXAMPLES:BOOL=OFF \
    -DFTXUI_BUILD_TESTS:BOOL=ON \
    -DFTXUI_BUILD_DOCS:BOOL=OFF \
    -Wno-dev
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
