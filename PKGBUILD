# Maintainer: Adityarup Laha <me@adityaruplaha.me>
_pkgname='plink2'
pkgname="$_pkgname-mkl-git"
_pkgver=2.0
pkgver=2.0.r108.ga09b4443
pkgrel=1
pkgdesc="whole-genome association analysis toolset, version 2.00 (alpha); dynamically linked to Intel MKL"
arch=(x86_64)
license=('GPL-3.0-or-later')
url="https://www.cog-genomics.org/plink/2.0/"
source=('plink2::git+https://github.com/chrchang/plink-ng.git' fixes.patch)
depends=('zlib>=1.2.4' 'intel-oneapi-mkl' 'intel-oneapi-openmp' 'intel-oneapi-compiler-shared-runtime')
makedepends=('git')
sha256sums=('SKIP'
            '1e0b255a74d75f0246cead411ef5d9d4723d039198a7e7875f650a3ae0f1090c')

prepare() {
    cd "$_pkgname/$_pkgver/build_dynamic"
    patch -i "${srcdir}/fixes.patch"
}

build() {
    cd "$_pkgname/$_pkgver/build_dynamic"
    DYNAMIC_MKL=1 LD_LIBRARY_PATH="/opt/intel/oneapi/compiler/latest/lib" BIN=$_pkgname make -f Makefile
}

package() {
    cd "$_pkgname/$_pkgver/build_dynamic"
    BIN="$_pkgname" DESTDIR="$pkgdir" PREFIX=/usr make -f Makefile install
}

pkgver() {
    cd "$_pkgname"
    echo "$_pkgver"."$(git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^.*\.r/r/')"
}
