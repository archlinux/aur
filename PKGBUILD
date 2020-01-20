# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Anton Kudelin <kudelin at protonmail dot com>

_pkgname=libint
pkgname=libint2
pkgver=2.6.0
pkgrel=2
pkgdesc='A high-performance library for computing Gaussian integrals in quantum mechanics'
url='https://github.com/evaleev/libint'
license=('GPL')
arch=('x86_64')
depends=('boost')
makedepends=('python' 'gcc-fortran' 'cmake' 'automake' 'autoconf')
source=("https://github.com/evaleev/libint/archive/v${pkgver}.tar.gz"
        "0001-Update-build_libint.cc.patch")
sha256sums=('4ae47e8f0b5632c3d2a956469a7920896708e9f0e396ec10071b8181e4c8d9fa'
            '22fea5b46e61ad3a08f2b9ea9a898dc8c29faa77db06dfd45cdc8e9046286a6e')
options=(staticlibs)

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    patch -Np1 -i "${srcdir}/0001-Update-build_libint.cc.patch"

    ./autogen.sh
    mkdir "$srcdir/build"
    
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
    cd "${srcdir}/build"
    
    # Generating code with desirable features such as fortran interface
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
    
    # Actual compilation of LIBINT
    tar xzf $_pkgname-$pkgver.tgz
    cd "$_pkgname-$pkgver"

    ./configure \
                --prefix=/usr \
                --libdir=/usr/lib \
                --enable-fortran \
                --with-cxx=g++ \
                --with-cxx-optflags="$CXXFLAGS"
    make
}

check() {
    cd "$srcdir/build/$_pkgname-$pkgver"

    make check
}

package() {
    cd "$srcdir/build/$_pkgname-$pkgver"

    make DESTDIR=$pkgdir install
}
