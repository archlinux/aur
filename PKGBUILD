pkgname=cen64-git
pkgver=20150102
pkgrel=1
pkgdesc="Cycle-accurate Nintendo 64 simulator"
arch=('i686' 'x86_64')
url="http://www.cen64.com/"
license=('BSD')
depends=('mesa')
makedepends=('cmake')

_gitroot='git://git.cen64.com/cen64.git'
_gitname='cen64'

build() {
    cd "$srcdir"
    git clone "$_gitroot"
    cd "$_gitname"

    sed -i 's/CEN64_ARCH_SUPPORT "SSE2"/CEN64_ARCH_SUPPORT "SSSE3"/g' CMakeLists.txt
    #sed -i 's/CEN64_ARCH_SUPPORT "SSE2"/CEN64_ARCH_SUPPORT "SSE4.1"/g' CMakeLists.txt
    #sed -i 's/CEN64_ARCH_SUPPORT "SSE2"/CEN64_ARCH_SUPPORT "AVX"/g' CMakeLists.txt

    # Enable busy-wait-detection for better performance
    sed -i 's/wait loops?" OFF/wait loops?" ON/g' CMakeLists.txt

    cmake -D CMAKE_BUILD_TYPE=Release CMakeLists.txt
    make
}

package() {
    cd "$srcdir/$_gitname"
    install -Dm755 "cen64" "$pkgdir/usr/bin/cen64"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
