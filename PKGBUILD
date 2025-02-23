# Maintainer:  Samuel Fernando Mesa Giraldo <samuelmesa@linuxmail.org>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: James Duley <jagduley gmail>
# Contributor: A. Weiss <adam [at] archlinux.us>

_Name="osgEarth"
pkgbase="${_Name,,}"
pkgname=("${pkgbase}"{,'-docs'})
pkgver=3.7
pkgrel=1
pkgdesc="A terrain rendering toolkit for OpenSceneGraph"
arch=('aarch64' 'i686' 'x86_64')
url="https://www.pelicanmapping.com/home-1/opensource"
_url="https://github.com/gwaldron/${pkgbase}"
license=('LGPL-3.0-only')
makedepends=('cmake>=3.1' 'curl' 'doxygen' 'gcc-libs' 'gdal' 'geos' 'glew'
             'glibc' 'lerc' 'libgl' 'libwebp' 'meshoptimizer' 'openscenegraph'
             'protobuf' 'python-sphinx-markdown-tables' 'python-myst-parser'
             'rapidjson' 'spdlog' 'sqlite')
_pkgsrc="${pkgbase}-${pkgbase}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/${pkgbase}-${pkgver}.tar.gz"
        "${pkgbase}_build_imgui_guess.patch::${_url}/commit/8e2693f631269762592d6ced61c2af886a1eafbb.patch?full_index=1"
        "${pkgbase}_optional_fastdxt.patch"
        "${pkgbase}_unbundle.patch"
        "${pkgbase}_link_lerc.patch"
        "${pkgbase}_cmake_install_paths.patch"
        "${pkgbase}_disable_osgdb_zip.patch")
b2sums=('6fd461fbb8818a974c5ac5e4195574886e58f33554cc98948dcf114349cce2309e25c44c6aae582fceae29de72d93fb500fd67782672635beb0f3a2943816e3e'
        'a817ce6c51585f124db2764a421e25082b7b5da76795127fd2ace1edf8ca7ab5310f367e4c96dd95ecd8fa199867208c4b4dd01c959936d9448bce2db13ddff1'
        'ab656dfd2de1e1b3a291f38098ff2443a6d4461a26d2a1b4adca3d351fb97f2507145e13b83057d05a65047c4214f34c94f75cd6397bd328fd42bebf620d541a'
        'e493e05367befdc963a3561bfd04f5b25fc04c02fa3aeb7a7bcecc48945369c22ff91f2b049e36209b95c7f10a06ab68d1607ce23e23a1475eb37b0193ee33e8'
        'c1f8f84d6e9477a26489e55a743cb727fbe327c5d472d35a7b58292db6d2312002a277b3c4ed8986f5b89106a544f8e203da25f682678c2b22a3c7eb9be9b0dd'
        'f6cc7f557777d556f0685dd5e39468602cc8440de24143b1d02aeb8a9e64826714c665cfb25704ba412952b1aa75f3b8f40b8bbf957f203b5152e95b40580b53'
        '315ff78798b092bce0fb3805bb76cd5d3eff78c20464551b23d38e8eacb81973dd55230059095a7e7a2f1ed2fec2131e2ac631d3c9a32374b44e136eed31b8b0')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgbase}_build_imgui_guess.patch"
  patch -Np1 -i "${srcdir}/${pkgbase}_optional_fastdxt.patch"
  patch -Np1 -i "${srcdir}/${pkgbase}_unbundle.patch"
  patch -Np1 -i "${srcdir}/${pkgbase}_link_lerc.patch"
  patch -Np1 -i "${srcdir}/${pkgbase}_cmake_install_paths.patch"
  patch -Np1 -i "${srcdir}/${pkgbase}_disable_osgdb_zip.patch"

  sed -i 's/set(CMAKE_CXX_STANDARD 14)/set(CMAKE_CXX_STANDARD 17)/' 'CMakeLists.txt'
}

build() {
  export CXXFLAGS+=" -Wno-error=format-security"
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -DCMAKE_BUILD_TYPE:STRING='None'
    -DCMAKE_INSTALL_PREFIX:PATH='/usr'
    -DCMAKE_INSTALL_LIBDIR:STRING='lib'
    -DOSGEARTH_INSTALL_SHADERS:BOOL=ON
    -DOSGEARTH_BUILD_TESTS:BOOL=ON
    -Wno-dev
  )
  # Disable fastdxt driver on non x86 arches, requires x86 intrinsics
  if [[ "${CARCH}" != "x86_64" && ! "${CARCH}" =~ ^i[3-6]86$ ]]; then
    cmake_options+=(-DDISABLE_FASTDXT=ON)
  fi

  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  make -C docs html
  rm -f docs/build/html/.buildinfo
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

package_osgearth() {
  depends=('curl' 'gcc-libs' 'gdal' 'geos' 'glew' 'glibc' 'lerc' 'libgl'
           'libwebp' 'meshoptimizer' 'openscenegraph' 'protobuf' 'spdlog'
           'sqlite')
  provides=("lib${_Name}"{,'ImGui'}'.so')

  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"
  
  cd "${_pkgsrc}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${pkgbase}/README.md"
  install -vDm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"

  find "data" "tests" -type f -exec \
    install -Dm644 "{}" "${pkgdir}/usr/share/${_Name}/{}" \;
}

package_osgearth-docs() {
  pkgdesc+=" (documentation)"
  arch=('any')

  cd "${srcdir}/${_pkgsrc}/docs/build"
  find "html" -type f -exec \
    install -vDm644 "{}" "${pkgdir}/usr/share/doc/${pkgbase}/{}" \;
}
