# Maintainer: Manuel Mendez <mmendez534@gmail.com>

pkgname=include-what-you-use
epoch=1
pkgver=0.9
pkgrel=2
_clang_major=5
_clang_minor=0
_clang_ver="$_clang_major.$_clang_minor"
pkgdesc="A tool for use with clang to analyze #includes in C and C++ source files"
url="http://include-what-you-use.org"
license=('LLVM Release License')
source=("https://github.com/include-what-you-use/include-what-you-use/archive/clang_${_clang_ver}.tar.gz")
sha512sums=('9d4a9717a3a3f6752f8bdd1392b6d7a5e8b8dc277ef46a50f24185a089360380e1da92a61fd150598843f5c24cff03e74bc674e57579960d977acde755e34c52')
arch=('i686' 'x86_64')
_min="${_clang_ver}"
_max=$((_clang_major+1)).0
depends=("clang>=$_min" "clang<$_max")
makedepends=("clang>=$_min" "clang<$_max" "cmake" "llvm>=$_min" "llvm<$_max")
optdepends=('python2')

build() {
    cd "$srcdir/$pkgname-clang_${_clang_ver}"

    rm -rf build && mkdir build && cd build
    cmake -DIWYU_LLVM_ROOT_PATH=/usr/lib -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
    make
}

package() {
    cd "$srcdir/$pkgname-clang_${_clang_ver}/build"

    make install DESTDIR=$pkgdir
    install -Dm755 ../fix_includes.py "${pkgdir}/usr/bin/iwyu-fix_includes.py"
    sed -i "s|^#!/usr/bin/python$|#!/usr/bin/python2|" "${pkgdir}/usr/bin/iwyu-fix_includes.py"
}

# vim:set ts=2 sw=2 et:
