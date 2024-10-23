pkgname=cadna_c
pkgver=3.1.12
pkgrel=1
pkgdesc="Control of Accuracy and Debugging for Numerical Applications"
arch=('i686' 'x86_64')
url="http://cadna.lip6.fr/"
license=('LGPL')
depends=('gcc-libs' 'openmpi' 'gcc-fortran')
makedepends=()
# README says to not build in parallel (and indeed, parallel build fails)
options=(!makeflags)
# Renamed with _half suffix since 3.1.12
_pkgname=cadna_c_half
source=("http://cadna.lip6.fr/Download_Dir/${_pkgname}-${pkgver}.tar.gz")

prepare() {
        cd ${_pkgname}-${pkgver}

        ./configure --prefix=/usr --enable-fortran
}

build() {
        cd ${_pkgname}-${pkgver}
        make
}

check() {
        cd ${_pkgname}-${pkgver}

        # Temporarily install just for building tests
        _test_install=$(realpath _install)
        _test_prefix=$_test_install/usr
        make install DESTDIR=$_test_install

        _examples="examplesC
                   examplesC_mpi
                   examplesC_mpiomp
                   examplesC_omp
                   examplesFortran
                   examplesFortran_mpi"

        _INCFLAGS+="-I$_test_prefix/include"
        _MODFLAGS+="-J$_test_prefix/include"
        _LIBFLAGS+="-L$_test_prefix/lib"

        for ex in $_examples
        do
                case "$ex" in
                  examplesC|examplesFortran)
                        _BINS="ex1 ex1_cad ex2 ex2_cad ex3 ex3_cad ex4 ex4_cad
                               ex5 ex5_cad ex5_cad_opt ex6 ex6_cad"
                        #_BINS+="ex7 ex7_cad" # these are interactive
                        ;;
                  examplesC_mpi)
                        _LAUNCH="mpirun -np 4" # num procs required by tests
                        _BINS="exampleMPI1 exampleMPI1_cad
                               exampleMPI2 exampleMPI2_cad
                               exampleMPI1_float exampleMPI1_float_cad
                               exampleMPI2_float exampleMPI2_float_cad"
                        ;;
                  examplesC_mpiomp)
                        _BINS="exampleMPI_OMP1 exampleMPI_OMP1_cad"
                        ;;
                  examplesC_omp)
                        _BINS="exampleOPENMP1 exampleOPENMP1_cad"
                        ;;
                  examplesFortran_mpi)
                        _LIBS=""
                        _LAUNCH="mpirun -np 4" # num procs required by tests
                        _BINS="exampleMPI1Reduce_cad exampleMPI1Reduce_float_cad
                               exampleMPI1SendRecv exampleMPI1SendRecv_float
                               exampleMPI1SendRecv_cad exampleMPI1SendRecv_float_cad"
                        ;;
                esac

                echo ">>> Building $ex..."

                make -C $ex clean
                make -C $ex CPPFLAGS+=" $_INCFLAGS " FCFLAGS+=" $_MODFLAGS " \
                        CFLAGS+=" $CFLAGS" CXXFLAGS+=" $CXXFLAGS " \
                        LDFLAGS+=" $_LIBFLAGS " LIBS+=" $_LIBS "

                for bin in $_BINS
                do
                        echo ">>> Running $ex/$bin..."
                        $_LAUNCH ./$ex/$bin
                done
        done
}

package() {
        cd ${_pkgname}-${pkgver}
        make install DESTDIR="$pkgdir"
}

sha256sums=('a25f6b7563c865ecc40088880d41756a6b21e4e84a1d217aee1e2894d93e2f1c')
