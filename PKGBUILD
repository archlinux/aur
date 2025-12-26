# Maintainer: Adityarup Laha <me@adityaruplaha.me>
# Maintainer: Chris Vittal <chris@vittal.dev>
_pkgname='plink1.9'
pkgname="$_pkgname-git"
# Upstream has changed tag formats, epoch is necessary
epoch=1
_pkgver=1.9
pkgver=1.9.b.7.11.r64.gacb45ef4
pkgrel=1
pkgdesc="whole-genome association analysis toolset, version 1.9"
arch=(x86_64)
license=(GPL-3.0-only)
url="https://www.cog-genomics.org/plink/1.9/"
source=('plink1.9::git+https://github.com/chrchang/plink-ng.git'
        'bin-name.patch')
depends=('zlib>=1.2.4' 'cblas' 'lapack')
makedepends=('git')
provides=('plink1.9')
sha256sums=(SKIP
            24f570e751f51b6ab05c29f92cad4a57b0a54b7bb4a81dd067cf1cdc1c887327)

prepare() {
    cd "$_pkgname/$_pkgver"
    patch -i "${srcdir}/bin-name.patch"
}

build() {
    cd "$_pkgname/$_pkgver"
    CFLAGS+=" -DDYNAMIC_ZLIB $(pkg-config --cflags lapack blas cblas)" CXXFLAGS+=' -DDYNAMIC_ZLIB'\
        BLASFLAGS=$(pkg-config --libs lapack blas cblas) ZLIB=-lz \
        LDFLAGS+=' -lpthread -lm' BIN=$_pkgname make -f Makefile
}

package() {
    cd "$_pkgname/$_pkgver"
    BIN="$_pkgname" DESTDIR="$pkgdir" PREFIX=/usr make -f Makefile install
}

pkgver() {
    cd "$_pkgname"
    echo "$_pkgver"."$(git describe --tags --long --match "v1.9*" | sed -E 's/^[^-]+-([^-]+)-([0-9]+)-(g[a-f0-9]+)/\1.r\2.\3/')"
}
