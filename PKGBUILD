# $Id: PKGBUILD 72029 2012-06-06 11:58:40Z svenstaro $
# Maintainer: Mihails Strasuns <public@dicebot.lv>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=lib32-liblphobos
groups=('dlang' 'dlang-ldc')
provides=("d-runtime" "d-stdlib")
replaces=("lib32-liblphobos-devel")
pkgver=0.15.1
pkgrel=1
pkgdesc="D standard library (libphobos) for LDC compiler (32-bit)"
arch=('x86_64')
url="https://github.com/ldc-developers/ldc"
license=('BSD')
depends=('ldc' 'lib32-curl' 'lib32-gcc-libs')
makedepends=('git' 'llvm' 'libconfig' 'cmake')
source=("git://github.com/ldc-developers/ldc.git#tag=v$pkgver")
md5sums=("SKIP")
options=("staticlibs")

build() {
    cd "$srcdir"/ldc

    git submodule update --init --recursive

    mkdir build && cd build
    cmake \
    -DMULTILIB=ON \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DINCLUDE_INSTALL_DIR=/usr/include/dlang/ldc \
    -DBUILD_SHARED_LIBS=ON \
    ..

    make
}

package() {
	cd "$srcdir"/ldc

    # licenses
    install -D -m644 "$srcdir/ldc/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # We don't want anything but the 32-bit libs
    install -D -m644 $srcdir/ldc/build/lib32/libphobos2-ldc.so $pkgdir/usr/lib32/liblphobos2.so
    install -D -m644 $srcdir/ldc/build/lib32/libdruntime-ldc.so $pkgdir/usr/lib32/libldruntime.so
    install -D -m644 $srcdir/ldc/build/lib32/libphobos2-ldc-debug.so $pkgdir/usr/lib32/liblphobos2-debug.so
    install -D -m644 $srcdir/ldc/build/lib32/libdruntime-ldc-debug.so $pkgdir/usr/lib32/libldruntime-debug.so
}
