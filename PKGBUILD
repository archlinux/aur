# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

_srcname=CPotree
pkgname=cpotree
pkgver=1.0
pkgrel=3
pkgdesc="Potree Utilities"
arch=('x86_64')
url="https://github.com/potree/CPotree"
license=('BSD-2-Clause')
depends=('brotli' 'gcc-libs' 'glibc' 'laszip' 'onetbb')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/potree/${_srcname}/archive/refs/tags/${pkgver}.tar.gz"
    "https://raw.githubusercontent.com/potree/CPotree/refs/heads/master/LICENSE"
)
b2sums=('2ed8be18c353bee5d52a371af9ca59961446087ee3b7883e6416f26b1f81bd6d0f445f8fb8bf6534cc6d295856fb326ed4ff60619ced8d3a063aa12c057f95d1'
        'da028b49a05d83d53d78226f4efff515576d6004d5ed07b72b204f7fb30e6b5c7e071b965eafee839e7be8d0070fd693aa22df480933e3519655b50a558938c5')

build() {
    cd "$srcdir/$_srcname-$pkgver/src"

    CXX="${CXX:=g++}"

    $CXX -std=c++20 -I../include/ -I../modules -idirafter../libs executable_extract_area.cpp ../modules/unsuck/unsuck_platform_specific.cpp -lbrotlidec -llaszip -ltbb -o extract_area
    $CXX -std=c++20 -I../include/ -I../modules -idirafter../libs executable_extract_profile.cpp ../modules/unsuck/unsuck_platform_specific.cpp -lbrotlidec -llaszip -ltbb -o extract_profile
}

package() {
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cd "$srcdir/$_srcname-$pkgver/src"

    install -Dm755 extract_area "$pkgdir"/usr/bin/extract_area
    install -Dm755 extract_profile "$pkgdir"/usr/bin/extract_profile
}
