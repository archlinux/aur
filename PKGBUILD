pkgname=xmr-stak-rx
pkgver=1.0.5
pkgrel=1
pkgdesc="Unified All-in-one Monero miner (no cuda)"
arch=('x86_64')
url="https://github.com/fireice-uk/xmr-stak"
license=('GPL3')
makedepends=('git' 'cmake')
depends=('libmicrohttpd' 'openssl' 'hwloc' 'ocl-icd')
source=("$pkgname-$pkgver.tar.gz::https://github.com/fireice-uk/xmr-stak/archive/$pkgver-rx.tar.gz"
	'xmr-stak-rx.service')
sha256sums=('3f343527593bb9182c94a9af33edfacb23f42e255ac01edf516ac6b4d85bf12f'
            'SKIP')

build() {
    cd "$srcdir/xmr-stak-$pkgver-rx"
    rm -rf build
    mkdir build
    cd build
    cmake .. \
	-DCUDA_ENABLE=OFF \
	-DCMAKE_BUILD_TYPE=Plain
    make VERBOSE=1
}

package() {
    cd "$srcdir/xmr-stak-$pkgver-rx/build"

    install -D -m755 "bin/xmr-stak-rx" -t "$pkgdir/usr/bin/"

    install -m755 -d ${pkgdir}/usr/lib/systemd/system
    install -m644  $startdir/xmr-stak-rx.service ${pkgdir}/usr/lib/systemd/system

    install -m755 -d ${pkgdir}/etc/xmr-stak-rx
}
