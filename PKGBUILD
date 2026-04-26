# Maintainer: Adityarup Laha <me@adityaruplaha.me>
_pkgname='plink2'
pkgname="$_pkgname-mkl-git"
# Upstream has changed tag formats, epoch is necessary
epoch=1
_pkgver=2.0
pkgver=2.0.a.7.0.r0.g38779704
pkgrel=1
pkgdesc="whole-genome association analysis toolset, version 2.00 (alpha); dynamically linked to Intel MKL"
arch=(x86_64)
license=('GPL-3.0-or-later')
url="https://www.cog-genomics.org/plink/2.0/"
source=('plink-ng::git+https://github.com/chrchang/plink-ng.git' fixes.patch)
depends=('zlib>=1.2.4' 'intel-oneapi-mkl' 'intel-oneapi-openmp' 'intel-oneapi-compiler-shared-runtime')
makedepends=('git')
provides=('plink2')
sha256sums=('SKIP'
            'ef03418c3f0e3a6a2569f1df76a8a14f8d0cbb46415cfa3c9ccbdbbf0de8fd0c')

prepare() {
    cd "plink-ng/$_pkgver/build_dynamic"
    patch -i "${srcdir}/fixes.patch"
}

build() {
    cd "plink-ng/$_pkgver/build_dynamic"
    DYNAMIC_MKL=1 LD_LIBRARY_PATH="/opt/intel/oneapi/compiler/latest/lib" BIN=$_pkgname make -f Makefile
}

package() {
    cd "plink-ng/$_pkgver/build_dynamic"
    BIN="$_pkgname" DESTDIR="$pkgdir" PREFIX=/usr make -f Makefile install
}

pkgver() {
    cd "plink-ng"
    echo "$_pkgver"."$(git describe --tags --long --match "v2.0*" | sed -E 's/^[^-]+-([^-]+)-([0-9]+)-(g[a-f0-9]+)/\1.r\2.\3/')"
}
