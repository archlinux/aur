# Maintainer: Kristóf Marussy <kristof@marussy.com>

pkgname=coin-or-couenne
pkgver=0.5.8
pkgrel=2
pkgdesc='Convex Over and Under Envelopes for Nonlinear Estimation'
arch=('x86_64')
url="https://github.com/coin-or/Couenne/"
license=('EPL')
groups=('coin-or')
depends=('coin-or-cbc'
         'coin-or-cgl'
         'coin-or-clp'
         'coin-or-coinutils'
         'coin-or-ipopt'
         'coin-or-osi'
         'coin-or-bonmin'
         'coin-or-asl'
         'coin-or-coinmumps'
         'metis'
         'lapack')
source=("Couenne-${pkgver}.tar.gz::https://github.com/coin-or/Couenne/archive/releases/${pkgver}.tar.gz")
sha256sums=('73b36e7475910f576ca25f8323553b9d5201fcb2656cef0a2c72e69dc0681051')

build() {
    cd "${srcdir}/Couenne-releases-${pkgver}"
    COIN_SKIP_PROJECTS="Sample" \
    CXXFLAGS="${CXXFLAGS} -std=c++11 -I/usr/include/coin -DCOIN_USE_MUMPS_MPI_H" \
    ./configure --prefix=/usr \
                --with-asl-lib="$(pkg-config --libs coinasl)" \
                --with-asl-incdir="/usr/include/coin-or/asl/" \
                --with-blas \
                --with-blas-lib="$(pkg-config --libs blas)" \
                --with-blas-incdir="/usr/include/" \
                --with-lapack \
                --with-lapack-lib="$(pkg-config --libs lapack)" \
                --with-lapack-incdir="/usr/include/" \
                --with-metis-lib="-lmetis" \
                --with-metis-incdir="/usr/include/" \
                --without-hsl \
                --with-mumps-lib="$(pkg-config --libs coinmumps)" \
                --with-mumps-incdir="/usr/include/coin/ThirdParty/" \
                --without-soplex \
                --with-coinutils-lib="$(pkg-config --libs coinutils)" \
                --with-coinutils-incdir="/usr/include/coin/" \
                --with-osi-lib="$(pkg-config --libs osi)" \
                --with-osi-incdir="/usr/include/coin/" \
                --with-clp-lib="$(pkg-config --libs clp)" \
                --with-clp-incdir="/usr/include/coin/" \
                --with-cgl-lib="$(pkg-config --libs cgl)" \
                --with-cgl-incdir="/usr/include/coin/" \
                --with-cbc-lib="$(pkg-config --libs cbc)" \
                --with-cbc-incdir="/usr/include/coin/" \
                --with-ipopt-lib="$(pkg-config --libs ipopt)" \
                --with-ipopt-incdir="/usr/include/coin/" \
                --without-scip \
                --with-bonmin-lib="$(pkg-config --libs bonmin bonminamplinterface)" \
                --with-bonmin-incdir="/usr/include/coin/"
    make
}

package() {
    cd "${srcdir}/Couenne-releases-${pkgver}"
    PKG_CONFIG_LIBDIR="${pkgdir}/usr/lib/pkgconfig/" \
    make DESTDIR="${pkgdir}/" install
}
