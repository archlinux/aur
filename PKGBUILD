# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="hclang"
pkgname="${_pkgname}-git"
pkgver=r82.4b54855
pkgrel=1
pkgdesc="A Holy C compiler. Targets LLVM."
arch=('x86_64')
url="https://github.com/Ma11ock/holyc"
license=('AGPL-3.0-or-later')
makedepends=('cmake>=3.20' 'git' 'llvm>=14')
depends=('fmt' 'gcc-libs' 'glibc' 'llvm-libs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="holyc"
source=("${_pkgsrc}::git+${url}.git"
        "${_pkgname}_use_system_deps.patch"
        "${_pkgname}_fix_llvm_cpp.patch")
sha256sums=('SKIP'
            '9902113e41800e5b968251fe96bb4a53d5a96f02037fd45b070cd157d94e5abd'
            'eaf4582a7731c9684044c21541777a30ca6e1353898ce8e671c6a2a15b5b80a8')

pkgver() {
  cd "${_pkgsrc}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  for _patch in "${srcdir}/${_pkgname}"*".patch"; do
    patch -p1 -i "${_patch}"
  done

  find . -type f \( -name "*.cpp" -o -name "*.hpp" -o -name "*.h" -o -name "*.cxx" \) -exec sed -i 's/struct fmt::formatter/struct formatter/g' {} +
  find . -type f \( -name "*.cpp" -o -name "*.hpp" -o -name "*.h" -o -name "*.cxx" \) -exec sed -i 's|#include <llvm/Support/Host.h>|#include <llvm/TargetParser/Host.h>|g' {} +
}

build() {
  cd "${srcdir}"
  cmake \
    -G 'Unix Makefiles' \
    -B "${_pkgsrc}/build" \
    -S "${_pkgsrc}" \
    -DCMAKE_BUILD_TYPE:STRING='None' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -DNO_HCLANG_TESTS:BOOL=YES \
    -Wno-dev
  cmake --build "${_pkgsrc}/build"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -Dm644 "README.org" "${pkgdir}/usr/share/doc/${pkgname}/README.org"
  install -Dm644 "LICENSE"    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
