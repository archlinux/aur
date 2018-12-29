pkgname=xmr-stak
pkgver=2.7.1
pkgrel=0
pkgdesc="Unified All-in-one Monero miner (no cuda)"
arch=('x86_64')
url="https://github.com/fireice-uk/xmr-stak"
license=('GPL3')
makedepends=('git' 'cmake' 'opencl-headers')
depends=('libmicrohttpd' 'openssl' 'hwloc' 'ocl-icd')
source=("xmr-stak-$pkgver.tar.gz::https://github.com/fireice-uk/xmr-stak/archive/$pkgver.tar.gz"
        'no-donate.patch'
	'xmr-stak.service')
sha256sums=('f03ceaba6ae69fd91360578637f65bff12b5ea24d54d3f8db3a186231c29938e'
            'b279c373afbce7cc8610c44f69a5e29a4b36969d131e2fd47229211a3903912a'
            'e0cbee0dab1c730e5deff31eddef84a635b4c9f33ba2368a446e62acc084649a')

prepare() {
    cd "$srcdir/xmr-stak-$pkgver"
    patch -Np1 -i $srcdir/no-donate.patch
}

build() {
    cd "$srcdir/xmr-stak-$pkgver"
    cmake . \
	-DCUDA_ENABLE=OFF \
	-DCMAKE_BUILD_TYPE=Plain
    make VERBOSE=1
}

package() {
    cd "$srcdir/xmr-stak-$pkgver"

    install -D -m755 "bin/xmr-stak" -t "$pkgdir/usr/bin/"
    install -D -m644 "bin/libxmrstak_opencl_backend.so" -t "$pkgdir/usr/lib"

    install -m755 -d ${pkgdir}/usr/lib/systemd/system
    install -m644  $startdir/xmr-stak.service ${pkgdir}/usr/lib/systemd/system

    install -m755 -d ${pkgdir}/etc/xmr-stak
}
