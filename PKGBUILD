# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

pkgname=cpotree-git
_srcname=CPotree
pkgver=1.0.r5.gdc13ad1
pkgrel=1
pkgdesc="Potree Utilities"
arch=('x86_64')
url="https://github.com/potree/CPotree"
license=('BSD-2-Clause')
makedepends=('git')
depends=('gcc-libs' 'glibc' 'brotli' 'laszip' 'onetbb')
source=("git+${url}.git")
b2sums=('SKIP')

build() {
    CXX="${CXX:=g++}"

    cd "$srcdir/$_srcname/src"
    $CXX -std=c++20 -I../include/ -I../modules -idirafter../libs executable_extract_area.cpp ../modules/unsuck/unsuck_platform_specific.cpp -lbrotlidec -llaszip -ltbb -o extract_area
    $CXX -std=c++20 -I../include/ -I../modules -idirafter../libs executable_extract_profile.cpp ../modules/unsuck/unsuck_platform_specific.cpp -lbrotlidec -llaszip -ltbb -o extract_profile
}

package() {

    cd "${srcdir}/${_srcname}"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm755 src/extract_area "$pkgdir"/usr/bin/extract_area
    install -Dm755 src/extract_profile "$pkgdir"/usr/bin/extract_profile
}

pkgver() {
    cd "${srcdir}/${_srcname}"
    git describe --long --abbrev=7 --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
