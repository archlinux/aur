# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>
# Upstream tags nothing, so pkgver is the pinned commit's date and _tag carries
# the commit itself. The only program upstream builds is the benchmark driver
# `test-u85`; the Makefile's -march=native is dropped by overriding CFLAGS.

pkgname=editdist-u85
_tag=520d850697b25562b16e4a9c097f1d5321b51223
pkgver=20220421
pkgrel=1
pkgdesc="Fast implementation of Ukkonen's O(ND) algorithm for computing edit distance"
arch=('x86_64')
url="https://github.com/lh3/editdist-U85"
license=('MIT')
depends=('glibc' 'zlib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lh3/editdist-U85/archive/${_tag}.tar.gz")
sha256sums=('801d240b9118c586cdbaadac28d2771f74bea1b33cf99cba92953b09ecba534e')

build() {
    cd "$srcdir/editdist-U85-$_tag"
    # main.c uses the uint32_t/uint64_t types without including <stdint.h>
    make CFLAGS="$CFLAGS -include stdint.h"
}

package() {
    cd "$srcdir/editdist-U85-$_tag"
    install -Dm755 test-u85 "$pkgdir/usr/bin/test-u85"
    # upstream ships no LICENSE file; the grant is the MIT block in kseq.h
    awk 'NR==1,/^\*\//' kseq.h > LICENSE
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
