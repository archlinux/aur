# Maintainer: Adityarup Laha <me@adityaruplaha.me>
_pkgname='plink2'
pkgname="$_pkgname-mkl-git"
# Upstream has changed tag formats, epoch is necessary
epoch=1
_pkgver=2.0
pkgver=2.0.0b.1.4.r51.g7f3ba4ad
pkgrel=1
pkgdesc="whole-genome association analysis toolset, version 2.00 (beta); dynamically linked to Intel MKL"
arch=(x86_64)
license=('GPL-3.0-or-later')
url="https://www.cog-genomics.org/plink/2.0/"
source=('plink-ng::git+https://github.com/chrchang/plink-ng.git')
depends=('zlib>=1.2.4' 'intel-oneapi-mkl' 'intel-oneapi-openmp' 'intel-oneapi-compiler-shared-runtime')
makedepends=('git')
provides=('plink2')
conflicts=('plink2')
sha256sums=('SKIP')

build() {
    cd "plink-ng/$_pkgver/build_dynamic"
    make NO_AVX2= NO_SSE42= DYNAMIC_MKL=1 \
        MKLROOT=/opt/intel/oneapi/mkl/latest \
        MKL_IOMP5_DIR=/opt/intel/oneapi/compiler/latest/lib \
        SFX=
}

package() {
    cd "plink-ng/$_pkgver/build_dynamic"
    install -Dm755 -t "$pkgdir/usr/bin" plink2 pgen_compress
}

pkgver() {
    cd "plink-ng"
    git describe --tags --long --match "v2.0*" | sed -E 's/^v//; s/-([0-9]+)-(g[0-9a-f]+)$/.r\1.\2/; s/-//'
}
