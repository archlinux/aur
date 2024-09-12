# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgbase="ftxui"
pkgname=("${pkgbase}" "${pkgbase}-docs" "${pkgbase}-examples")
pkgver=5.0.0
pkgrel=4
pkgdesc="A C++ Functional Terminal User Interface"
arch=('any')
url="https://github.com/ArthurSonzogni/${pkgbase^^}"
license=('MIT')
makedepends=('benchmark>=1.8.2' 'cmake>=3.12' 'doxygen' 'graphviz' 'gtest>=1.10')
_pkgsrc="${pkgbase^^}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "${pkgbase}_make_examples_installable.patch::https://sources.debian.org/data/main/${pkgbase::1}/${pkgbase}/${pkgver}-2/debian/patches/make-examples-installable.diff"
        "${pkgbase}_build_docs_target_all.patch::https://sources.debian.org/data/main/${pkgbase::1}/${pkgbase}/${pkgver}-2/debian/patches/build-docs-with-library.diff"
        "${pkgbase}_remove_non-existent_include_path.patch::https://sources.debian.org/data/main/${pkgbase::1}/${pkgbase}/${pkgver}-2/debian/patches/remove-non-existent-include-path.diff")
b2sums=('aaf6060641c3f63814002fcba3c17ad7a0d3d0681bc2f31cec8e666b25e35c55a4f0fdd9e2855ea91e9e546edcc2cad2c172e8a06dbc55ed7caf9ce9178b2302'
        'c7e9e43b5d9b7f3ad825a150afa3976743f4d22fb0a443da8ed636b2323dc70137ac471ec24127dfbfa1556646967687cb9890e893c9aa3315ff7c365715f596'
        '6e06886a3d23764715d3c6e63d94a32c4474dc83387954c622380d268e4a63416b78258ad94da69863160bb0fc0ab9822848177f5a1df0239436ea142b76bbf0'
        '09ff76b33069c1e3670331eac32a09487974e5230b41f62005661a1333080eb4ed71abf70a00ab65d0412005948744e60d6581d402cae3336b93f137d42b0167')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  for _patch in "${srcdir}/${pkgbase}"*".patch"; do
    patch -p1 -i "${_patch}"
  done
}

build() {
  cd "${srcdir}"
  cmake \
    -G 'Unix Makefiles' \
    -B "${_pkgsrc}/build" \
    -S "${_pkgsrc}" \
    -DCMAKE_BUILD_TYPE:STRING='None' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -DFTXUI_ENABLE_INSTALL:BOOL=ON \
    -DFTXUI_BUILD_EXAMPLES:BOOL=ON \
    -DFTXUI_BUILD_TESTS:BOOL=ON \
    -DFTXUI_BUILD_DOCS:BOOL=ON \
    -Wno-dev
  cmake --build "${_pkgsrc}/build"
}

check() {
  cd "${srcdir}"
  ctest --test-dir "${_pkgsrc}/build" --output-on-failure --stop-on-failure
}

package_ftxui() {
  arch=('x86_64')

  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgbase}/README.md"
  install -Dm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"

  cd "${pkgdir}/usr"
  rm -rf "bin" "share/doc/${pkgbase}/html" "share/doc/${pkgbase}/xml"
}

package_ftxui-docs() {
  pkgdesc+=" (documentation)"

  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build/doc"
}

package_ftxui-examples() {
  pkgdesc+=" (examples)"
  arch=('x86_64')
  depends=('gcc-libs' 'glibc')

  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build/examples"
}
