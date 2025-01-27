# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="FTXUI"
pkgbase="${_Name,,}"
pkgname=("${pkgbase}"{,'-docs','-examples'})
pkgver=5.0.0
pkgrel=6
pkgdesc="A C++ Functional Terminal User Interface"
arch=('i686' 'x86_64')
url="https://github.com/ArthurSonzogni/${_Name}"
license=('MIT')
makedepends=('benchmark>=1.8.2' 'cmake>=3.12' 'doxygen' 'graphviz' 'gtest>=1.10')
_pkgsrc="${_Name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgbase}_build_docs_target_all.patch"
        "${pkgbase}_make_examples_installable.patch"
        "${pkgbase}_non-existent_include_path.patch::${url}/pull/817.patch?full_index=1")
b2sums=('aaf6060641c3f63814002fcba3c17ad7a0d3d0681bc2f31cec8e666b25e35c55a4f0fdd9e2855ea91e9e546edcc2cad2c172e8a06dbc55ed7caf9ce9178b2302'
        '6e06886a3d23764715d3c6e63d94a32c4474dc83387954c622380d268e4a63416b78258ad94da69863160bb0fc0ab9822848177f5a1df0239436ea142b76bbf0'
        'c7e9e43b5d9b7f3ad825a150afa3976743f4d22fb0a443da8ed636b2323dc70137ac471ec24127dfbfa1556646967687cb9890e893c9aa3315ff7c365715f596'
        '92e0cd5853dec21eaa8b02bccecdce7479f3786c07b845f9d33a8c29cada6195520d91a5080a5544c75da061f8ab1e08e1929878a22774b730ad585f130c47af')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgbase}_build_docs_target_all.patch"
  patch -Np1 -i "${srcdir}/${pkgbase}_make_examples_installable.patch"
  patch -Np1 -i "${srcdir}/${pkgbase}_non-existent_include_path.patch"
}

build() {
  export CXXFLAGS+=" -ffat-lto-objects"
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -DCMAKE_BUILD_TYPE:STRING='None'
    -DCMAKE_INSTALL_PREFIX:PATH='/usr'
    -DFTXUI_ENABLE_INSTALL:BOOL=ON
    -DFTXUI_BUILD_EXAMPLES:BOOL=ON
    -DFTXUI_BUILD_TESTS:BOOL=ON
    -DFTXUI_BUILD_DOCS:BOOL=ON
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

package_ftxui() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgbase}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"

  # examples
  cd "${pkgdir}/usr"
  rm -rf "bin"

  # docs
  cd "share/doc/${pkgbase}"
  rm -rf "html" "xml"
}

package_ftxui-docs() {
  pkgdesc+=" (documentation)"
  arch=('any')

  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build/doc"
}

package_ftxui-examples() {
  pkgdesc+=" (examples)"
  depends=('gcc-libs' 'glibc')

  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build/examples"
}
