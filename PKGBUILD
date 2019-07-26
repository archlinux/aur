# Maintainer: Andrea Pascal <andrea@anodium.net>

pkgname='liblsl-git'
_pkgname=${pkgname%-git}
pkgver=b9.r5.g4d74da4f
_pkgver=1.13.0
pkgrel=1
pkgdesc="C++ lsl library for multi-modal time-synched data transmission over the local network"
arch=('x86_64')
url="https://github.com/sccn/labstreaminglayer/"
license=('MIT')
provides=($_pkgname)
conflicts=($_pkgname)
depends=('gcc-libs')
makedepends=('git' 'cmake' 'patchelf')
source=("$_pkgname::git+https://github.com/sccn/liblsl.git")
sha384sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$_pkgname"
    mkdir -p build
}

build() {
    cd "$srcdir/$_pkgname/build"
    cmake .. -DLSL_NO_FANCY_LIBNAME=ON
    make
}

package() {
    install -Dm 755 $srcdir/$_pkgname/build/liblsl.so.$_pkgver $pkgdir/usr/lib/liblsl.so.$_pkgver
    ln -rs -T $pkgdir/usr/lib/liblsl.so.$_pkgver $pkgdir/usr/lib/liblsl.so

    patchelf --set-rpath /usr/lib $srcdir/$_pkgname/build/lslver
    install -Dm 755 $srcdir/$_pkgname/build/lslver $pkgdir/usr/bin/lslver

    install -Dm 755 $srcdir/$_pkgname/include/lsl_c.h $pkgdir/usr/include/lsl_c.h
    install -Dm 755 $srcdir/$_pkgname/include/lsl_cpp.h $pkgdir/usr/include/lsl_cpp.h

    install -Dm 644 $srcdir/$_pkgname/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
