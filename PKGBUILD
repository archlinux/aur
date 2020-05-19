# Maintainer: Manuel Mendez <mmendez534@gmail.com>

pkgname=include-what-you-use
pkgver=0.14
pkgrel=1
_clang_major=10
_clang_minor=0
_clang_ver="${_clang_major}.${_clang_minor}"
pkgdesc="A tool for use with clang to analyze #includes in C and C++ source files"
url="http://include-what-you-use.org"
license=('LLVM Release License')
source=("https://github.com/${pkgname}/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('e54a7c7e3a6d3e0de7c263d1f26b373d95b8fab5f1f7e76f52d80341bda2bad0fb12238a325dc1e2f6d3ab5e6d8e0b4ed60b5a19dc82e06d480bcb461f9aefba')
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
