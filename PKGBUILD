# Maintainer: Manuel Mendez <mmendez534@gmail.com>

pkgname=include-what-you-use
pkgver=0.13
pkgrel=1
_clang_major=9
_clang_minor=0
_clang_ver="${_clang_major}.${_clang_minor}"
pkgdesc="A tool for use with clang to analyze #includes in C and C++ source files"
url="http://include-what-you-use.org"
license=('LLVM Release License')
source=("https://github.com/${pkgname}/${pkgname}/archive/clang_${_clang_ver}.tar.gz")
sha512sums=('f2d6ba05121a9968da9e42e8ac66f83ca0f35bfbe7cb1d616e2c6479cf2833c4668cb86e46a04ffcd5e77f10a575da9eeee5272c7609b5afad555d79cb640fb4')
arch=('x86_64')
_min="${_clang_ver}"
_max=$((_clang_major+1)).0
depends=("clang>=${_min}" "clang<${_max}" 'python2')
makedepends=("clang>=${_min}" "clang<${_max}" "cmake" "llvm>=${_min}" "llvm<${_max}")
install=iwyu.install

build() {
  cd "${srcdir}/${pkgname}-clang_${_clang_ver}"

  rm -rf build && mkdir build && cd build
  cmake -DCMAKE_PREFIX_PATH=/usr/lib -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
  make
}

package() {
  cd "${srcdir}/${pkgname}-clang_${_clang_ver}/build"

  make install DESTDIR=${pkgdir}

  install -Dm755 ../fix_includes.py "${pkgdir}/usr/bin/iwyu-fix-includes"
  sed -i "s|^#!/usr/bin/python$|#!/usr/bin/python2|" "${pkgdir}/usr/bin/iwyu-fix-includes"
  rm -f "${pkgdir}/usr/bin/fix_includes.py"

  install -Dm755 ../iwyu_tool.py "${pkgdir}/usr/bin/iwyu-tool"
  sed -i "s|^#!/usr/bin/python$|#!/usr/bin/python2|" "${pkgdir}/usr/bin/iwyu-tool"
  rm -f "${pkgdir}/usr/bin/iwyu_tool.py"
}

# vim:set ts=2 sw=2 et:
