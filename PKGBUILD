# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="step-writer"
pkgname="${_pkgname}-git"
pkgver=r32.0f64c02
pkgrel=1
pkgdesc="A simple & lightweight C++ TUI text editor"
arch=('any')
url="https://github.com/BrianAnakPintar/${_pkgname}"
license=('MIT')
makedepends=('git' 'cmake>=3.14' 'ftxui>=5.0.0' 'gtest')
depends=('glibc' 'gcc-libs' 'tree-sitter' 'tree-sitter-cpp')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${url}.git"
        "${_pkgname}_fix_cmakelists.patch")
sha256sums=('SKIP'
            'f7b5f37b838edce2cf1a182010ad32ea4b525a675e910d67446a4da013f68a12')

pkgver() {
  cd "${_pkgsrc}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -p1 -i "${srcdir}/${_pkgname}_fix_cmakelists.patch"
}

build() {
  cd "${srcdir}"
  cmake \
    -G 'Unix Makefiles' \
    -B "${_pkgsrc}/build" \
    -S "${_pkgsrc}" \
    -DCMAKE_BUILD_TYPE:STRING='None' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
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

  cd "${_pkgsrc}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
