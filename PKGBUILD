# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

pkgname=cpotree
_srcname=CPotree
pkgver=1.0
pkgrel=2
pkgdesc="Potree Utilities"
arch=('x86_64')
url="https://github.com/potree/CPotree"
license=('BSD-2-Clause')
depends=('gcc-libs' 'glibc' 'brotli' 'laszip' 'onetbb')
conflicts=('cpotree-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/potree/${_srcname}/archive/refs/tags/${pkgver}.tar.gz"
       "https://github.com/potree/${_srcname}/blob/master/LICENSE")
b2sums=('2ed8be18c353bee5d52a371af9ca59961446087ee3b7883e6416f26b1f81bd6d0f445f8fb8bf6534cc6d295856fb326ed4ff60619ced8d3a063aa12c057f95d1'
        '0dc2dc0f814a5ffe7eabbec6029b740fe9a53e37b53b336b911c3a32fd96050a299c1ba7e6e61e389a9a075050162ea462c72b9dbb84fca03a7a898aa35bf67a')

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
