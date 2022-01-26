# Maintainer: Kevin Meagher <kmeagher at icecube dot wisc dot edu>
pkgname=healpix
pkgver='3.81'
_pkgdate='2022Jan25'
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
md5sums=('906e4907bb6f87400c895ce0627bf190')
sha1sums=('a01ecea90f754067d62df3be63aa76d8f92bca4f')
sha256sums=('82d92bb21626371f9d280e59e82ad0f47d9ae62c70d86ccd1026e0310f193551')

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

