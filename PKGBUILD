# Maintainer: Adityarup Laha <me@adityaruplaha.me>
_pkgname='plink2'
pkgname="$_pkgname-git"
_pkgver=2.0
pkgver=2.0.r91.g705f965b
pkgrel=1
pkgdesc="whole-genome association analysis toolset, version 2.00 (alpha)"
arch=(x86_64)
license=(GPL3)
url="https://www.cog-genomics.org/plink/2.0/"
source=('plink2::git+https://github.com/chrchang/plink-ng.git' fixes.patch)
depends=('zlib>=1.2.4' 'cblas' 'lapack')
optdepends=('intel-oneapi-mkl: Intel MKL support'
            'intel-oneapi-compiler-shared: Intel MKL support'
            'aocl-gcc: AMD AOCL support'
            'atlas-lapack: ATLAS support (no Intel MKL/AMD AOCL)')
sha256sums=('SKIP'
            'f79f6a90f7a96fd4d91e2e0fd55b687b95bcdc9e4f5c5f0fd68507f1b58d68c1')

prepare() {
    cd "$_pkgname/$_pkgver/build_dynamic"
    patch -i "${srcdir}/fixes.patch"
}

build() {
    cd "$_pkgname/$_pkgver/build_dynamic"
    DYNAMIC_MKL=1 \
        CFLAGS=$(pkg-config --cflags lapack blas cblas) \
        CXXFLAGS=$(pkg-config --cflags lapack blas cblas) \
        BLASFLAGS=$(pkg-config --libs lapack blas cblas) \
        BIN=$_pkgname make -f Makefile
}

package() {
    cd "$_pkgname/$_pkgver/build_dynamic"
    BIN="$_pkgname" DESTDIR="$pkgdir" PREFIX=/usr make -f Makefile install
}

pkgver() {
    cd "$_pkgname"
    echo "$_pkgver"."$(git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^.*\.r/r/')"
}
