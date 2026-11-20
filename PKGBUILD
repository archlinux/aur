# Maintainer: Adityarup Laha <me@adityaruplaha.me>
pkgname=plink2
_pkgver=2.0.0-b.1.4
pkgver=2.0.0b.1.4
pkgrel=1
pkgdesc="whole-genome association analysis toolset, version 2.0"
arch=(x86_64)
license=(GPL-3.0-or-later LGPL-3.0-or-later)
url="https://www.cog-genomics.org/plink/2.0/"
source=("plink-ng-${_pkgver}.tar.gz::https://github.com/chrchang/plink-ng/archive/refs/tags/v${_pkgver}.tar.gz")
depends=(glibc libstdc++ cblas lapack zlib zstd)
makedepends=(lapacke)
sha256sums=('eeae238d4288b9c21ce221f13402d38a3210478f8d8a6c4af0e161c170956d55')

build() {
    cd "plink-ng-$_pkgver/2.0/build_dynamic"
    # pgen_compress is linked by a rule that ignores LDFLAGS
    CFLAGS+=" $(pkg-config --cflags cblas lapacke)" \
    CXXFLAGS+=" $(pkg-config --cflags cblas lapacke) ${LDFLAGS}" \
        make SFX= CBLAS_LAPACKE=1 STATIC_ZSTD=
}

package() {
    cd "plink-ng-$_pkgver/2.0/build_dynamic"
    install -Dm755 -t "$pkgdir/usr/bin" plink2 pgen_compress
}
