# Maintainer: Chris Vittal <chris@vittal.dev>
_pkgname='plink1.9'
pkgname="$_pkgname-git"
_pkgver=1.9
pkgver=1.9.r40.gdcc7785a
pkgrel=1
pkgdesc="whole-genome association analysis toolset, version 1.9"
arch=(x86_64)
license=(GPL3)
url="https://www.cog-genomics.org/plink/1.9/"
source=('plink1.9::git+https://github.com/chrchang/plink-ng.git'
        'bin-name.patch')
depends=('zlib>=1.2.4' 'cblas' 'lapack')
sha256sums=(SKIP
            6d489d96f1c9f055dd5858ca3618db34d47adcb5f1eba2a12ad699ff787028ac)

prepare() {
    cd "$_pkgname/$_pkgver"
    patch -i "${srcdir}/bin-name.patch"
}

build() {
    cd "$_pkgname/$_pkgver"
    CFLAGS+=' -DDYNAMIC_ZLIB' CXXFLAGS+=' -DDYNAMIC_ZLIB' \
        BLASFLAGS=$(pkg-config --libs lapack blas cblas) ZLIB=-lz \
        LDFLAGS+=' -lpthread -lm' BIN=$_pkgname make -f Makefile.std
}

package() {
    cd "$_pkgname/$_pkgver"
    BIN="$_pkgname" DESTDIR="$pkgdir" PREFIX=/usr make -f Makefile.std install
}

pkgver() {
    cd "$_pkgname"
    echo "$_pkgver"."$(git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^.*\.r/r/')"
}
