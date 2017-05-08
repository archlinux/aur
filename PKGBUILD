# Maintainer: Felix Schindler <aur at felixschindler dot net>
DLAGENTS=("https::/usr/bin/curl -k -o %o %u")

pkgname=flexiblas
pkgver=2.0.0
pkgrel=1
_lapackver=3.6.0
pkgdesc="A Blas wrapper library with runtime exchangable backends"
url=http://www.mpi-magdeburg.mpg.de/projects/flexiblas
license=('GPL3')
source=("https://www2.mpi-magdeburg.mpg.de/mpcsc/software/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
md5sums=('4ac2cd9d945d69896440ed5e5630d421')
arch=('i686' 'x86_64')
makedepends=('cmake' 'gcc-fortran')
depends=('openblas-lapack-for-flexiblas' 'atlas-lapack-for-flexiblas')
conflicts=('blas' 'lapack' 'cblas' 'lapacke' 'openblas' 'openblas-lapack' 'atlas' 'atlas-lapack')
provides=("blas=${_lapackver}" "lapack=${_lapackver}" "cblas=${_lapackver}" "lapacke=${_lapackver}")

build() {
        cd ${pkgname}-${pkgver}
        [ -e build ] && rm -r build
        mkdir build
        cd build
        cmake .. \
                -DCMAKE_INSTALL_PREFIX="/usr" \
                -DOPENBLAS="/opt/openblas-lapack-for-flexiblas/lib/libopenblas.so;gfortran;gomp;m" \
                -DATLAS="/opt/atlas-lapack-for-flexiblas/lib/libatlas.so;/opt/atlas-lapack-for-flexiblas/lib/libf77blas.so;/opt/atlas-lapack-for-flexiblas/lib/liblapack.so.3.6.1;/opt/atlas-lapack-for-flexiblas/lib/libptcblas.so;/opt/atlas-lapack-for-flexiblas/lib/libptlapack.a;/opt/atlas-lapack-for-flexiblas/lib/libptlapack.so.3.6.1;/opt/atlas-lapack-for-flexiblas/lib/libsatlas.so;/opt/atlas-lapack-for-flexiblas/lib/libsatlas.so;/opt/atlas-lapack-for-flexiblas/lib/libstcblas.so;/opt/atlas-lapack-for-flexiblas/lib/libtatlas.so;gfortran;gomp;m"
        make
}

## ATM, this does not work unless flexiblas is already installed!
#check() {
#        # make a backup of the users flexiblasrc, if present
#        export _users_flexiblasrc=${HOME}/.flexiblasrc
#        export _users_flexiblasrc_backup=${HOME}/.flexiblasrc.aur_pkg_backup
#        [ -e ${_users_flexiblasrc} ] && mv ${_users_flexiblasrc} ${_users_flexiblasrc_backup}
#
#        for backend in NETLIB OpenBLAS ATLAS; do
#                echo " "
#                echo "========================================"
#                echo " testing with ${backend} backend"
#                echo "========================================"
#                echo " "
#                # write a custom flexiblasrc
#                echo "default = ${backend}" > ${_users_flexiblasrc}
#                echo "verbose = 0" >> ${_users_flexiblasrc}
#                echo "profile = 0" >> ${_users_flexiblasrc}
#                echo " " >> ${_users_flexiblasrc}
#                echo "[NETLIB]" >> ${_users_flexiblasrc}
#                echo "library = libflexiblas_netlib.so" >> ${_users_flexiblasrc}
#                echo " " >> ${_users_flexiblasrc}
#                echo "[OpenBLAS]" >> ${_users_flexiblasrc}
#                echo "library = libflexiblas_openblas.so " >> ${_users_flexiblasrc}
#                echo " " >> ${_users_flexiblasrc}
#                echo "[ATLAS]" >> ${_users_flexiblasrc}
#                echo "library = libflexiblas_atlas.so" >> ${_users_flexiblasrc}
#		# test this backend
#		cd ${pkgname}-${pkgver}
#		cd build
#		make test
#	done
#
#	# restore the original blexiblasrc
#        [ -e ${_users_flexiblasrc_backup} ] && mv ${_users_flexiblasrc_backup} ${_users_flexiblasrc}
#}

package() {
        cd ${pkgname}-${pkgver}
        cd build
        make DESTDIR="${pkgdir}" install

        mv ${pkgdir}/usr/lib64 ${pkgdir}/usr/lib
        cd ${pkgdir}/usr/lib
        ln -s libflexiblas.so libblas.so
        ln -s libflexiblas.so libblas.so.3
        ln -s libflexiblas.so libblas.so.3.7.0
        ln -s libflexiblas.so libcblas.so
        ln -s libflexiblas.so liblapacke.so
        ln -s libflexiblas.so liblapack.so
        ln -s libflexiblas.so liblapack.so.3
        ln -s libflexiblas.so liblapack.so.3.7.0

        cd ${pkgdir}/usr/include
        ln -s flexiblas/cblas.h cblas.h
        ln -s flexiblas/lapack.h lapacke.h
}

