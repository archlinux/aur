# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="bertini2"
pkgname="${_pkgname}-git"
_commit="d21f2b3cbd93cd6dbae9b9306b8d7b0e765a5a91" # 2.0alpha8
pkgver=2.0alpha8.r111.735bd7f
pkgrel=1
pkgdesc="The redevelopment of Bertini in C++"
arch=('x86_64')
url="https://github.com/bertiniteam/b2"
license=('custom:GPL-3.0-or-later WITH Bertini2-Additional-GPL-Terms')
depends=('boost-libs>=1.83' 'gcc-libs' 'glibc'  'gmp' 'libmpc' 'mpfr')
makedepends=('boost>=1.83' 'cmake>=3.22' 'eigen>=3.3' 'git')
optdepends=('python-pybertini: Python interface support')
provides=("${_pkgname}=${pkgver%%.r*}" "libbertini2.so")
conflicts=("${_pkgname}")
_pkgsrc="b2"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  local rev_count=$(git rev-list --count "${_commit}..HEAD")
  local short_hash=$(git rev-parse --short=7 HEAD)

  cd "core/include/${_pkgname}"
  local version=$(sed -nE 's/^#define PACKAGE_VERSION "([^"]+)"/\1/p' "version.hpp" | tr -d '-')

  printf "%s.r%s.%s" "${version}" "${rev_count}" "${short_hash}"
}

prepare() {
  cd "${srcdir}/${_pkgsrc}/core"
  sed -i 's/add_library(bertini2 /add_library(bertini2 SHARED /' "CMakeLists.txt"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  cmake \
    -G 'Unix Makefiles' \
    -B "core/build" \
    -S "core" \
    -DCMAKE_BUILD_TYPE:STRING='None' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -Wno-dev
  cmake --build "core/build"
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   ctest --test-dir "core/build" --stop-on-failure --output-on-failure
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="${pkgdir}" cmake --install "core/build"

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"

  cd "core"
  # install -vDm644 "NEWS"    "${pkgdir}/usr/share/doc/${_pkgname}/NEWS"
  install -vDm644 "AUTHORS" "${pkgdir}/usr/share/doc/${_pkgname}/AUTHORS"
  install -vDm644 "COPYING" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
  install -vDm644 "ADDITIONAL_GPL_TERMS" "${pkgdir}/usr/share/licenses/${_pkgname}/ADDITIONAL_GPL_TERMS"
}
