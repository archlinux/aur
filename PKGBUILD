# Maintainer: Manuel Mendez <mmendez534@gmail.com>

pkgname=include-what-you-use
pkgver=0.15
pkgrel=1
_clang_major=11
_clang_minor=0
_clang_ver="${_clang_major}.${_clang_minor}"
pkgdesc="A tool for use with clang to analyze #includes in C and C++ source files"
url="http://include-what-you-use.org"
license=('LLVM Release License')
source=("https://github.com/${pkgname}/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('db15efa9b92015322e9a188be6cf16a5c6fd71271c94fde45245676f2a8f6ffe4c7837e3b0bb5f9be6cbe78aab245129816a3b046c44c261a2b7ab5c3a9ea7b9')
arch=('x86_64')
_min="${_clang_ver}"
_max=$((_clang_major+1)).0
depends=("clang>=${_min}" "clang<${_max}" 'python2')
makedepends=("clang>=${_min}" "clang<${_max}" "cmake" "llvm>=${_min}" "llvm<${_max}")
install=iwyu.install

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  rm -rf build && mkdir build && cd build
  cmake -DCMAKE_PREFIX_PATH=/usr/lib -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"

  make install DESTDIR=${pkgdir}

  install -Dm755 ../fix_includes.py "${pkgdir}/usr/bin/iwyu-fix-includes"
  sed -i "s|^#!/usr/bin/python$|#!/usr/bin/python2|" "${pkgdir}/usr/bin/iwyu-fix-includes"
  rm -f "${pkgdir}/usr/bin/fix_includes.py"

  install -Dm755 ../iwyu_tool.py "${pkgdir}/usr/bin/iwyu-tool"
  sed -i "s|^#!/usr/bin/python$|#!/usr/bin/python2|" "${pkgdir}/usr/bin/iwyu-tool"
  rm -f "${pkgdir}/usr/bin/iwyu_tool.py"
}

# vim:set ts=2 sw=2 et:
