# Maintainer: Nathaniel Stickney <nstickney@gmail.com>
# Contributor: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>
# shellcheck disable=SC2034,SC2148,SC2154

pkgname=blast+
pkgver=2.7.1
pkgrel=2
pkgdesc="BLAST tool suite from NCBI (blastn, blastp, blastx, psiblast, etc)"
arch=('i686' 'x86_64')
url="http://blast.ncbi.nlm.nih.gov/"
license=('custom')
depends=('lmdb' 'lzo' 'pcre' 'python')
makedepends=('cpio')
conflicts=('blast' 'blast+-bin' 'ncbi-blast' 'cddlib' 'proj')
provides=('blast' 'blast+-bin''ncbi-blast')
replaces=('ncbi-blast')
source=("https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/$pkgver/ncbi-blast-$pkgver+-src.tar.gz")
sha512sums=('e4b3914f51165ae4c82051068ed9d3470687a4e0f1df6274018c0ba14b241666a570d72265c7d167b8ce2a9075652744244a00e3e95c00c4252da0fbd80d17c6')

prepare() {
    cd "$srcdir"/ncbi-blast-"$pkgver"+-src/c++ || exit
    ./configure \
        --prefix=/usr \
        --with-dll \
        --with-mt \
        --without-gnutls \
		--without-boost \
		--without-bdb
}

build() {
    cd "$srcdir"/ncbi-blast-"$pkgver"+-src/c++ || exit
    make
}

package() {
    cd "$srcdir"/ncbi-blast-"$pkgver"+-src/c++ || exit
    make prefix="$pkgdir"/usr install
    chmod +x "$pkgdir"/usr/lib/*.so
    install -d "$pkgdir"/usr/share/licenses/"$pkgname"
    echo 'public domain' > "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
