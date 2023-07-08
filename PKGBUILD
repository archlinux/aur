# Maintainer: David Wells <drwells.aur at fastmail dot com>

pkgname=p4est-deal-ii
_realname=p4est
pkgver=2.8.5
pkgrel=1
pkgdesc="The parallel forest (p4est) library, built to work with deal.II (i.e., the deal-ii package)"
arch=("i686" "x86_64")
url="http://www.p4est.org/"
# formally p4est is GPL2, but some bundled components are MIT
license=('GPL2' 'MIT')
options=('libtool')
# There is no way to disable building with lua if it is detected, so, for the
# sake of reproducibility, require it.
depends=('openmpi' 'zlib' 'lua' 'gcc-fortran')
makedepends=('gcc-fortran')
source=(https://p4est.github.io/release/p4est-$pkgver.tar.gz)

sha1sums=('4c1424b263379a022375289bac40cd30bad4a35c')

install_dir=/opt/$pkgname/

build() {
    build_dir="$srcdir/$_realname-$pkgver"
    build_fast_dir="$build_dir/FAST"
    build_debug_dir="$build_dir/DEBUG"

    cd $build_dir

    mkdir -p $build_fast_dir
    mkdir -p $build_debug_dir

    CFLAGS_FAST="$CFLAGS -g"
    CFLAGS_DEBUG="$DEBUG_CFLAGS"
    # the standard optimized and debug flags are '-O2' and '-O0 -g' for
    # p4est. This PKGBUILD defaults to the system settings instead: uncomment
    # the next two lines to restore the defaults found in the original p4est
    # build script packaged with deal.II.
    # CFLAGS_FAST="-O2"
    # CFLAGS_DEBUG="-O0 -g"

    disabled_packages=" --without-petsc --without-metis --without-blas"
    disabled_packages+=" --without-lint"
    options=" --enable-mpi --enable-shared --disable-vtk-binary"
    options+=" --disable-mpithread --with-gnu-ld --enable-static=no"
    cpp_flags=" -DSC_LOG_PRIORITY=SC_LP_ESSENTIAL"

    # build the optimized version
    cd $build_fast_dir
    "${build_dir}/configure"                                                   \
        $disabled_packages $options --prefix=$install_dir/FAST                 \
        CFLAGS="$CFLAGS_FAST" CPPFLAGS="$cpp_flags"

    make -C sc $MAKEFLAGS
    make $MAKEFLAGS

    # build the debug version
    cd $build_debug_dir
    "${build_dir}/configure"                                                   \
        $disabled_packages $options --prefix=$install_dir/DEBUG                \
        CFLAGS="$CFLAGS_DEBUG" CPPFLAGS="$cpp_flags"

    make -C sc $MAKEFLAGS
    make $MAKEFLAGS

    cd $build_dir
    echo "export P4EST_DIR=$install_dir" > ./p4est-deal-ii.sh
}

check() {
    build_dir="$srcdir/$_realname-$pkgver"
    build_fast_dir="$build_dir/FAST"
    build_debug_dir="$build_dir/DEBUG"

    cd $build_debug_dir
    make check

    cd $build_fast_dir
    make check
}

package() {
    build_dir="$srcdir/$_realname-$pkgver"
    build_fast_dir="$build_dir/FAST"
    build_debug_dir="$build_dir/DEBUG"

    cd $build_fast_dir
    make DESTDIR="$pkgdir/" install
    cd $build_debug_dir
    make DESTDIR="$pkgdir/" install

    install -D -m644 "${srcdir}/${_realname}-$pkgver/sc/iniparser/LICENSE" \
            "${pkgdir}/usr/share/licenses/${_realname}-$pkgver/sc/iniparser/LICENSE"
    install -D -m644 "${srcdir}/${_realname}-$pkgver/sc/libb64/LICENSE" \
            "${pkgdir}/usr/share/licenses/${_realname}-$pkgver/sc/libb64/LICENSE"
    install -D -m644 "${srcdir}/${_realname}-$pkgver/README" \
            "${pkgdir}/usr/share/licenses/${_realname}-$pkgver/license.txt"

    install -D -m755 "${build_dir}/p4est-deal-ii.sh" "${pkgdir}/etc/profile.d/p4est-deal-ii.sh"
}
