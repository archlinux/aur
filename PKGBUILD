# Maintainer: Yishen Miao <mys721tx@gmail.com>
# Maintainer: Nathaniel Stickney <nstickney@gmail.com>
# Contributor: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>
# shellcheck disable=SC2034,SC2148,SC2154

pkgname=blast+
pkgver=2.17.0
pkgrel=3
pkgdesc="BLAST tool suite from NCBI (blastn, blastp, blastx, psiblast, etc)"
arch=('x86_64' 'aarch64')
url="http://blast.ncbi.nlm.nih.gov/"
license=('NCBI-PD')
depends=(
    'bash'
    'bzip2'
    'gcc-libs'
    'glibc'
    'libnghttp2'
    'libuv'
    'lmdb'
    'lzo'
    'pcre2'
    'perl'
    'python'
    'sqlite'
    'zlib'
    'zstd'
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
    '502057a88e9990e34e62758be21ea474cc0ad68d6a63a2e37b2372af1e5ea147'
)

prepare() {
    cd "$srcdir"/ncbi-blast-"$pkgver"+-src/c++ || exit
    ./configure \
    --prefix=/usr \
    --with-dll \
    --with-bin-release \
    --with-mt \
    --with-libuv \
    --with-lmdb \
    --with-lzo \
    --with-nghttp2 \
    --with-pcre2 \
    --with-perl \
    --with-python \
    --with-sqlite3 \
    --with-z \
    --with-zstd
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
    echo 'NCBI-PD' >"$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}

# vim: set ts=4 sts=4 sw=4 et:
