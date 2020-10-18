# Maintainer: Marc Vidal <mvidaldp@gmail.com>

pkgname="liblsl"
pkgver=1.13.1
pkgrel=1
pkgdesc="C++ lsl library for multi-modal time-synched data transmission over the local network (stable release)"
arch=('x86_64')
url="https://github.com/sccn/liblsl/"
license=('MIT')
provides=($pkgname)
conflicts=($pkgname)
depends=('gcc-libs')
makedepends=('git' 'cmake' 'patchelf')
source=("${pkgname}-${pkgver}::git+ssh://git@github.com/sccn/liblsl.git#tag=${pkgver}")
md5sums=('SKIP')


prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p build
}

build() {
    cd "$srcdir/$pkgname-$pkgver/build"
    cmake .. -DLSL_NO_FANCY_LIBNAME=ON
    make
}

package() {
    mkdir -p $pkgdir/opt/LSL/bin
    mkdir -p $pkgdir/opt/LSL/include
    mkdir -p $pkgdir/opt/LSL/lib
    mkdir -p $pkgdir/opt/LSL/share/licenses
    install -Dm 755 $srcdir/$pkgname-$pkgver/build/$pkgname.so.$pkgver $pkgdir/usr/lib/$pkgname.so.$pkgver
    ln -rs -T $pkgdir/usr/lib/$pkgname.so.$pkgver $pkgdir/usr/lib/$pkgname.so
    ln -rs -T $pkgdir/usr/lib/$pkgname.so $pkgdir/opt/LSL/lib/$pkgname.so.$pkgver
    ln -rs -T $pkgdir/opt/LSL/lib/$pkgname.so.$pkgver $pkgdir/opt/LSL/lib/$pkgname.so
    install -Dm 755 $srcdir/$pkgname-$pkgver/build/LSLConfig.cmake $pkgdir/opt/LSL/LSLConfig.cmake
    install -Dm 755 $srcdir/$pkgname-$pkgver/build/LSLTargets.cmake $pkgdir/opt/LSL/LSLTargets.cmake
    install -Dm 755 $srcdir/$pkgname-$pkgver/build/LSLCMake.cmake $pkgdir/opt/LSL/LSLCMake.cmake
    install -Dm 755 $srcdir/$pkgname-$pkgver/build/LSLConfigVersion.cmake $pkgdir/opt/LSL/LSLConfigVersion.cmake
    install -Dm 755 $srcdir/$pkgname-$pkgver/build/CPackConfig.cmake $pkgdir/opt/LSL/CPackConfig.cmake
    install -Dm 755 $srcdir/$pkgname-$pkgver/build/CPackSourceConfig.cmake $pkgdir/opt/LSL/CPackSourceConfig.cmake
    patchelf --set-rpath /usr/lib $srcdir/$pkgname-$pkgver/build/lslver
    install -Dm 755 $srcdir/$pkgname-$pkgver/build/lslver $pkgdir/usr/bin/lslver
    ln -rs -T $pkgdir/usr/bin/lslver $pkgdir/opt/LSL/bin/lslver
    install -Dm 755 $srcdir/$pkgname-$pkgver/include/lsl_c.h $pkgdir/usr/include/lsl_c.h
    ln -rs -T $pkgdir/usr/include/lsl_c.h $pkgdir/opt/LSL/include/lsl_c.h
    install -Dm 755 $srcdir/$pkgname-$pkgver/include/lsl_cpp.h $pkgdir/usr/include/lsl_cpp.h
    ln -rs -T $pkgdir/usr/include/lsl_cpp.h $pkgdir/opt/LSL/include/lsl_cpp.h
    install -Dm 644 $srcdir/$pkgname-$pkgver/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
    ln -rs -T $pkgdir/usr/share/licenses/$pkgname/LICENSE $pkgdir/opt/LSL/share/licenses/LICENSE
}