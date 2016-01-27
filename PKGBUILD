pkgname=cen64-git
pkgver=20160127
pkgrel=1
pkgdesc="Cycle-accurate Nintendo 64 emulator"
arch=('i686' 'x86_64')
url="http://www.cen64.com/"
license=('BSD')
depends=('mesa' 'openal')
makedepends=('cmake')
source=("git://git.cen64.com/cen64.git#branch=angrylion-rdp")
sha256sums=('SKIP')

pkgver() {
    cd cen64

    git log -1 --format="%cd" --date=short | sed 's|-||g'
}

prepare() {
    mkdir -p build

    # Build with different sampling frequency
    # See: http://forums.cen64.com/viewtopic.php?f=6&t=186&start=20#p2085
    sed -i 's/44100/31985/g' cen64/ai/context.c cen64/ai/controller.c
}

build() {
    # Change to whichever matches your CPU architecture
    # Select between "SSE2", "SSSE3", "SSE4.1", "AVX"
    _arch_support="SSSE3"

    # Enable busy-wait-detection for better performance
    _wait_loop="ON"

    cd build

    cmake ../cen64 \
        -DCMAKE_BUILD_TYPE=Release \
        -DCEN64_ARCH_SUPPORT=${_arch_support} \
        -DVR4300_BUSY_WAIT_DETECTION=${_wait_loops}

    make
}

package() {
    cd build

    install -Dm755 cen64 "$pkgdir/usr/bin/cen64"
    install -Dm644 ../cen64/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
