# Maintainer: Nathaniel Stickney <nstickney@gmail.com>
# Contributor: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>
# shellcheck disable=SC2034,SC2148,SC2154

pkgname=blast+
pkgver=2.12.0
pkgrel=2
pkgdesc="BLAST tool suite from NCBI (blastn, blastp, blastx, psiblast, etc)"
arch=('i686' 'x86_64')
url="http://blast.ncbi.nlm.nih.gov/"
license=('custom')
depends=('elfutils'
	 'zlib'
	 'bzip2'
	 'lzo'
	 'zstd'
	 'pcre'
	 'gmp'
	 'nettle'
	 'krb5'
	 'mysql'
	 'freetype'
	 'python'
	 'perl'
	 'sqlite'
	 'icu'
	 'expat'
	 'libxml2'
	 'libxslt'
	 'muparser'
	 'hdf5'
	 'giflib'
	 'libjpeg'
	 'libpng'
	 'libtiff'
	 'imagemagick'
	 'curl'
	 'mimetic'
	 'lapack'
	 'lmdb'
	 'libuv'
	 'libssh2')
makedepends=('cpio')
# conflicts with proj on libproj.so
conflicts=('blast' 'blast+-bin' 'ncbi-blast' 'proj')
provides=('blast')
replaces=('ncbi-blast')
source=("https://ftp.ncbi.nlm.nih.gov/blast/executables/LATEST/ncbi-blast-$pkgver+-src.tar.gz")
sha256sums=('fda3c9c9d488cad6c1880a98a236d842bcf3610e3e702af61f7a48cf0a714b88')

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
    echo 'public domain' >"$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
