# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: orumin <dev at orum.in>

_Name="OpenEXR"
_name="${_Name,,}"
pkgname="lib32-${_name}"
pkgver=3.3.3
_api="${pkgver%.*}"
pkgrel=1
pkgdesc="A high dynamic-range image file format library (32-bit)"
arch=('x86_64')
url="https://www.openexr.com"
_url="https://github.com/AcademySoftwareFoundation/${_name}"
license=('BSD-3-Clause')
depends=("${_name}>=${pkgver}" 'lib32-gcc-libs' 'lib32-glibc' 'lib32-imath'
         'lib32-libdeflate')
makedepends=('cmake>=3.14')
provides=("lib${_Name}"{,Core,Util}"-${_api//./_}.so" "libIex-${_api//./_}.so"
          "libIlmThread-${_api//./_}.so")
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${_name}_atomic_pointer_size.patch::${_url}/pull/2013.patch?full_index=1")
sha256sums=('0ffbd842a7ee2128d44affdea30f42294b4061293cde3aa75b61a53573413d1e'
            'd9a12153da19ea50314272a4d5b71768c629552d1f64cae70dacc0ba55424129')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${_name}_atomic_pointer_size.patch"
}

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -Wno-dev
    -DCMAKE_BUILD_TYPE:STRING='None'
    -DCMAKE_INSTALL_PREFIX:PATH='/usr'
    -DCMAKE_INSTALL_LIBDIR='lib32'
    -DBUILD_TESTING:BOOL=ON
    -DOPENEXR_BUILD_LIBS:BOOL=ON
    -DOPENEXR_BUILD_TOOLS:BOOL=OFF
    -DOPENEXR_BUILD_EXAMPLES:BOOL=OFF
    -DOPENEXR_INSTALL_DOCS:BOOL=OFF
    -DBUILD_WEBSITE:BOOL=OFF
    -DOPENEXR_BUILD_PYTHON:BOOL=OFF
  )
  
  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"
}

check() {
  local excluded_tests='OpenEXR\.Iex|OpenEXRCore\.testDWATable|OpenEXRCore\.test.*Compression'
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
}
