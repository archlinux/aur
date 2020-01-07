# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=elpa
PkgName=ELPA
pkgver=2019.11.001
pkgrel=1
arch=('x86_64')
pkgdesc="Eigenvalue SoLvers for Petaflop-Applications"
url="https://elpa.mpcdf.mpg.de/html/Releases"
license=("LGPL3")
depends=('scalapack')
makedepends=('gcc-fortran' 'python' 'vim')
optdepends=('cuda: GPU support')
provides=('elpa')
source=("$url/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('10374a8f042e23c7e1094230f7e2993b6f3580908a213dbdf089792d05aff357')

prepare() {
    export CC=mpicc
    export FC=mpifort
    unset LDFLAGS
   
    # Checking if nvcc is in PATH
    if [ $( echo -n $( which nvcc) | tail -c 4 ) == nvcc ]
    then
        export _ACC=yes
        export LDFLAGS="$LDFLAGS -L/opt/cuda/lib64"
        echo "GPU is enabled"
    else
        export ACC=no
        echo "GPU is disabled"
    fi
   
    # Detecting AVX compatibility
    _AVXCOMP=$( gcc -march=native -dM -E - < /dev/null \
        | egrep "AVX" | sort | tail -n 1 | awk -F'_' '{print $3}' )
    case $_AVXCOMP in
        AVX512*)
            _AVX=yes
            _AVX2=yes
            _AVX512=yes
            echo "Full vectorization is enabled"
            ;;
        AVX2)
            _AVX=yes
            _AVX2=yes
            _AVX512=no
            echo "Improved vectorization is enabled"
            ;;
        AVX)
            _AVX=yes
            _AVX2=no
            _AVX512=no
            echo "Basic vectorization is enabled"
            ;;
        *)
            _AVX=no
            _AVX2=no
            _AVX512=no
            echo "No vectorization is enabled"
            ;;
    esac
}

build() {
    cd $srcdir/$pkgname-$pkgver
     ./configure --prefix=/usr                      \
                 --enable-openmp                    \
                 --enable-avx=$_AVX                 \
                 --enable-avx2=$_AVX2               \
                 --enable-avx512=$_AVX512           \
                 --enable-gpu=$_ACC                 \
                 CFLAGS="$CFLAGS -march=native"     \
                 LIBS='-lblas -llapack -lscalapack'

    # As for 2019.11.01 parallel builds are still broken
    make -j1
}

package() {
    cd $srcdir/$pkgname-$pkgver
    make DESTDIR=$pkgdir install
}
