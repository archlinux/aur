# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: damir <damir@archlinux.org>

_android_arch=riscv64

pkgbase=android-${_android_arch}-fftw
pkgname=("android-${_android_arch}-fftw"
         "android-${_android_arch}-fftw-openmpi")
pkgver=3.3.10
pkgrel=2
arch=('any')
pkgdesc="A library for computing the discrete Fourier transform (DFT) (Android ${_android_arch})"
url="http://www.fftw.org/"
license=('GPL-2.0-or-later')
groups=('android-fftw')
makedepends=('android-cmake'
             "android-${_android_arch}-openmpi")
options=(!strip !buildflags staticlibs !emptydirs)
source=("http://www.fftw.org/fftw-$pkgver.tar.gz")
md5sums=('8ccbf6a5ea78a16dbc3e1306e234cc5c')
_build_types=(single double long-double)
# Android's clang does not support quad precision
# _build_types+=(quad)
_soname=3.6.10

_pick() {
    local p="$1" f d; shift

    for f; do
        d="$srcdir/$p/${f#$pkgdir/}"
        mkdir -p "$(dirname "$d")"
        mv "$f" "$d"
        rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
    done
}

prepare() {
    cd "${srcdir}/fftw-${pkgver}"

    # fix wrong soname in FFTW3LibraryDepends.cmake
    sed -i "s/3.6.9/${_soname}/g" CMakeLists.txt
}

build() {
    cd "${srcdir}/fftw-${pkgver}"
    source android-env ${_android_arch}

    cmake_options=

    if [ "${_android_arch}" = x86* ]; then
        cmake_options="-DENABLE_AVX=ON -DENABLE_AVX2=ON -DENABLE_SSE=ON -DENABLE_SSE2=ON"
    fi

    # create missing FFTW3LibraryDepends.cmake
    # https://bugs.archlinux.org/task/67604
    android-${_android_arch}-cmake \
        -S . \
        -B build \
        -DCMAKE_POLICY_DEFAULT_CMP0057=NEW \
        -DBUILD_TESTS=OFF \
        -DDISABLE_FORTRAN=ON \
        -DENABLE_OPENMP=ON \
        -DENABLE_THREADS=ON \
        -DENABLE_FLOAT=ON \
        -DENABLE_LONG_DOUBLE=ON \
        -DENABLE_QUAD_PRECISION=ON \
        -Wno-dev \
        ${cmake_options}

    # fix broken IMPORTED_LOCATION: https://github.com/FFTW/fftw3/issues/130#issuecomment-1030280157
    sed -i "s|\(IMPORTED_LOCATION_NONE\).*|\1 \"${ANDROID_PREFIX_LIB}/libfftw3.so.3\"|g" build/FFTW3LibraryDepends.cmake

    export MPICC=${CC}

    # use upstream default CFLAGS while keeping our -march/-mtune
    export CFLAGS="${CFLAGS} -O3 -fomit-frame-pointer -malign-double -fstrict-aliasing -ffast-math"

    # riscv64
    # ../../../../simd-support/simd-neon.h:../../../../simd-support/simd-neon.h47::472::2 : error: error: "compiling simd-neon.h requires -mfpu=neon or equivalent""compiling simd-neon.h requires -mfpu=neon or equivalent"

    for precision in "${_build_types[@]}"; do
        mkdir -p build-${precision} && pushd build-${precision}
            configure_options=

            case "${precision}" in
                single)
                    configure_options='--enable-single'

                    case "${_android_arch}" in
                        x86*)
                            configure_options="${configure_options} --enable-avx --enable-sse"
                            ;;
                        aarch64|armv7a-eabi)
                            configure_options="${configure_options} --enable-neon"
                            ;;
                    esac
                    ;;
                double)
                    if [ "${_android_arch}" = x86* ]; then
                        configure_options="${configure_options} --enable-avx --enable-sse2"
                    fi
                    ;;
                long-double)
                    configure_options="${configure_options} --enable-long-double"
                    ;;
                quad)
                    configure_options="${configure_options} --disable-mpi --enable-quad-precision"
                    ;;
            esac

            case "${_android_arch}" in
                aarch64)
                    configure_options="${configure_options} --enable-armv8-cntvct-el0 --enable-armv8-pmccntr-el0"
                    ;;
                armv7a-eabi)
                    configure_options="${configure_options} --enable-armv7a-pmccntr"
#                     configure_options="${configure_options} --enable-armv7a-cntvct"
                    ;;
                *)
                    ;;
            esac

            target=${_android_arch/x86-/x86_}-linux-android
            ../configure \
                --host=${target} \
                --target=${target} \
                --build=${CHOST} \
                --prefix=${ANDROID_PREFIX} \
                --libdir=${ANDROID_PREFIX_LIB} \
                --includedir=${ANDROID_PREFIX_INCLUDE} \
                --enable-shared \
                --enable-static \
                --disable-doc \
                --disable-fortran \
                --enable-threads \
                --enable-mpi \
                --enable-openmp \
                MPILIBS="-Wl,-rpath -Wl,${ANDROID_PREFIX_LIB} -Wl,--enable-new-dtags -lmpi" \
                ${configure_options}
            # fix overlinking because of libtool
            sed -i 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
            make $MAKEFLAGS
        popd
    done
}

package_android-riscv64-fftw() {
    depends=('android-ndk')
    optdepends=("android-${_android_arch}-fftw-openmpi: for OpenMPI integration")

    cd "${srcdir}/fftw-${pkgver}"
    source android-env ${_android_arch}

    for precision in "${_build_types[@]}"; do
        make -C build-${precision} DESTDIR="${pkgdir}" install
    done

    rm -rf "${pkgdir}/${ANDROID_PREFIX_BIN}"
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a

    _pick fftw-openmpi "${pkgdir}/${ANDROID_PREFIX_INCLUDE}"/fftw3-mpi.h
    _pick fftw-openmpi "${pkgdir}/${ANDROID_PREFIX_INCLUDE}"/fftw3{,l}-mpi.f03
    _pick fftw-openmpi "${pkgdir}/${ANDROID_PREFIX_LIB}"/libfftw3{,f,l}_mpi.{a,so}

    # install missing FFTW3LibraryDepends.cmake
    install -vDm 644 build/FFTW3LibraryDepends.cmake -t "${pkgdir}/${ANDROID_PREFIX_LIB}/cmake/fftw3/"
}

package_android-riscv64-fftw-openmpi() {
    pkgdesc+=" - OpenMPI libraries (Android ${_android_arch})"
    depends=("android-${_android_arch}-fftw"
             "android-${_android_arch}-openmpi")

    mv -v "${srcdir}/fftw-openmpi"/* "${pkgdir}"
}
