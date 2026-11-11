# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=pangene
_pkgname=pangene
pkgver=1.1
pkgrel=1
pkgdesc="Pangenome gene graph construction from protein-to-genome alignments"
arch=('x86_64' 'aarch64')
url="https://github.com/lh3/$_pkgname"
license=('MIT')
depends=('glibc' 'zlib')
optdepends=('miniprot: generate protein-to-genome alignments'
            'k8: gene graph analysis with pangene.js')
# v1.1 omits LICENSE.txt; the shipped copy is the upstream MIT license,
# blob cb0d5c2aa23862c2f4227252fac1f1f18200b68c.
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'LICENSE')
sha256sums=('9fbb6faa4d53b1e163a186375ca01bbac4395aa4c88d1ca00d155e751fb89cf8'
            '1a9cb163c73ee434a815ff7d894c2812aca5943f1f7d1741d4b55cf04ff741ab')

build() {
    cd "$_pkgname-$pkgver"
    make CFLAGS="$CFLAGS -std=c99" CPPFLAGS="$CPPFLAGS" LIBS="$LDFLAGS -lpthread -lz -lm"
}

check() {
    cd "$_pkgname-$pkgver"
    ./pangene test/C4/*.paf.gz > "$srcdir/C4.gfa"
    awk -F '\t' '$1 == "S" { segments++ } $1 == "L" { links++ }
        END { exit !(segments > 0 && links > 0) }' "$srcdir/C4.gfa"
}

package() {
    cd "$_pkgname-$pkgver"
    install -Dm755 pangene "$pkgdir/usr/bin/pangene"
    install -Dm755 pangene.js "$pkgdir/usr/bin/pangene.js"
    install -Dm644 pangene.1 "$pkgdir/usr/share/man/man1/pangene.1"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
