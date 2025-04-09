# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: GordonGR <ntheo1979@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org> 
# Contributor: said <atvordhosbn[at]gmail[dot]com>

_name="libcue"
pkgname="lib32-${_name}"
pkgver=2.3.0
pkgrel=2
pkgdesc="Parses so-called cue sheets and handles the parsed data (32-bit)"
url="https://github.com/lipnitsk/${_name}"
arch=('x86_64')
license=('GPL-2.0-only')
depends=('lib32-glibc' "${_name}>=${pkgver}")
makedepends=('cmake' 'lib32-gcc-libs')
provides=("${_name}.so")
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('fe2c39cc9794ac36c0706405e0432bab23228d343ba4e3395220d5b2a2ebf8b3c97e71d76a628f9144977c0dd56636f78d0c2d1f9f2b0d4068a837a258f035b6')

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -DCMAKE_BUILD_TYPE:STRING='None'
    -DCMAKE_INSTALL_PREFIX:PATH='/usr'
    -DCMAKE_INSTALL_LIBDIR=/usr/lib32
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    -DBUILD_SHARED_LIBS=ON
    -Wno-dev
  )

  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"
}

check() {
  local excluded_tests=""
  local ctest_flags=(
    --test-dir "${_pkgsrc}/build"
    --output-on-failure
    --parallel $(nproc)
    --exclude-regex "${excluded_tests}"
  )

  cd "${srcdir}"
  ctest "${ctest_flags[@]}"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"

#cd "${pkgdir}/usr/lib32/pkgconfig"
#sed -i 's|includedir=${prefix}/include|includedir=${prefix}/include/libcue/|' libcue.pc
#sed -i 's|libdir=${prefix}/lib|libdir=${prefix}/lib32|' libcue.pc
}
