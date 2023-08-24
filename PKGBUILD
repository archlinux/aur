# Maintainer: Yishen Miao <mys721tx@gmail.com>
# Maintainer: Nathaniel Stickney <nstickney@gmail.com>
# Contributor: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>
# shellcheck disable=SC2034,SC2148,SC2154

pkgname=blast+
pkgver=2.14.1
pkgrel=1
pkgdesc="BLAST tool suite from NCBI (blastn, blastp, blastx, psiblast, etc)"
arch=('i686' 'x86_64')
url="http://blast.ncbi.nlm.nih.gov/"
license=('custom')
depends=(
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
	'sqlite'
)
makedepends=('cpio' 'gcc')
# conflicts with proj on libproj.so
conflicts=('blast' 'blast+-bin' 'ncbi-blast' 'proj')
provides=('blast')
replaces=('ncbi-blast')
source=(
        "https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/$pkgver/ncbi-blast-$pkgver+-src.tar.gz"
)
sha256sums=(
        '712c2dbdf0fb13cc1c2d4f4ef5dd1ce4b06c3b57e96dfea8f23e6e99f5b1650e'
)

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
