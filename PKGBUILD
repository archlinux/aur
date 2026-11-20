# Maintainer: Adityarup Laha <me@adityaruplaha.me>
pkgname=plink1.9
_pkgver=1.9.1
pkgver=1.9.1
pkgrel=1
pkgdesc="whole-genome association analysis toolset, version 1.9"
arch=(x86_64)
license=(GPL-3.0-or-later)
url="https://www.cog-genomics.org/plink/1.9/"
source=("plink-ng-${_pkgver}.tar.gz::https://github.com/chrchang/plink-ng/archive/refs/tags/v${_pkgver}.tar.gz"
        'bin-name.patch')
depends=('glibc' 'libgcc' 'libstdc++' 'zlib>=1.2.4' 'blas' 'cblas' 'lapack')
sha256sums=('c1da6fc12829108743affc94866391d96021d3c55ed52735e110b89654af85b3'
            '24f570e751f51b6ab05c29f92cad4a57b0a54b7bb4a81dd067cf1cdc1c887327')

prepare() {
    cd "plink-ng-$_pkgver/1.9"
    patch -i "${srcdir}/bin-name.patch"
}

build() {
    cd "plink-ng-$_pkgver/1.9"
    CFLAGS+=" -DDYNAMIC_ZLIB $(pkg-config --cflags lapack blas cblas)" CXXFLAGS+=' -DDYNAMIC_ZLIB'\
        BLASFLAGS=$(pkg-config --libs lapack blas cblas) ZLIB=-lz \
        LDFLAGS+=' -lpthread -lm' BIN=$pkgname make -f Makefile
}

package() {
    cd "plink-ng-$_pkgver/1.9"
    BIN="$pkgname" DESTDIR="$pkgdir" PREFIX=/usr make -f Makefile install
}
