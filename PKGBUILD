# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>
# run-dipcall resolves its helpers (k8, htsbox, paftools.js, dipcall-aux.js and
# the PAR BED files) relative to its own path, so the kit is installed as a
# directory and exposed through an exec wrapper that keeps that path. k8 and
# htsbox wrappers exec the packaged binaries. paftools.js is taken from the
# minimap2 release matching the pinned version.

pkgname=dipcall
pkgver=0.3
pkgrel=1
pkgdesc="Reference-based variant calling pipeline for diploid assemblies"
arch=('any')
url="https://github.com/lh3/dipcall"
license=('MIT')
depends=('bedtk' 'htsbox' 'k8-bin' 'minimap2' 'perl' 'samtools')
optdepends=('winnowmap: mapping with a repetitive k-mer list (-W)')
source=("dipcall-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "paftools.js::https://raw.githubusercontent.com/lh3/minimap2/v2.31/misc/paftools.js")
sha256sums=('d7f711105abc24346c03b8b082adb1427462646c5aed5dd7f48712ab6d1991c3'
            'c788e2e41b7fe6f2df05f2d4bb8dbb7b4fc5c42a1759e7666b7b2f7ffca8fd8f')

package() {
    cd "$srcdir/dipcall-$pkgver"
    install -d "$pkgdir/usr/lib/$pkgname"
    install -m755 run-dipcall "$pkgdir/usr/lib/$pkgname/run-dipcall"
    install -m644 dipcall-aux.js "$pkgdir/usr/lib/$pkgname/dipcall-aux.js"
    install -m644 "$srcdir/paftools.js" "$pkgdir/usr/lib/$pkgname/paftools.js"
    install -m644 data/*.bed "$pkgdir/usr/lib/$pkgname/"
    for helper in k8 htsbox; do
        printf '#!/bin/sh\nexec /usr/bin/%s "$@"\n' "$helper" \
            > "$pkgdir/usr/lib/$pkgname/$helper"
        chmod 755 "$pkgdir/usr/lib/$pkgname/$helper"
    done
    install -d "$pkgdir/usr/bin"
    printf '#!/bin/sh\nexec /usr/lib/dipcall/run-dipcall "$@"\n' \
        > "$pkgdir/usr/bin/run-dipcall"
    chmod 755 "$pkgdir/usr/bin/run-dipcall"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
