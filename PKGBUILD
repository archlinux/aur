# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Robert Emil Berge <filoktetes@linuxophic.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>

_android_arch=x86-64

pkgname=android-${_android_arch}-gavl
pkgver=1.4.0
pkgrel=2
arch=('any')
pkgdesc="Low level library, upon which multimedia APIs can be built (Android ${_android_arch})"
url='http://gmerlin.sourceforge.net/'
license=('GPL-2.0-or-later')
groups=('android-gavl')
depends=('android-ndk')
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://downloads.sourceforge.net/gmerlin/gavl-${pkgver}.tar.gz"
        '0001-Fix-monotonic-clock-check.patch'
        '0002-Fix-missing-headers.patch')
md5sums=('2752013a817fbc43ddf13552215ec2c0'
         '6c52b6b79372179e1856b9abb6abe3de'
         'c6dd47dce3ba771f93acbedec3046c83')

prepare() {
    cd "${srcdir}/gavl-${pkgver}"

    patch -Np1 -i ../0001-Fix-monotonic-clock-check.patch
    patch -Np1 -i ../0002-Fix-missing-headers.patch
    sed -i 's| -funroll-all-loops | |g' configure.ac

    autoreconf -fiv

    # Fix build
    sed -i 's|volume_test_LDADD = ../gavl/libgavl.la|volume_test_LDADD = -lm ../gavl/libgavl.la|' src/Makefile.{am,in}
    sed -i 's/LDFLAGS="$GMERLIN_DEP_RPATH"/LDFLAGS="$LDFLAGS $GMERLIN_DEP_RPATH"/' configure{,.ac}
}

build() {
    cd "${srcdir}/gavl-${pkgver}"
    source android-env ${_android_arch}

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

    android-${_android_arch}-configure \
        --host=${host} \
        --with-cpuflags=none \
        --without-doxygen
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/gavl-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
    mv -f "${pkgdir}/${ANDROID_PREFIX_LIB}"/libgavl.so.*.* "${pkgdir}/${ANDROID_PREFIX_LIB}/libgavl.so"
    rm -f "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so.*
}
