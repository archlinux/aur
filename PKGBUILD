# Maintainer: rpkak <rpkak@users.noreply.github.com>
pkgname='libblake3'
pkgver=1.3.1
pkgrel=2
epoch=
pkgdesc="the C implementations of the BLAKE3 cryptographic hash function"
arch=('x86_64')
url="https://blake3.io/"
license=('Apache')
groups=()
depends=(glibc)
makedepends=()
checkdepends=()
optdepends=()
provides=(libblake3.so)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/BLAKE3-team/BLAKE3/archive/refs/tags/$pkgver.tar.gz"
        'blake3.pc')
sha256sums=('112becf0983b5c83efff07f20b458f2dbcdbd768fd46502e7ddd831b83550109'
            'db63c95000ed37e145c0e8c82097c66aa6779753edf2cdf5eab586382da917f4')
validpgpkeys=()

build() {
    cd "BLAKE3-$pkgver/c"
    CC="${CC:-cc}"
    $CC $CFLAGS $LDFLAGS -Wl,-soname,"libblake3.so.$(echo $pkgver | sed 's/\..*//')" -shared -o libblake3.so.$pkgver blake3.c blake3_dispatch.c blake3_portable.c blake3_sse2_x86-64_unix.S blake3_sse41_x86-64_unix.S blake3_avx2_x86-64_unix.S blake3_avx512_x86-64_unix.S
}

package() {
    install -Dm644 "BLAKE3-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 "BLAKE3-$pkgver/c/libblake3.so.$pkgver" "$pkgdir/usr/lib/libblake3.so.$pkgver"
    ln -rs "$pkgdir/usr/lib/libblake3.so.$pkgver" "$pkgdir/usr/lib/libblake3.so.$(echo $pkgver | sed 's/\..*//')"
    ln -rs "$pkgdir/usr/lib/libblake3.so.$pkgver" "$pkgdir/usr/lib/libblake3.so"
    install -Dm644 "BLAKE3-$pkgver/c/blake3.h" "$pkgdir/usr/include/blake3.h"
    install -Dm644 "BLAKE3-$pkgver/c/blake3_impl.h" "$pkgdir/usr/include/blake3_impl.h"
    install -Dm644 "blake3.pc" "$pkgdir/usr/lib/pkgconfig/blake3.pc"
}
