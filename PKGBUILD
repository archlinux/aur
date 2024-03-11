# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Anatol Pomozov <anatol dot pomozov at gmail>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-openmpi

if [[ "${_android_arch}" == armv7a-eabi || "${_android_arch}" == x86 ]]; then
    pkgver=4.1.6
    is_32_bits=true
else
    pkgver=5.0.2
fi

pkgrel=2
arch=('any')
pkgdesc="High performance message passing library (MPI) (Android, ${_android_arch})"
url='https://www.open-mpi.org'
license=('BSD-3-Clause AND LicenseRef-MPICH')
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
source=("https://www.open-mpi.org/software/ompi/v${pkgver%.*}/downloads/openmpi-$pkgver.tar.bz2"
        '0001-Remove-shmctl.patch'
        '0002-Remove-getdtablesize.patch'
        '0003-Disable-address-patch-in-x86.patch')

if [ "${is_32_bits}" == true ]; then
    _src_md5sum='c9b1c974cfc23c77c0fbdb965cd58a1c'
else
    _src_md5sum='047ea0985b79d30d5a24ee72cbf5f4bf'
fi

md5sums=(${_src_md5sum}
         '137c5041b5a3a47574b5630b0ff82b4e'
         '34b93930fb47257b3a77e51bd2a13de6'
         'f4b8f79f3f0cc039d2fcfca113e419e8')

prepare() {
    cd "${srcdir}/openmpi-$pkgver"
    source android-env ${_android_arch}

    export PERL=perl

    if [ "${is_32_bits}" == true ]; then
        pushd config
            autom4te --language=m4sh opal_get_version.m4sh -o opal_get_version.sh
        popd

        autoreconf -fi || true
    fi

    if [ "${ANDROID_MINIMUM_PLATFORM}" -lt 26 ]; then
        patch -Np1 -i ../0001-Remove-shmctl.patch
    fi

    if [ "${is_32_bits}" == true ]; then
        patch -Np1 -i ../0002-Remove-getdtablesize.patch

        if [ "${_android_arch}" == x86 ]; then
            patch -Np1 -i ../0003-Disable-address-patch-in-x86.patch
        fi
    fi

    # workaround for https://github.com/open-mpi/ompi/issues/12257
    sed -i 's|WRAPPER__FCFLAGS|WRAPPER_FCFLAGS|g' configure
    sed -i 's|WRAPPER_EXTRA_FCFLAGS|WRAPPER_FCFLAGS|g' configure
    sed -i "s|\"-I${ANDROID_PREFIX_INCLUDE}\",||" opal/tools/wrappers/opal_wrapper.c

    malloc_fname=opal_malloc
    mv -f opal/util/malloc.h "opal/util/${malloc_fname}.h"

    if [ "${is_32_bits}" == true ]; then
        sed -i "s|opal/util/malloc.h|opal/util/${malloc_fname}.h|g" opal/runtime/opal_cr.c
        sed -i "s|opal/util/malloc.h|opal/util/${malloc_fname}.h|g" orte/mca/ess/env/ess_env_module.c
        sed -i "s|opal/util/malloc.h|opal/util/${malloc_fname}.h|g" orte/mca/ess/hnp/ess_hnp_module.c
    else
        sed -i "s|opal/util/malloc.h|opal/util/${malloc_fname}.h|g" opal/runtime/opal_init_core.c
    fi

    sed -i "s|opal/util/malloc.h|opal/util/${malloc_fname}.h|g" opal/include/opal_config_bottom.h
    sed -i "s|opal/util/malloc.h|opal/util/${malloc_fname}.h|g" opal/runtime/opal_finalize.c
    sed -i "s|opal/util/malloc.h|opal/util/${malloc_fname}.h|g" opal/runtime/opal_init.c
    sed -i "s|opal/util/malloc.h|opal/util/${malloc_fname}.h|g" opal/util/malloc.c

    if [ "${is_32_bits}" == true ]; then
        sed -i "s| malloc.h | ${malloc_fname}.h |g" configure
        sed -i "s| malloc.h | ${malloc_fname}.h |g" configure.ac
    fi

    sed -i "s| malloc.h | ${malloc_fname}.h |g" opal/util/Makefile.am
    sed -i "s| malloc.h | ${malloc_fname}.h |g" opal/util/Makefile.in
    sed -i "s|rindex|strrchr|g" oshmem/mca/memheap/base/memheap_base_static.c

    if [ "${is_32_bits}" == true ]; then
        sed -i "s|rindex|strrchr|g" orte/mca/plm/rsh/plm_rsh_module.c
    fi

    if [ "${is_32_bits}" == true ]; then
        sed -i 's|bcmp|memcmp|g' ompi/mca/topo/treematch/treematch/tm_malloc.c
    else
        sed -i 's|bcmp|memcmp|g' 3rd-party/treematch/tm_malloc.c
    fi
}

build() {
    cd "${srcdir}/openmpi-$pkgver"
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
        x86)
             host=x86-unknown-linux
            ;;
        x86-64)
             host=x86_64-unknown-linux
            ;;
        *)
            ;;
    esac

    default_android_pp_flags="-fPIC -D_FORTIFY_SOURCE=2 -DEXFS_SUPER_MAGIC=0x45584653 -I${ANDROID_PREFIX_INCLUDE}"
    default_android_compiler_flags="-fPIC -DEXFS_SUPER_MAGIC=0x45584653 -O2 -pipe -fno-plt -fexceptions --param=ssp-buffer-size=4"
    default_android_linker_flags="-DEXFS_SUPER_MAGIC=0x45584653 -Wl,-O1,--sort-common,--as-needed"

    export CPPFLAGS="${CPPFLAGS} $default_android_pp_flags"
    export CFLAGS="${CFLAGS} $default_android_compiler_flags"
    export CXXFLAGS="${CXXFLAGS} $default_android_compiler_flags"
    export LDFLAGS="${LDFLAGS} $default_android_linker_flags"

    export PERL=perl

    # TODO: remove ac_cv_func_sem_open=no when there is a glibc release fixing https://sourceware.org/bugzilla/show_bug.cgi?id=30789
    ac_cv_func_sem_open=no ./configure \
        --host=${host} \
        --prefix=${ANDROID_PREFIX} \
        --libdir=${ANDROID_PREFIX_LIB} \
        --includedir=${ANDROID_PREFIX_INCLUDE} \
        --sysconfdir="${ANDROID_PREFIX_ETC}/openmpi" \
        --enable-shared \
        --enable-static \
        --enable-builtin-atomics \
        --enable-pretty-print-stacktrace \
        --disable-mpi-fortran \
        --disable-oshmem-fortran \
        --disable-sphinx \
        --with-hwloc=external \
        --with-libevent=external \
        --with-pmix=external \
        --with-prrte=external
    make V=1 $MAKEFLAGS
}

package() {
    cd "${srcdir}/openmpi-$pkgver"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -f "$pkgdir/${ANDROID_PREFIX_BIN}"/*
    rm -rf "$pkgdir/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
    rm -f "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so.*
}
