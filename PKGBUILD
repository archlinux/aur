# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

_android_arch=x86-64

pkgname=android-${_android_arch}-cdparanoia
pkgver=10.2
pkgrel=2
arch=('any')
pkgdesc="Compact Disc Digital Audio extraction tool (Android ${_android_arch})"
url="https://www.xiph.org/paranoia/"
license=('GPL')
groups=('android-cdparanoia')
depends=('android-ndk')
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://downloads.xiph.org/releases/cdparanoia/cdparanoia-III-${pkgver}.src.tgz"
        'cdparanoia-10.2-format-security.patch' # Patch from Fedora
        'cdparanoia-10.2-ldflags.patch' # Patch from Fedora
        'cdparanoia-r15388.patch' # svn diff -c 15338 https://svn.xiph.org/trunk/cdparanoia/
        '0004-Remove-cuserid.patch')
md5sums=('b304bbe8ab63373924a744eac9ebc652'
         'a7d8278251307563458159f6c6473e79'
         '53d48ee17185a9b0fec2acda85528f8b'
         '36e0f3d1b91cb63bc290238370fefbca'
         'f1f349b7b1fcd6ac1549142a7ecec284')

prepare() {
    cd "${srcdir}/cdparanoia-III-${pkgver}"

    # Fix for 'private' becoming a reserved keyword as of GCC 4.3+
    patch -Np1 -i ../cdparanoia-r15388.patch
    # Add missing printf format strings for `-Wformat -Werror=format-security`
    patch -Np1 -i ../cdparanoia-10.2-format-security.patch
    # Use LDFLAGS
    patch -Np1 -i ../cdparanoia-10.2-ldflags.patch

    patch -Np1 -i ../0004-Remove-cuserid.patch

    sed -i 's| -lrt||g' Makefile.in
    sed -i 's| -lrt||g' interface/Makefile.in
}

build() {
    cd "${srcdir}/cdparanoia-III-${pkgver}"
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

    export ac_cv_type_short=yes
    export ac_cv_type_int=yes
    export ac_cv_type_long=yes
    export ac_cv_type_long_long=yes
    export ac_cv_type_int16_t=yes
    export ac_cv_type_int32_t=yes

    if [[ "${_android_arch}" = armv7a-eabi || "${_android_arch}" = x86 ]]; then
        export ac_cv_sizeof_short=2
        export ac_cv_sizeof_int=4
        export ac_cv_sizeof_long=4
        export ac_cv_sizeof_long_long=8
    else
        export ac_cv_sizeof_short=2
        export ac_cv_sizeof_int=4
        export ac_cv_sizeof_long=8
        export ac_cv_sizeof_long_long=8
    fi

    export CFLAGS="${CFLAGS} -fPIC"

    android-${_android_arch}-configure \
        --host=${host}
    make $MAKEFLAGS lib slib
}

package() {
    cd "${srcdir}/cdparanoia-III-${pkgver}"
    source android-env ${_android_arch}

    # Install headers

    install -d -m 0755 "${pkgdir}/${ANDROID_PREFIX_INCLUDE}"
    install -m 0644 paranoia/cdda_paranoia.h "${pkgdir}/${ANDROID_PREFIX_INCLUDE}"
    install -m 0644 interface/cdda_interface.h "${pkgdir}/${ANDROID_PREFIX_INCLUDE}"
    install -m 0644 utils.h "${pkgdir}/${ANDROID_PREFIX_INCLUDE}"

    # Install libraries

    install -d -m 0755 "${pkgdir}/${ANDROID_PREFIX_LIB}"
    install -m 0644 paranoia/libcdda_paranoia.so "${pkgdir}/${ANDROID_PREFIX_LIB}"
    install -m 0644 paranoia/libcdda_paranoia.a "${pkgdir}/${ANDROID_PREFIX_LIB}"
    install -m 0644 interface/libcdda_interface.so "${pkgdir}/${ANDROID_PREFIX_LIB}"
    install -m 0644 interface/libcdda_interface.a "${pkgdir}/${ANDROID_PREFIX_LIB}"

    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
