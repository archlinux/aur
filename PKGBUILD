# Maintainer: Nathaniel Stickney <nstickney@gmail.com>
# Contributor: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>
# shellcheck disable=SC2034,SC2148,SC2154

pkgname=blast+
pkgver=2.8.1
pkgrel=1
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
sha256sums=('e03dd1a30e37cb8a859d3788a452c5d70ee1f9102d1ee0f93b2fbd145925118f')

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
