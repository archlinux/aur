pkgname=cen64-git
pkgver=20160112
pkgrel=1
pkgdesc="Cycle-accurate Nintendo 64 simulator"
arch=('i686' 'x86_64')
url="http://www.cen64.com/"
license=('BSD')
depends=('mesa' 'openal')
makedepends=('cmake')

_gitroot='git://git.cen64.com/cen64.git'
_gitname='cen64'

build() {
    cd "$srcdir"
    git clone "$_gitroot"
    cd "$_gitname"

    # Checkout angrylion-rdp branch (This will get most commercial games running)
    git checkout angrylion-rdp

    # Build with different sampling frequency
    # See: http://forums.cen64.com/viewtopic.php?f=6&t=186&start=20#p2085
    sed -i 's/44100/31985/g' ai/context.c ai/controller.c

    # Uncomment whichever matches your CPU architecture
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
