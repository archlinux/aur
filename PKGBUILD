# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

pkgname=cpotree
_srcname=CPotree
pkgver=1.0
pkgrel=1
pkgdesc="Potree Utilities"
arch=('x86_64')
url="https://github.com/potree/CPotree"
license=('BSD-2-Clause')
makedepends=('git')
depends=('gcc-libs' 'glibc' 'brotli' 'laszip' 'onetbb')
source=("$pkgname-$pkgver.tar.gz::https://github.com/potree/${_srcname}/archive/refs/tags/${pkgver}.tar.gz"
       "https://github.com/potree/${_srcname}/blob/master/LICENSE")
b2sums=('2ed8be18c353bee5d52a371af9ca59961446087ee3b7883e6416f26b1f81bd6d0f445f8fb8bf6534cc6d295856fb326ed4ff60619ced8d3a063aa12c057f95d1'
        'bdd31962cc0c595cd0bda268a9e291420b3e9e2c314dda9ebd7a7dba3b20f661cef8530c31aeafde8a3de6a5ebb6e00b416a1f32735e22c5a6f535fd8c28870d')

build() {
    CXX="${CXX:=g++}"

    cd "$srcdir/$_srcname-$pkgver/src"
    $CXX -std=c++20 -I../include/ -I../modules -idirafter../libs executable_extract_area.cpp ../modules/unsuck/unsuck_platform_specific.cpp -lbrotlidec -llaszip -ltbb -o extract_area
    $CXX -std=c++20 -I../include/ -I../modules -idirafter../libs executable_extract_profile.cpp ../modules/unsuck/unsuck_platform_specific.cpp -lbrotlidec -llaszip -ltbb -o extract_profile
}

package() {
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cd "$srcdir/$_srcname-$pkgver/src"
    install -Dm755 extract_area "$pkgdir"/usr/bin/extract_area
    install -Dm755 extract_profile "$pkgdir"/usr/bin/extract_profile
}
