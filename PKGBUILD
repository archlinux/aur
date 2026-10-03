pkgname=xmr-stak-rx
pkgver=1.0.5
pkgrel=3
pkgdesc="Unified All-in-one Monero miner (no cuda)"
arch=('x86_64')
url="https://github.com/fireice-uk/xmr-stak"
license=('GPL3')
makedepends=('git' 'cmake')
depends=('libmicrohttpd' 'openssl' 'hwloc' 'ocl-icd')
source=("$pkgname-$pkgver.tar.gz::https://github.com/fireice-uk/xmr-stak/archive/$pkgver-rx.tar.gz"
	'xmr-stak-rx.service')
sha256sums=('3f343527593bb9182c94a9af33edfacb23f42e255ac01edf516ac6b4d85bf12f'
            '4ba5eee405dc990a00422db0da78e7d71f3f4de89890ecdc2e848ffb622577f8')

prepare() {
    cd "$srcdir/xmr-stak-$pkgver-rx"
    # FILE is no longer provided transitively by standard library headers.
    sed -i '/include <mutex>/i #include <cstdio>' xmrstak/misc/console.hpp
    # Current system headers define MAP_HUGE_2MB and MAP_HUGE_1GB macros.
    sed -i 's/MAP_HUGE_2MB/huge_page_2mb/g; s/MAP_HUGE_1GB/huge_page_1gb/g' \
        xmrstak/backend/cpu/crypto/common/VirtualMemory_unix.cpp
}

build() {
    cd "$srcdir/xmr-stak-$pkgver-rx"
    rm -rf build
    mkdir build
    cd build
    cmake .. \
	-DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
	-DCUDA_ENABLE=OFF \
	-DMICROHTTPD_ENABLE=OFF \
	-DCMAKE_BUILD_TYPE=Plain
    make VERBOSE=1
}

package() {
    cd "$srcdir/xmr-stak-$pkgver-rx/build"

    install -D -m755 "bin/xmr-stak-rx" -t "$pkgdir/usr/bin/"

    install -m755 -d ${pkgdir}/usr/lib/systemd/system
    install -m644  "$srcdir/xmr-stak-rx.service" ${pkgdir}/usr/lib/systemd/system

    install -m755 -d ${pkgdir}/etc/xmr-stak-rx
}
