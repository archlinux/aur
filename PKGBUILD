# Maintainer: Manuel Mendez <mmendez534@gmail.com>

pkgname=include-what-you-use
epoch=1
pkgver=0.8
pkgrel=3
pkgdesc="A tool for use with clang to analyze #includes in C and C++ source files"
url="http://include-what-you-use.org"
license=('LLVM Release License')
source=(http://include-what-you-use.org/downloads/include-what-you-use-$pkgver.src.tar.gz)
sha512sums=('f14e404e5d03f13022243db4707dbbeda43956b71018439b3d1d8fcf3f173c1706d1d8c2db413a85f979211b01edd59d2c34742ccb14d9e16e5b5ce51119d48b')
arch=('i686' 'x86_64')
_min=4
_max=$((_min+1))
depends=("clang>=$_min.0" "clang<$_max.0")
makedepends=("clang>=$_min.0" "clang<$_max.0" "cmake" "llvm>=$_min.0" "llvm<$_max.0")
optdepends=('python2')

build() {
    cd $srcdir/$pkgname

    rm -rf build && mkdir build && cd build
    cmake -DIWYU_LLVM_ROOT_PATH=/usr/lib -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
    make
}

package() {
    cd $srcdir/$pkgname/build

    make install DESTDIR=$pkgdir
    install -Dm755 ../fix_includes.py "${pkgdir}/usr/bin/iwyu-fix_includes.py"
    sed -i "s|^#!/usr/bin/python$|#!/usr/bin/python2|" "${pkgdir}/usr/bin/iwyu-fix_includes.py"
}

# vim:set ts=2 sw=2 et:
