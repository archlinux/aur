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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sccn/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('23dee2f87cb55ca867c24a389ac6525c')


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
    install -Dm 755 $srcdir/$pkgname-$pkgver/build/liblsl.so.$pkgver $pkgdir/usr/lib/liblsl.so.$pkgver
    ln -rs -T $pkgdir/usr/lib/liblsl.so.$pkgver $pkgdir/usr/lib/liblsl.so
    patchelf --set-rpath /usr/lib $srcdir/$pkgname-$pkgver/build/lslver
    install -Dm 755 $srcdir/$pkgname-$pkgver/build/lslver $pkgdir/usr/bin/lslver
    install -Dm 755 $srcdir/$pkgname-$pkgver/include/lsl_c.h $pkgdir/usr/include/lsl_c.h
    install -Dm 755 $srcdir/$pkgname-$pkgver/include/lsl_cpp.h $pkgdir/usr/include/lsl_cpp.h
    install -Dm 644 $srcdir/$pkgname-$pkgver/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}