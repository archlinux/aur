# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Anatol Pomozov <anatol dot pomozov at gmail>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>

_android_arch=aarch64

pkgname=android-${_android_arch}-openmpi
pkgver=5.0.8
pkgrel=1
arch=('any')
pkgdesc="High performance message passing library (MPI) (Android ${_android_arch})"
url='https://www.open-mpi.org'
license=('BSD-3-Clause AND LicenseRef- MPICH')
groups=('android-openmpi')
depends=("android-${_android_arch}-hwloc"
         "android-${_android_arch}-libevent"
         "android-${_android_arch}-libfabric"
         "android-${_android_arch}-libnl"
         "android-${_android_arch}-openpmix"
         "android-${_android_arch}-prrte"
         "android-${_android_arch}-zlib")
makedepends=("android-${_android_arch}-hwloc"
             "android-${_android_arch}-libfabric"
             "android-${_android_arch}-libnl"
             "android-${_android_arch}-openpmix"
             "android-${_android_arch}-prrte"
             "android-${_android_arch}-zlib"
             'android-environment')
optdepends=("android-${_android_arch}-openssh: for execution on remote hosts via plm_ssh_agent")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://www.open-mpi.org/software/ompi/v${pkgver%.*}/downloads/openmpi-${pkgver}.tar.bz2"
        '0001-Remove-shmctl.patch'
        '0004-Remove-getifaddrs.patch'
        '0006-Add-missing-headers.patch'
        '0007-Fix-missing-macros.patch'
        '0008-Force-32-bit-build.patch')
md5sums=('22ba6092cca432bfca4e3e783d428160'
         '137c5041b5a3a47574b5630b0ff82b4e'
         '49fc1b27cf765f847ce5350a0b38d3f4'
         '15e07e34a261129ccc56fe58d115827e'
         '2801669c30f3f834ee56b5b0eeef9206'
         '44d0ecc271eea6fc0722f02c4bd1c001')

prepare() {
    cd "${srcdir}/openmpi-${pkgver}"
    source android-env ${_android_arch}

    patch -Np1 -i ../0008-Force-32-bit-build.patch

    if [ "${ANDROID_MINIMUM_PLATFORM}" -lt 26 ]; then
        patch -Np1 -i ../0001-Remove-shmctl.patch
    fi

    patch -Np1 -i ../0006-Add-missing-headers.patch
    patch -Np1 -i ../0007-Fix-missing-macros.patch

    if [ "${ANDROID_MINIMUM_PLATFORM}" -lt 24 ]; then
        patch -Np1 -i ../0004-Remove-getifaddrs.patch
    fi

    sed -i "s|\"-I${ANDROID_PREFIX_INCLUDE}\",||" opal/tools/wrappers/opal_wrapper.c

    malloc_fname=opal_malloc
    mv -f opal/util/malloc.h "opal/util/${malloc_fname}.h"

    sed -i "s|opal/util/malloc.h|opal/util/${malloc_fname}.h|g" opal/runtime/opal_init_core.c
    sed -i "s|opal/util/malloc.h|opal/util/${malloc_fname}.h|g" opal/include/opal_config_bottom.h
    sed -i "s|opal/util/malloc.h|opal/util/${malloc_fname}.h|g" opal/runtime/opal_finalize.c
    sed -i "s|opal/util/malloc.h|opal/util/${malloc_fname}.h|g" opal/runtime/opal_init.c
    sed -i "s|opal/util/malloc.h|opal/util/${malloc_fname}.h|g" opal/util/malloc.c
    sed -i "s| malloc.h | ${malloc_fname}.h |g" opal/util/Makefile.am
    sed -i "s| malloc.h | ${malloc_fname}.h |g" opal/util/Makefile.in
    sed -i 's|bcmp|memcmp|g' 3rd-party/treematch/tm_malloc.c
    sed -i 's|LDFLAGS -no-undefined|LDFLAGS|g' configure
}

build() {
    cd "${srcdir}/openmpi-${pkgver}"
    source android-env ${_android_arch}

    # set environment variables for reproducible build
    # see https://github.com/open-mpi/ompi/blob/main/docs/release-notes/general.rst
    export HOSTNAME=buildhost
    export USER=builduser

    # Platform specific patches
    case "$_android_arch" in
        aarch64)
             host=armv8-unknown-linux
            ;;
        armv7a-eabi)
             host=armv7-unknown-linux
            ;;
        riscv64)
             host=riscv64-unknown-linux
            ;;
        x86)
             host=x86-unknown-linux
            ;;
        x86-64)
             host=x86_64-unknown-linux
            ;;
        *)
            ;;
    esac

    export CPPFLAGS="${CPPFLAGS} -fPIC -DEXFS_SUPER_MAGIC=0x45584653"
    export CFLAGS="${CFLAGS} -fPIC -DEXFS_SUPER_MAGIC=0x45584653"
    export CXXFLAGS="${CXXFLAGS} -fPIC -DEXFS_SUPER_MAGIC=0x45584653"

    export PERL=perl

    # TODO: remove ac_cv_func_sem_open=no when there is a glibc release fixing https://sourceware.org/bugzilla/show_bug.cgi?id=30789
    ac_cv_func_sem_open=no ./configure \
        --host="${host}" \
        --prefix="${ANDROID_PREFIX}" \
        --libdir="${ANDROID_PREFIX_LIB}" \
        --includedir="${ANDROID_PREFIX_INCLUDE}" \
        --sysconfdir="${ANDROID_PREFIX_ETC}/openmpi" \
        --enable-shared \
        --enable-static \
        --enable-builtin-atomics \
        --enable-pretty-print-stacktrace \
        --enable-sphinx=no \
        --enable-binaries=no \
        --enable-pmix-binaries=no \
        --disable-mpi-fortran \
        --disable-oshmem-fortran \
        --with-tests-examples=no \
        --with-hwloc=external \
        --with-libevent=external \
        --with-pmix=external \
        --with-prrte=external
    sed -i 's| test docs||g' Makefile
    make V=1 $MAKEFLAGS
}

package() {
    cd "${srcdir}/openmpi-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_BIN}"
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
    rm -f "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so.*
}
