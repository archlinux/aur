# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: damir <damir@archlinux.org>

_android_arch=riscv64

pkgname=android-${_android_arch}-libcdio
pkgver=2.2.0
pkgrel=1
arch=('any')
pkgdesc="GNU Compact Disc Input and Control Library (Android ${_android_arch})"
url="https://www.gnu.org/software/libcdio/"
license=('GPL3')
groups=('android-libcdio')
depends=("android-${_android_arch}-ncurses")
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/libcdio/libcdio/archive/refs/tags/${pkgver}.tar.gz"
        '0001-Disable-version-script.patch')
md5sums=('4d8b34da5132738d3341378c301dbf3e'
         '525e9b67c213cdd524837c70401712d2')
validpgpkeys=('DAA63BC2582034A02B923D521A8DE5008275EC21') # R. Bernstein

prepare() {
    cd "${srcdir}/libcdio-${pkgver}"
    source android-env ${_android_arch}

    patch -Np1 -i ../0001-Disable-version-script.patch

    autoreconf -fiv
}

build() {
    cd "${srcdir}/libcdio-${pkgver}"
    source android-env ${_android_arch}

    # Platform specific patches
    case "${_android_arch}" in
        aarch64)
             host=armv8-android-linux
            ;;
        armv7a-eabi)
             host=armv7-android-linux
            ;;
        riscv64)
             host=riscv64-android-linux
            ;;
        x86)
             host=x86-android-linux
            ;;
        x86-64)
             host=x86_64-android-linux
            ;;
        *)
            ;;
    esac

    if [[ "${_android_arch}" = armv7a-eabi || "${_android_arch}" = x86 ]]; then
        export ac_cv_func_fseeko=no
        export ac_cv_func_fseeko64=no
    fi

    if [ "${ANDROID_MINIMUM_PLATFORM}" -lt 28 ]; then
        export ac_cv_header_glob_h=no
    fi

    ./configure \
        --host=${host} \
        --prefix="${ANDROID_PREFIX}" \
        --sysconfdir="${ANDROID_PREFIX_ETC}" \
        --localstatedir="${ANDROID_PREFIX_VAR}" \
        --disable-rpath \
        --disable-example-progs \
        --without-cd-drive \
        --without-cd-info \
        --without-cdda-player \
        --without-cd-read \
        --without-iso-info \
        --without-iso-read \
        --disable-vcd-info \
        --disable-cddb \
        --enable-maintainer-mode \
        --without-versioned-libs
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libcdio-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_BIN}"
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a

    sed -e "/define CDIO_LIBCDIO_SOURCE_PATH/s|.*|/* #undef CDIO_LIBCDIO_SOURCE_PATH */|" \
        -i "${pkgdir}/${ANDROID_PREFIX_INCLUDE}/cdio/cdio_config.h"
}
