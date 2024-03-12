# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Contributor: David Runge <dvzrv@archlinux.org>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-prrte
pkgver=3.0.4
pkgrel=2
arch=('any')
pkgdesc="PMIx Reference RunTime Environment (Android, ${_android_arch})"
url="https://github.com/openpmix/prrte"
license=('BSD-3-Clause')
depends=("android-${_android_arch}-hwloc"
         "android-${_android_arch}-libevent"
         "android-${_android_arch}-openpmix")
makedepends=("android-${_android_arch}-hwloc"
             "android-${_android_arch}-libevent"
             "android-${_android_arch}-openpmix"
             'android-environment'
             'perl')
optdepends=("android-${_android_arch}-openssh: for execution on remote hosts via plm_ssh_agent")
source=("$url/releases/download/v$pkgver/prrte-$pkgver.tar.gz"
        'prte-mca-params.conf'
        'prrte-ssh'
        '0001-Force-32-bits-compile.patch'
        '0002-Unversioned-libs.patch'
        '0003-Remove-getdtablesize.patch')
options=(!strip !buildflags staticlibs !emptydirs)
md5sums=('0ad393b5f180c78858d4deb16123af4c'
         '846d0affc94d41dafa76adb72abe210b'
         'aed50d2a9dae9f25179547c76332eae2'
         '33b8d8a53fb67b636835e9e3e955ff77'
         '47db6b8ab5894753aa4c508f64c75389'
         '7ff35a9373c7aae9bd177312833388c0')

prepare() {
    cd "$srcdir/prrte-$pkgver"
    source android-env ${_android_arch}

    ./autogen.pl

    # append our options to the system config file
    cat ../prte-mca-params.conf >> src/etc/prte-mca-params.conf

    patch -Np1 -i ../0001-Force-32-bits-compile.patch
    patch -Np1 -i ../0002-Unversioned-libs.patch
    patch -Np1 -i ../0003-Remove-getdtablesize.patch
    sed -i 's|-lpthreads||g' configure
    sed -i 's|-lpthread||g' configure

    malloc_fname=prrte_malloc
    mv -f src/util/malloc.h "src/util/${malloc_fname}.h"

    sed -i "s|src/util/malloc.h|src/util/${malloc_fname}.h|g" src/mca/ess/env/ess_env_module.c
    sed -i "s|src/util/malloc.h|src/util/${malloc_fname}.h|g" src/mca/ess/hnp/ess_hnp_module.c
    sed -i "s|src/util/malloc.h|src/util/${malloc_fname}.h|g" src/runtime/prte_init.c
    sed -i "s|src/util/malloc.h|src/util/${malloc_fname}.h|g" src/util/malloc.c
    sed -i "s| malloc.h | ${malloc_fname}.h |g" src/util/Makefile.am
    sed -i "s| malloc.h | ${malloc_fname}.h |g" src/util/Makefile.in
    sed -i "s|rindex|strrchr|g" src/mca/plm/ssh/plm_ssh_module.c
}

build() {
    cd "$srcdir/prrte-$pkgver"
    source android-env ${_android_arch}

    # set environment variables for reproducible build
    # see https://docs.prrte.org/en/latest/release-notes.html
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

    default_android_pp_flags="-D_FORTIFY_SOURCE=2 -I${ANDROID_PREFIX_INCLUDE}"
    default_android_compiler_flags="-O2 -pipe -fno-plt -fexceptions --param=ssp-buffer-size=4"
    default_android_linker_flags="-Wl,-O1,--sort-common,--as-needed"

    export CPPFLAGS="${CPPFLAGS} $default_android_pp_flags"
    export CFLAGS="${CFLAGS} $default_android_compiler_flags"
    export CXXFLAGS="${CXXFLAGS} $default_android_compiler_flags"
    export LDFLAGS="${LDFLAGS} $default_android_linker_flags"

    ./configure \
        --host=${host} \
        --prefix=${ANDROID_PREFIX} \
        --libdir=${ANDROID_PREFIX_LIB} \
        --includedir=${ANDROID_PREFIX_INCLUDE} \
        --enable-shared \
        --enable-static \
        --sysconfdir="${ANDROID_PREFIX_ETC}/prtte" \
        --with-pmix="${ANDROID_PREFIX}" \
        --with-pmix-libdir="${ANDROID_PREFIX_LIB}"
    make V=1 $MAKEFLAGS
}

package() {
    cd "$srcdir/prrte-$pkgver"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -f "$pkgdir/${ANDROID_PREFIX_BIN}"/*
    rm -rf "$pkgdir/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
    rm -f "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so.*

    # install our dummy ssh wrapper
    install -vDm 755 ../prrte-ssh -t "$pkgdir/${ANDROID_PREFIX_BIN}/"
}
