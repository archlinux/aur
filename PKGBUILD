pkgname=xmr-stak-nvidia
pkgver=2.10.8
pkgrel=1
pkgdesc="Unified All-in-one Monero miner with CUDA support"
arch=('x86_64')
url="https://github.com/fireice-uk/xmr-stak"
license=('GPL3')
makedepends=('git' 'cmake' 'opencl-headers')
depends=('libmicrohttpd' 'openssl' 'hwloc' 'ocl-icd')
conflicts=('xmr-stak' 'xmr-stak-cpu-git' 'xmr-stak-git' 'xmr-stak-nvidia-git' 'xmr-stak-opencl-amd')
source=("xmr-stak-$pkgver.tar.gz::https://github.com/fireice-uk/xmr-stak/archive/$pkgver.tar.gz"
        'no-donate.patch'
        'cuda-11.patch'
        'httpd-daemon-casting-fix.patch'
	'xmr-stak.service')
sha256sums=('bbbf85dc35a8b0b8ae5926640e36ef0b68a8a81804d45f11718c19bf53a41109'
            'b279c373afbce7cc8610c44f69a5e29a4b36969d131e2fd47229211a3903912a'
            '814c3e82526500e4834c5787e5c1fbaa35a23a6e571274c523af2e0e7d1f7e23'
            'a87d010b81befaab360259e55dd998b57305646dea1097a8090b4d2ed6dbc8bb'
            'e0cbee0dab1c730e5deff31eddef84a635b4c9f33ba2368a446e62acc084649a'
            )

prepare() {
    cd "$srcdir/xmr-stak-$pkgver"
    for src in "${source[@]}"; do
        src="${src%%::*}"
        src="${src##*/}"
        [[ $src = *.patch ]] || continue
        echo "Applying patch $src..."
        patch -Np1 --binary < "../$src"
    done
}

build() {
    cd "$srcdir/xmr-stak-$pkgver"
    cmake . \
	-DCUDA_ENABLE=ON \
	-DCMAKE_BUILD_TYPE=Plain
    make VERBOSE=1
}

package() {
    cd "$srcdir/xmr-stak-$pkgver"

    install -D -m755 "bin/xmr-stak" -t "$pkgdir/usr/bin/"
    install -D -m644 "bin/libxmrstak_cuda_backend.so" -t "$pkgdir/usr/lib"
    install -D -m644 "bin/libxmrstak_opencl_backend.so" -t "$pkgdir/usr/lib"

    install -m755 -d ${pkgdir}/usr/lib/systemd/system
    install -m644  $startdir/xmr-stak.service ${pkgdir}/usr/lib/systemd/system

    install -m755 -d ${pkgdir}/etc/xmr-stak
}
