# Maintainer: Kevin Meagher <kmeagher at icecube dot wisc dot edu>
pkgname=healpix
pkgver='3.80'
_pkgdate='2021Jun22'
pkgrel=1
pkgdesc="Software for pixelization, hierarchical indexation, synthesis, analysis, and visualization of data on the sphere."
arch=('x86_64')
url="https://healpix.jpl.nasa.gov/"
license=('GPL2')
groups=()
depends=(cfitsio)
makedepends=()
provides=()
conflicts=(libsharp)
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://downloads.sourceforge.net/project/healpix/Healpix_${pkgver}/Healpix_${pkgver}_${_pkgdate}.tar.gz")
md5sums=('923d31845716014e38f34c4de59264e1')
sha1sums=('435a27e5e1b3cab27f3327e8246de855f19ef1ee')
sha256sums=('8de4aabaa3d55e0c63a62c621bfd77298732c6b75782016217f5659143acbcf5')
build() {
    cd "${srcdir}/Healpix_${pkgver}/src/C/autotools"
    autoreconf --install
    ./configure --prefix=/usr
    make -j

    cd "${srcdir}/Healpix_${pkgver}/src/common_libraries/libsharp"
    ./configure --prefix=/usr
    make -j

    cd "${srcdir}/Healpix_${pkgver}/src/cxx"
    autoreconf --install
    export SHARP_CFLAGS="-I${srcdir}/Healpix_${pkgver}/src/common_libraries/libsharp/"
    export SHARP_LIBS="-L${srcdir}/Healpix_${pkgver}/src/common_libraries/libsharp/.libs -lsharp"
    ./configure --prefix=/usr
    make -j
}

package() {
    cd "${srcdir}/Healpix_${pkgver}/src/C/autotools"
    make DESTDIR=${pkgdir} install

    cd "${srcdir}/Healpix_${pkgver}/src/common_libraries/libsharp"
    make DESTDIR=${pkgdir} install

    cd "${srcdir}/Healpix_${pkgver}/src/cxx"
    make DESTDIR=${pkgdir} install
}

