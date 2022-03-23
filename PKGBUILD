# Maintainer: Yishen Miao <mys721tx@gmail.com>
# Maintainer: Nathaniel Stickney <nstickney@gmail.com>
# Contributor: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>
# shellcheck disable=SC2034,SC2148,SC2154

pkgname=blast+
pkgver=2.13.0
pkgrel=1
pkgdesc="BLAST tool suite from NCBI (blastn, blastp, blastx, psiblast, etc)"
arch=('i686' 'x86_64')
url="http://blast.ncbi.nlm.nih.gov/"
license=('custom')
depends=('glibc'
         'gcc-libs'
         'libelf'
         'zlib'
	 'bzip2'
	 'lzo'
	 'zstd'
	 'db'
	 'pcre'
	 'perl'
	 'python'
	 'lmdb'
	 'libuv'
	 'libnghttp2'
	 'sqlite')
makedepends=('cpio')
# conflicts with proj on libproj.so
conflicts=('blast' 'blast+-bin' 'ncbi-blast' 'proj')
provides=('blast')
replaces=('ncbi-blast')
source=("https://ftp.ncbi.nlm.nih.gov/blast/executables/LATEST/ncbi-blast-$pkgver+-src.tar.gz")
sha256sums=('89553714d133daf28c477f83d333794b3c62e4148408c072a1b4620e5ec4feb2')

prepare() {
    cd "$srcdir"/ncbi-blast-"$pkgver"+-src/c++ || exit
    ./configure \
        --prefix=/usr \
        --with-dll \
        --with-mt
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
    echo 'public domain' >"$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
