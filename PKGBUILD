# Maintainer: Kevin Meagher <kmeagher at icecube dot wisc dot edu>
pkgname=healpix
pkgver='3.82'
_pkgdate='2022Jul28'
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
md5sums=('f71ffbccd3009f5e602fb48b4fa134d5')
sha1sums=('57b9963340af7c983040892c84d8f6d1a72dd22a')
sha256sums=('47629f057a2daf06fca3305db1c6950edb9e61bbe2d7ed4d98ff05809da2a127')

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

