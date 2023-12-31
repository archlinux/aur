# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Anton Kudelin <kudelin at protonmail dot com>

_pkgname=libint
pkgname=libint2
pkgver=2.8.1
pkgrel=1
pkgdesc='A high-performance library for computing Gaussian integrals in quantum mechanics'
url='https://github.com/evaleev/libint'
license=('GPL')
arch=('x86_64')
depends=('boost')
makedepends=('python' 'gcc-fortran' 'cmake' 'automake' 'autoconf' 'eigen')
source=("https://github.com/evaleev/libint/archive/v${pkgver}.tar.gz")
sha256sums=('54ae9c55f03f1989ee4792ab1ec24eda8ac88126f9c11f3723ed76a3275b3e24')
options=(staticlibs)


prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    ./autogen.sh
    
    # Detecting FMA support
    if [ $( gcc -march=native -dM -E - < /dev/null | egrep "FMA__" | tail -c 2 ) \
        == 1 ]
    then
        FMA=yes
        CXXFLAGS="$CXXFLAGS -mfma"
        echo "Support of FMA intrinsics is enabled"
    else 
        FMA=no
        echo "Support of FMA intrinsics is disabled"
    fi
    
    # Setting build environment
    export CC=gcc
    export CXX=g++
    export FC=gfortran
    export CXXGENFLAGS="$CXXFLAGS"
}

build() {
    ## generating libint library
    tarball_build_dir="${srcdir}/prepare_tarball"
    libint_build_dir="${srcdir}/build_libint"

    # create dir for building tarball 
    mkdir -p "$tarball_build_dir"
    
    # run conf from building tarball dir
    cd "$tarball_build_dir"
    ../$_pkgname-$pkgver/configure \
                --enable-eri=1 \
                --enable-eri2=1 \
                --enable-eri3=1 \
                --enable-fma=$FMA \
                --with-max-am=5 \
                --with-eri-max-am=5,4 \
                --with-eri2-max-am=7,6 \
                --with-eri3-max-am=7,6 \
                --with-opt-am=3
    make export
    
    ## compiling libint library
    # create dir for building libint 
    mkdir -p "$libint_build_dir"

    tar xzf "$tarball_build_dir/${_pkgname}-${pkgver}.tgz" -C "$libint_build_dir"

    cd "$libint_build_dir/${_pkgname}-${pkgver}"
    cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_CXX_COMPILER=g++ -DCMAKE_CXX_FLAGS="$CXXFLAGS"
    cmake --build .
}

check() {
    libint_build_dir="${srcdir}/build_libint"
    cd "$libint_build_dir/${_pkgname}-${pkgver}"
    cmake --build . --target check
}

package() {
    libint_build_dir="${srcdir}/build_libint"
    cd "$libint_build_dir/${_pkgname}-${pkgver}"
    DESTDIR="$pkgdir" cmake --install .
}
