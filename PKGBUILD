# Maintainer: WillyPillow <wp at nerde period pw>
# Contributor: Javier Tia <javier dot tia at gmail dot com>
# Contributor: Manuel Mendez <mmendez534@gmail.com>

_pkgbase=include-what-you-use
pkgname="$_pkgbase-clang13-git"
pkgver=r1091.fbd921d
pkgrel=1
_clang_major=13
_clang_minor=0
_clang_ver="${_clang_major}.${_clang_minor}"
pkgdesc="A tool for use with clang to analyze #includes in C and C++ source files - clang_13 git branch"
url="http://include-what-you-use.org"
license=('LLVM Release License')
source=("$_pkgbase::git+https://github.com/include-what-you-use/include-what-you-use#branch=clang_13")
sha512sums=('SKIP')
arch=('x86_64')
_min="${_clang_ver}"
_max=$((_clang_major + 1)).0
depends=("clang>=${_min}" "clang<${_max}" 'python3')
makedepends=("cmake" "llvm>=${_min}" "llvm<${_max}" "ninja" "git")
install=iwyu.install

pkgver() {
  cd "$srcdir/$_pkgbase"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgbase}"
  rm -rf build && mkdir build && cd build
  cmake -G "Ninja" ../
  ninja
}

package() {
  cd "${srcdir}/${_pkgbase}/build"

  DESTDIR="${pkgdir}" ninja install

  install -Dm755 ../fix_includes.py "${pkgdir}/usr/bin/iwyu-fix-includes"
  install -Dm755 ../iwyu_tool.py "${pkgdir}/usr/bin/iwyu-tool"

  # ninja
  mv "${pkgdir}/usr/local/bin/include-what-you-use" "${pkgdir}/usr/bin/include-what-you-use"
  mv "${pkgdir}/usr/local/share" "${pkgdir}/usr"
  rm -f "${pkgdir}/usr/local/bin/fix_includes.py"
  rm -f "${pkgdir}/usr/local/bin/iwyu_tool.py"
  rmdir "${pkgdir}/usr/local/bin"
  rmdir "${pkgdir}/usr/local"
}

# vim:set ts=2 sw=2 et:
