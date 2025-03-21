# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Jason Chu <jason@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Stephen Caraher <moskvax@gmail.com>

_android_arch=riscv64

pkgname=android-${_android_arch}-libiec61883
pkgver=1.2.0
pkgrel=3
arch=('any')
pkgdesc="A higher level API for streaming DV, MPEG-2 and audio over Linux IEEE 1394 (Android ${_android_arch})"
url='https://www.kernel.org/pub/linux/libs/ieee1394/'
license=('LGPL')
groups=('android-libiec61883')
depends=("android-${_android_arch}-libraw1394")
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://www.kernel.org/pub/linux/libs/ieee1394/libiec61883-${pkgver}.tar.xz")
md5sums=('ed91bc1727fac8e019402fc3724a283d')

build() {
    cd "${srcdir}/libiec61883-${pkgver}"
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

    for d in src; do
        mkdir -p ${d}/.libs

        # Create object files

        find ${d} -type f -name '*.c' -print0 | while read -d $'\0' cfile; do
            cfilebn=$(basename -s .c "${cfile}")
            cmd="${CC} -I. ${CFLAGS} ${CPPFLAGS} -o ${d}/.libs/${cfilebn}.o -c ${cfile}"
            echo "${cmd}"
            ${cmd}
        done

        libname=libiec61883

        # Create static libraries

        cmd="${AR} rcs ${d}/.libs/${libname}.a ${d}/.libs/*.o"
        echo "${cmd}"
        ${cmd}

        # Create shared libraries

        cmd="${CC} ${LDFLAGS} -shared -o ${d}/.libs/${libname}.so ${d}/.libs/*.o -lraw1394"
        echo "${cmd}"
        ${cmd}
    done
}

package() {
    cd "${srcdir}/libiec61883-${pkgver}"
    source android-env ${_android_arch}

    # Install headers

    install -v -m 755 -d "${pkgdir}/${ANDROID_PREFIX_INCLUDE}/libiec61883/"
    install -v -m 644 src/iec61883.h "${pkgdir}/${ANDROID_PREFIX_INCLUDE}/libiec61883/"

    # Install pkgconfig file

    install -v -m 755 -d "${pkgdir}/${ANDROID_PREFIX_LIB}/pkgconfig/"
    install -v -m 644 *.pc "${pkgdir}/${ANDROID_PREFIX_LIB}/pkgconfig/"

    # Install libraries

    for d in src; do
        install -v -m 644 ${d}/.libs/*.so "${pkgdir}/${ANDROID_PREFIX_LIB}/"
        install -v -m 644 ${d}/.libs/*.a "${pkgdir}/${ANDROID_PREFIX_LIB}/"
    done

    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
