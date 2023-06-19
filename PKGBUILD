# Maintainer: Yishen Miao <mys721tx@gmail.com>
# Maintainer: Nathaniel Stickney <nstickney@gmail.com>
# Contributor: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>
# shellcheck disable=SC2034,SC2148,SC2154

pkgname=blast+
pkgver=2.14.0
pkgrel=3
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
        "cstdint.patch"
)
sha256sums=(
        'bf477f1b0c3b82f0b7a7094bf003a9a83e37e3b0716c1df799060c4feab17500'
	'7cae72ec356224d9a75c4ce1c6c276dcb22b9a36b3d92f9c57b024dff23cc7f2'
)

prepare() {
    cd "$srcdir"/ncbi-blast-"$pkgver"+-src/c++ || exit
    patch --forward --strip 1 --input="${srcdir}/cstdint.patch"
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
