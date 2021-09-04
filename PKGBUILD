# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Lukas Böger <dev___AT___lboeger___DOT___de>
pkgname=psurface
pkgver=2.0.0
pkgrel=1
pkgdesc='Piecewise linear bijections between triangulated surfaces'
arch=('x86_64')
url='http://numerik.mi.fu-berlin.de/dune/psurface/index.php'
license=('LGPL3')
depends=('gcc-libs')
source=(https://github.com/${pkgname}/${pkgname}/archive/${pkgname}-${pkgver}.tar.gz)
sha512sums=('5b0c956635a74b3462b2f8dd9686dbfd5aa40db677b8a0ce06eac5ae1a7f1307ccf9ced68e36d0be7e00dac6f3de93832c291a41cc2de1ea747e76caabc033cc')

prepare() {
    # https://salsa.debian.org/science-team/psurface/-/blob/master/debian/patches/hdf5.patch
    sed -i 's/^ if test x$with_hdf5 != x ; then/ if test "x$with_hdf5" != x \&\& test "x$with_hdf5" != xno ; then/' "${pkgname}-${pkgname}-${pkgver}/m4/hdf5.m4"
    sed -i '97 a \ if test "x$with_hdf5" != xno ; then' "${pkgname}-${pkgname}-${pkgver}/m4/hdf5.m4"
    sed -i '101 a \ else' "${pkgname}-${pkgname}-${pkgver}/m4/hdf5.m4"
    sed -i '102 a \ \ \ \ HAVE_HDF5=0' "${pkgname}-${pkgname}-${pkgver}/m4/hdf5.m4"
    sed -i '103 a \ fi' "${pkgname}-${pkgname}-${pkgver}/m4/hdf5.m4"
    # https://salsa.debian.org/science-team/psurface/-/blob/master/debian/patches/build-failure-with-gcc-6.patch
    sed -i '1333 a \ \ \ \ \ \ \ \ \ \ \ \ using std::isinf;' "${pkgname}-${pkgname}-${pkgver}/NormalProjector.cpp"
    sed -i '1334 a \ \ \ \ \ \ \ \ \ \ \ \ using std::isnan;' "${pkgname}-${pkgname}-${pkgver}/NormalProjector.cpp"
    sed -i '1483 a \ \ \ \ \ \ \ \ \ \ \ \ using std::isinf;' "${pkgname}-${pkgname}-${pkgver}/NormalProjector.cpp"
    sed -i '1484 a \ \ \ \ \ \ \ \ \ \ \ \ using std::isnan;' "${pkgname}-${pkgname}-${pkgver}/NormalProjector.cpp"
}

build() {
    cd "${pkgname}-${pkgname}-${pkgver}"
    autoreconf -isf
    autoupdate
    ./configure --prefix=/usr --without-amiramesh --without-x --without-hdf5
    make
}

package() {
    cd "${pkgname}-${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    install -m644 -D COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
