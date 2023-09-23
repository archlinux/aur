#!/hint/bash
# shellcheck disable=SC2034 disable=SC2154

# Maintainer: Michael Bolden Jnr / SM9(); <me@sm9.dev>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Manuel Mendez <mmendez534@gmail.com>

_pkgname="include-what-you-use"
pkgname="${_pkgname}-git"
pkgver=r1344.ca25529
pkgrel=1
pkgdesc="A tool for use with clang to analyze #includes in C and C++ source files"
arch=('any')
url="https://include-what-you-use.org/"
license=('LLVM Release License')
depends=('clang' 'python')
makedepends=('git' 'cmake' 'ninja')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=(
  "${_pkgname}::git+https://github.com/include-what-you-use/include-what-you-use.git"
)

sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}" || return 1
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" || return 1
}

prepare() {
  cd "${srcdir}/${_pkgname}" || return 1
  rm -rf build && mkdir -p build || return 1
}

build() {
  cd "${_pkgname}/build" || return 1

  CC=clang CXX=clang++ cmake \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_BUILD_TYPE=Release \
    -G "Ninja" .. || return 1

  ninja || return 1
}

package() {
  cd "${_pkgname}/build" || return 1

  DESTDIR="${pkgdir}" ninja install || return 1

  mv "${pkgdir}/usr/bin/fix_includes.py" "${pkgdir}/usr/bin/iwyu-fix-includes" || return 1
  mv "${pkgdir}/usr/bin/iwyu_tool.py" "${pkgdir}/usr/bin/iwyu-tool" || return 1
}
