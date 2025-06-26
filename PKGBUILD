# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="openvdb"
_so="10"
pkgbase="${_basename}${_so}"
pkgname=("${pkgbase}"{,-libs})
pkgver=10.1.0
pkgrel=1
pkgdesc="A large suite of tools for the efficient storage and manipulation of sparse volumetric data discretized on three-dimensional grids (so-version ${_so})"
arch=('x86_64')
url="https://github.com/AcademySoftwareFoundation/${_basename}"
license=('MPL-2.0')
depends=('gcc-libs' 'glibc' 'imath' 'onetbb>=2020.2' 'log4cplus>=1.1.2')
makedepends=('blosc>=1.17' 'boost>=1.73' 'cmake>=3.18' 'jemalloc' 'mesa'
             'glfw' 'glu') # 'cppunit'
options=('!emptydirs')
_pkgsrc="${url##*/}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgbase}_boost_static_assert.patch")
sha512sums=('b1f36fb53ed9fcc65a59a764bb79b7bd0f8469649a70051023f9a8f5d2692f6c32a53c62fc78b7ab57ebda7dedea7b32450b62d90107119f5a30179a660536aa'
            'a9060e8c4906be8293a70e38b885815901ff6c9e160220389727e5108d7d622beffd01b4c6ce54dc459abe0c2271ea7a085c5d6d6563e8a4a61f61092ed0458a')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgbase}_boost_static_assert.patch"
}

build() {
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D CMAKE_INSTALL_INCLUDEDIR:PATH="include/${pkgbase}"
    -D CMAKE_INSTALL_LIBDIR:PATH="lib/${pkgbase}"
    -D OPENVDB_BUILD_PYTHON_MODULE:BOOL=OFF
    -D OPENVDB_BUILD_UNITTESTS:BOOL=OFF
    -D OPENVDB_BUILD_DOCS:BOOL=OFF
    -D OPENVDB_CORE_STATIC:BOOL=OFF
    -D USE_LOG4CPLUS:BOOL=ON
    -D USE_IMATH_HALF:BOOL=ON
  )

  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"
}

# check() {
#   local excluded_tests=""
#   local ctest_flags=(
#     --test-dir "${_pkgsrc}/build"
#     --output-on-failure
#     --parallel "$(nproc)"
#     --exclude-regex "$excluded_tests"
#   )
# 
#   cd "${srcdir}"
#   ctest "${ctest_flags[@]}"
# }

package_openvdb10() {
  depends+=("${pkgbase}-libs=${pkgver}-${pkgrel}" 'jemalloc')
  optdepends=('glfw: for tools'
              'glu: for tools')

  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgbase}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"

  cd "${pkgdir}/usr"
  find "lib" -type f,l -name 'lib*.so*' -delete

  for file in bin/*; do
    mv "${file}" "${file}${_so}"
  done
}

package_openvdb10-libs() {
  pkgdesc+=" (runtime libraries)"
  depends+=('blosc>=1.17' 'boost-libs>=1.73' 'zlib>=1.2.7')
  provides=("lib${_basename}.so")

  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${pkgdir}"
  find . -type f,l ! -name 'lib*.so*' -delete

  cd "usr/lib/${pkgbase}"
  for lib in lib*.so.*; do
    ln -sf "/usr/lib/${pkgbase}/${lib}" "${pkgdir}/usr/lib/${lib}"
  done
}
