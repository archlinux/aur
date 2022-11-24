# Maintainer: rpkak <rpkak@users.noreply.github.com>
pkgname='libblake3'
pkgver=1.3.2
pkgrel=3
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
sha256sums=('31c1033009c55fdacafc87e0aaecf9e136fed3ccec6c637ed2461e487240b7da'
            '68d07c33c44fddb6f06b7eb006fce82f541daed8c73dffd74ed6b7747839b42d')
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
    install -Dm644 "blake3.pc" "$pkgdir/usr/lib/pkgconfig/blake3.pc"
}
