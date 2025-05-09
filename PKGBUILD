# Maintainer: a821 < at mail dot de >
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=bowtie2-git
pkgver=2.5.4.r4.gb7e97e9
pkgrel=1
pkgdesc="Tool for aligning sequencing reads to long reference sequences"
arch=("x86_64")
url="https://bowtie-bio.sourceforge.net/bowtie2"
license=('GPL-3.0-only')
depends=('perl' 'python')
makedepends=('git' 'jdk-openjdk' 'cmake')
source=("$pkgname::git+https://github.com/BenLangmead/bowtie2"
        "git+https://github.com/simd-everywhere/simde-no-tests.git"
        "git+https://github.com/ch4rr0/libsais.git"
        "git+https://github.com/ncbi/sra-tools.git"
        "git+https://github.com/ncbi/ncbi-vdb.git"
)
conflicts=('bowtie2')
provides=('bowtie2')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

prepare() {
    cd $pkgname

    git submodule init
    git config submodule.third_party/libsais.url "$srcdir/libsais"
    git config submodule.third_party/simde.url "$srcdir/simde-no-tests"
    git -c protocol.file.allow=always submodule update

    sed -i 's#/vdb3##' Makefile # fix bug in Makefile

    # get sra-tools version and prepare temp directory
    local sra_ver=$(sed -n -e 's/^SRA_TOOLS_VER.*= *//p' Makefile)
    local vdb_ver=$(sed -n -e 's/^VDB_VER.*= *//p' Makefile)
    mkdir -p .tmp

    # copy sra-tools to temp dir
    cd "$srcdir/ncbi-vdb"
    git worktree add ../bowtie2-git/.tmp/ncbi-vdb-$vdb_ver $vdb_ver
    cd "$srcdir/sra-tools"
    git worktree add ../bowtie2-git/.tmp/sra-tools-$sra_ver $sra_ver
    cd ../bowtie2-git/.tmp/sra-tools-$sra_ver
    sed -i 's/ATTRIBUTE_UNUSED/__attribute__((unused))/' ./libs/kxml/xml.c
}

build() {
    cd $pkgname
    make libsais USE_SAIS_OPENMP=1
    make sra-deps
    make PREFIX=/usr USE_SRA=1 USE_SAIS_OPENMP=1
}

package() {
    cd $pkgname
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" \
        AUTHORS BOWTIE2_VERSION MANUAL* NEWS README.md TUTORIAL
    cp -r doc example "$pkgdir/usr/share/doc/$pkgname"
}

# vim: set ts=4 sw=4 et:
