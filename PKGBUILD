# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>
# Upstream tags nothing usable (`wf-reduce` is not a version), so pkgver is the
# pinned commit's date and _tag carries the commit itself. The only binary
# upstream builds is a demo (`test-mwf`), so this packages the library: the
# README's own recipe is to copy miniwfa.{c,h} and kalloc.{c,h} into your source.
# The Makefile's -march=native is dropped by overriding CFLAGS.

pkgname=miniwfa
_tag=66770a3c452d253ce3b6e400acc779b34af8b678
pkgver=20240522
pkgrel=1
pkgdesc="WaveFront Alignment algorithm with dual gap penalty for long diverged sequences"
arch=('x86_64')
url="https://github.com/lh3/miniwfa"
license=('MIT')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/${_tag}.tar.gz")
sha256sums=('520ca6d96541991364f3dacd5e9331429a295c493ec9cc5e2371477e79543a81')

build() {
    cd "$srcdir/$pkgname-$_tag"
    make CFLAGS="$CFLAGS -O3" test-mwf
    ar rcs libminiwfa.a miniwfa.o kalloc.o mwf-dbg.o
}

package() {
    cd "$srcdir/$pkgname-$_tag"
    install -Dm644 miniwfa.h "$pkgdir/usr/include/$pkgname/miniwfa.h"
    install -Dm644 kalloc.h "$pkgdir/usr/include/$pkgname/kalloc.h"
    install -Dm644 libminiwfa.a "$pkgdir/usr/lib/libminiwfa.a"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
