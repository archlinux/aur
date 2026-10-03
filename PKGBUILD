pkgname=xmr-stak
pkgver=2.10.8
pkgrel=3
pkgdesc="Cryptocurrency miner for legacy CryptoNight algorithms (no CUDA)"
arch=('x86_64')
url="https://github.com/fireice-uk/xmr-stak"
license=('GPL3')
makedepends=('git' 'cmake' 'opencl-headers')
depends=('libmicrohttpd' 'openssl' 'hwloc' 'ocl-icd')
source=("xmr-stak-$pkgver.tar.gz::https://github.com/fireice-uk/xmr-stak/archive/$pkgver.tar.gz"
        'no-donate.patch'
	'xmr-stak.service')
sha256sums=('bbbf85dc35a8b0b8ae5926640e36ef0b68a8a81804d45f11718c19bf53a41109'
            'b279c373afbce7cc8610c44f69a5e29a4b36969d131e2fd47229211a3903912a'
            'e0cbee0dab1c730e5deff31eddef84a635b4c9f33ba2368a446e62acc084649a')

prepare() {
    cd "$srcdir/xmr-stak-$pkgver"
    patch -Np1 -i "$srcdir/no-donate.patch"
    # FILE is no longer provided transitively by standard library headers.
    sed -i '/include <mutex>/i #include <cstdio>' xmrstak/misc/console.hpp
}

build() {
    cd "$srcdir/xmr-stak-$pkgver"
    cmake . \
	-DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
	-DCUDA_ENABLE=OFF \
	-DMICROHTTPD_ENABLE=OFF \
	-DCMAKE_BUILD_TYPE=Plain
    make VERBOSE=1
}

package() {
    cd "$srcdir/xmr-stak-$pkgver"

    install -D -m755 "bin/xmr-stak" -t "$pkgdir/usr/bin/"
    install -D -m644 "bin/libxmrstak_opencl_backend.so" -t "$pkgdir/usr/lib"

    install -m755 -d ${pkgdir}/usr/lib/systemd/system
    install -m644  "$srcdir/xmr-stak.service" ${pkgdir}/usr/lib/systemd/system

    install -m755 -d ${pkgdir}/etc/xmr-stak
}
