# Maintainer: Jesse R Codling <codling at umich dot edu>

pkgname=aocl-libflame
pkgver=5.2.2
pkgrel=2
pkgdesc="High-performance object-based library for DLA computations, AOCL branding"
arch=('x86_64')
url="https://github.com/amd/libflame"
license=('custom')
depends=('gcc-libs' 'aocl-utils' "aocl-blis")
makedepends=('gcc-fortran' 'python' 'cmake' 'ninja' "aocl-blis=${pkgver}")
provides=('lapack' 'lapacke')
conflicts=('lapack' 'lapacke')
_lapackver=3
source=("$pkgname-$pkgver.tar.gz::https://github.com/amd/libflame/archive/$pkgver.tar.gz")
sha256sums=('f0200411c2ee0b2490810a837347bd706c878c8ca2c6511e572235be24ef64df')

# specified generic -march causes build issues
export CFLAGS="${CFLAGS/-march=x86-64/}"
export CXXFLAGS="${CXXFLAGS/-march=x86-64/}"

# path needed to find pre-built AOCL-BLIS
export AOCL_ROOT=/usr/
prepare() {
    cd "$srcdir/libflame-$pkgver"

    # remove AMD's fortify flag, which duplicate's Arch's
    sed -i '/-D_FORTIFY_SOURCE/d' -s CMakeLists.txt 
    # don't override -mtune from Arch's build flags
    sed -i 's/-mtune=native //' -s CMakeLists.txt
    # remove "-pie" flag, which breaks shared library builds with newer CMake. see #6
    sed -i 's/-pie //' -s CMakeLists.txt

    cmake -B newbuild -G Ninja \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DAOCL_ROOT=/usr \
        -DBUILD_SHARED_LIBS=ON \
        -DLF_ISA_CONFIG=auto \
        -DENABLE_AOCL_BLAS=ON \
        -DENABLE_AMD_FLAGS=ON
	# -DBUILD_TEST=ON # only needed to enable testing

}

build() {
    cd "$srcdir/libflame-$pkgver"

    cmake --build newbuild
}

# check() { # testing this library takes an exorbitant amount of time
#     cd "$srcdir/libflame-$pkgver"
#
#     ctest --test-dir newbuild
# }

package() {
    cd "$srcdir/libflame-$pkgver/newbuild"
    DESTDIR="$pkgdir" ninja install

    ln -s /usr/lib/libflame.so $pkgdir/usr/lib/liblapack.so
    ln -s /usr/lib/libflame.so $pkgdir/usr/lib/liblapack.so.${_lapackver}
    ln -s /usr/lib/libflame.so $pkgdir/usr/lib/liblapacke.so
    ln -s /usr/lib/libflame.so $pkgdir/usr/lib/liblapacke.so.${_lapackver}
    ln -s /usr/lib/pkgconfig/flame.pc ${pkgdir}/usr/lib/lapack.pc
    ln -s /usr/lib/pkgconfig/flame.pc ${pkgdir}/usr/lib/lapacke.pc
}
