# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: damir <damir@archlinux.org>
# Contributor: Robert Emil Berge <robert@rebi.no>

_android_arch=riscv64

pkgname=android-${_android_arch}-libavc1394
pkgver=0.5.4
pkgrel=3
arch=('any')
pkgdesc="Library to control A/V devices using the 1394 TA AV/C commands (Android ${_android_arch})"
url='https://sourceforge.net/projects/libavc1394/'
license=('GPL-2.0-or-later AND LGPL-2.1-or-later')
groups=('android-libavc1394')
depends=("android-${_android_arch}-libraw1394")
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://downloads.sourceforge.net/libavc1394/libavc1394-${pkgver}.tar.gz")
md5sums=('caf0db059d8b8d35d6f08e6c0e1c7dfe')

build() {
    cd "${srcdir}/libavc1394-${pkgver}"
    source android-env ${_android_arch}

    # Platform specific patches
    case "${_android_arch}" in
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

    android-${_android_arch}-configure \
        --host=${host}

    export CFLAGS="${CFLAGS} -fPIC"
    export LDFLAGS="${LDFLAGS} -Wl,--no-undefined"

    for d in common libavc1394 librom1394; do
        mkdir -p ${d}/.libs

        # Create object files

        find ${d} -type f -name '*.c' -print0 | while read -d $'\0' cfile; do
            cfilebn=$(basename -s .c "${cfile}")
            cmd="${CC} -I. ${CFLAGS} ${CPPFLAGS} -o ${d}/.libs/${cfilebn}.o -c ${cfile}"
            echo "${cmd}"
            ${cmd}
        done

        # Create static libraries

        libname=${d}

        if [ "${d}" = common ]; then
            libname=libraw1394util
        fi

        cmd="${AR} rcs ${d}/.libs/${libname}.a ${d}/.libs/*.o"
        echo "${cmd}"
        ${cmd}
    done

    # Create shared libraries

    for d in libavc1394 librom1394; do
        cmd="${CC} ${LDFLAGS} -Lcommon/.libs -shared -o ${d}/.libs/${d}.so ${d}/.libs/*.o -lraw1394util -lraw1394"
        echo "${cmd}"
        ${cmd}
    done
}

package() {
    cd "${srcdir}/libavc1394-${pkgver}"
    source android-env ${_android_arch}

    # Install headers

    install -v -m 755 -d "${pkgdir}/${ANDROID_PREFIX_INCLUDE}/libavc1394/"
    install -v -m 644 libavc1394/avc1394.h "${pkgdir}/${ANDROID_PREFIX_INCLUDE}/libavc1394/"
    install -v -m 644 libavc1394/avc1394_vcr.h "${pkgdir}/${ANDROID_PREFIX_INCLUDE}/libavc1394/"
    install -v -m 644 librom1394/rom1394.h "${pkgdir}/${ANDROID_PREFIX_INCLUDE}/libavc1394/"

    # Install pkgconfig file

    install -v -m 755 -d "${pkgdir}/${ANDROID_PREFIX_LIB}/pkgconfig/"
    install -v -m 644 libavc1394.pc "${pkgdir}/${ANDROID_PREFIX_LIB}/pkgconfig/"

    # Install libraries

    for d in libavc1394 librom1394; do
        install -v -m 644 ${d}/.libs/*.so "${pkgdir}/${ANDROID_PREFIX_LIB}/"
        install -v -m 644 ${d}/.libs/*.a "${pkgdir}/${ANDROID_PREFIX_LIB}/"
    done

    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
