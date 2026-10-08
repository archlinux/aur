# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>
# FermiKit ships as a self-contained `fermi.kit` directory: the pipeline scripts
# locate their helper binaries (bwa, ropebwt2, htsbox, bfc, seqtk, trimadap-mt,
# k8) relative to their own path, so the kit is installed as a unit and the two
# documented entry points are exposed through exec wrappers that keep that path.
# lh3's code is MIT; the kit bundles bwa, which is GPL-3.0, hence the aggregate.

pkgname=fermikit
pkgver=0.13
pkgrel=1
pkgdesc="De novo assembly based variant calling pipeline for Illumina short reads"
arch=('x86_64')
url="https://github.com/lh3/fermikit"
license=('MIT' 'GPL-3.0-or-later')
depends=('glibc' 'perl' 'zlib')
makedepends=('git')
source=(
    "fermikit::git+${url}.git#tag=v${pkgver}"
    "bfc::git+https://github.com/lh3/bfc.git#commit=a73dad248dc56d9d4d22eacbbbc51ac276045168"
    "bwa::git+https://github.com/lh3/bwa.git#commit=eb428d7d31ced059ad39af2701a22ebe6d175657"
    "fermi2::git+https://github.com/lh3/fermi2.git#commit=ee4c2349b387e628e402f6daa5815ca5c2e12fbf"
    "hapdip::git+https://github.com/lh3/hapdip.git#commit=84c851465f609cbb324009e5a7a7ae1774719c4a"
    "htsbox::git+https://github.com/lh3/htsbox.git#commit=7db14a0a83a64cc3a23820bd029802f298fabe7b"
    "ropebwt2::git+https://github.com/lh3/ropebwt2.git#commit=e23a7df263571c02aa0c0434e623108482097e3d"
    "seqtk::git+https://github.com/lh3/seqtk.git#commit=5e1e8dbd506ea1ff8c77d468a1f27b8e8f73eac0"
    "trimadap::git+https://github.com/lh3/trimadap.git#commit=b8eb2f4fee84180d1d4af4929af1571f8cb3c53d"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
    cd "$srcdir/fermikit"
    # the submodule checkouts come from the git sources above
    for sub in bfc bwa fermi2 hapdip htsbox ropebwt2 seqtk trimadap; do
        rm -rf "$sub"
        mkdir -p "$sub"
        cp -a "$srcdir/$sub/." "$sub/"
        rm -rf "$sub/.git"
    done
}

build() {
    cd "$srcdir/fermikit"
    # htsbox's ksort.h helpers are static inline and go missing when LTO is on;
    # ropebwt2's rle.h defines rle_auxtab rather than declaring it extern, which
    # GCC 10+ rejects without the old common-symbol behaviour.
    export CFLAGS="${CFLAGS//-flto=auto/}"
    make CFLAGS="$CFLAGS -fcommon"
}

package() {
    cd "$srcdir/fermikit"
    install -d "$pkgdir/usr/lib/$pkgname"
    cp -a fermi.kit "$pkgdir/usr/lib/$pkgname/fermi.kit"
    install -d "$pkgdir/usr/bin"
    for prog in fermi2.pl run-calling; do
        printf '#!/bin/sh\nexec /usr/lib/fermikit/fermi.kit/%s "$@"\n' "$prog" \
            > "$pkgdir/usr/bin/$prog"
        chmod 755 "$pkgdir/usr/bin/$prog"
    done
    # lh3's own code is MIT (the kit ships no LICENSE file); the grant is the
    # MIT block in the klib headers the tools bundle
    awk 'NR==1,/^\*\//' "$srcdir/fermi2/kseq.h" > LICENSE
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
