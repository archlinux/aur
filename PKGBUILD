pkgname=cen64-git
pkgver=r941.f703120
pkgrel=1
epoch=1
pkgdesc="Cycle-accurate Nintendo 64 emulator"
arch=('i686' 'x86_64')
url="http://www.cen64.com/"
license=('BSD')
depends=('mesa' 'openal')
makedepends=('cmake')
source=("git+https://github.com/tj90241/cen64.git")
sha256sums=('SKIP')

pkgver() {
    cd cen64

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p build
}

build() {
    # Change to whichever matches your CPU architecture
    # Select between "SSE2", "SSSE3", "SSE4.1", "AVX"
    if [[ `cat /proc/cpuinfo | grep avx | wc -l` -gt 0 ]]; then
        _arch_support="AVX"
    elif [[ `cat /proc/cpuinfo | grep sse4_1 | wc -l` -gt 0 ]]; then
        _arch_support="SSE4.1"
    elif [[ `cat /proc/cpuinfo | grep ssse3 | wc -l` -gt 0 ]]; then
        _arch_support="SSSE3"
    else
        _arch_support="SSE2"
    fi

    # Enable busy-wait-detection for better performance
    _detect_wait_loops="ON"

    cd build

    cmake ../cen64 \
        -DCMAKE_BUILD_TYPE=Release \
        -DCEN64_ARCH_SUPPORT=${_arch_support} \
        -DVR4300_BUSY_WAIT_DETECTION=${_detect_wait_loops}

    make
}

package() {
    cd build

    install -Dm755 cen64 "$pkgdir/usr/bin/cen64"
    install -Dm644 ../cen64/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
