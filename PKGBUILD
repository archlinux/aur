# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgbase="ftxui"
pkgname=(
  "${pkgbase}"
  "${pkgbase}-docs"
  "${pkgbase}-examples"
)
pkgver=7.0.0
pkgrel=2
pkgdesc="A C++ Functional Terminal User Interface"
arch=(
  'i686'
  'x86_64'
)
url="https://github.com/ArthurSonzogni/FTXUI"
license=(
  'MIT'
)
makedepends=(
  # 'benchmark>=1.8.2'
  'cmake>=3.12'
  'doxygen'
  'graphviz'
  # 'gtest>=1.10'
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
  "${pkgbase}_build_docs_target_all.patch"
  "${pkgbase}_make_examples_installable.patch"
)
b2sums=('73bcba72f3ad52818d8a6d1647b7e8bff4259fbd5713db409c147f0d8f44b1895727d27389b3db797dda78a4a61271bb19396c7c108bf0fd7a56b68eae306151'
        'bf9e78066ff1721f857350f9dcce6fa8ac17cfc2bb726afc6c7f75cc372832f7212cc4ad7eccefe6aa9eee72fff46958c63f485452f45dcd7b1b77b1c2b408fe'
        'c7e9e43b5d9b7f3ad825a150afa3976743f4d22fb0a443da8ed636b2323dc70137ac471ec24127dfbfa1556646967687cb9890e893c9aa3315ff7c365715f596')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgbase}_build_docs_target_all.patch"
  patch -Np1 -i "${srcdir}/${pkgbase}_make_examples_installable.patch"
}

build() {
  export CXXFLAGS+=" -ffat-lto-objects"
  local cmake_options=(
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -G 'Unix Makefiles'
    -W no-dev
    -D BUILD_SHARED_LIBS:BOOL=ON
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D FTXUI_ENABLE_INSTALL:BOOL=ON
    -D FTXUI_BUILD_EXAMPLES:BOOL=ON
    -D FTXUI_BUILD_TESTS:BOOL=OFF
    -D FTXUI_BUILD_DOCS:BOOL=ON
  )
  
  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${cmake_options[1]}"
}

# check() {
#   local ctest_exclude_regex=""
#   local ctest_options=(
#     --test-dir "${_pkgsrc}/build"
#     --output-on-failure
#     --parallel "$(nproc)"
#     --exclude-regex "${ctest_exclude_regex}"
#   )

#   cd "${srcdir}"
#   ctest "${ctest_options[@]}"
# }

package_ftxui() {
  depends=(
    'glibc'
    'libgcc'
    'libstdc++'
  )

  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -vDm644 "CHANGELOG.md" "README.md" -t "${pkgdir}/usr/share/doc/${pkgbase}"
  install -vDm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgbase}"

  # examples
  cd "${pkgdir}/usr"
  rm -rf "bin"

  # docs
  cd "share/doc/${pkgbase}"
  rm -rf "html" "xml"
}

package_ftxui-docs() {
  pkgdesc+=" (documentation)"
  arch=(
    'any'
  )

  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build/doc"
}

package_ftxui-examples() {
  pkgdesc+=" (examples)"
  depends=(
    "${pkgbase}>=${pkgver}-${pkgrel}"
    'glibc'
    'libgcc'
    'libstdc++'
  )

  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build/examples"
}
