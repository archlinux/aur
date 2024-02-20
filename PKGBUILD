# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

_android_arch=x86-64

pkgname=android-${_android_arch}-nspr
pkgver=4.35
pkgrel=1
arch=('any')
pkgdesc="Netscape Portable Runtime (android)"
url="https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSPR"
license=('MPL-2.0')
depends=('android-ndk')
makedepends=('android-configure'
             'zip')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v${pkgver}/src/nspr-${pkgver}.tar.gz"
        '0001-Fix-configure-file.patch')
sha256sums=('7ea3297ea5969b5d25a5dd8d47f2443cda88e9ee746301f6e1e1426f8a6abc8f'
            '1d83aad5546f7ee9f5e06f36e7ce9e49613edb2e3609e4e01c84a604f9195106')

prepare() {
    cd "${srcdir}/nspr-${pkgver}"
    source android-env ${_android_arch}

    patch -Np1 -i ../0001-Fix-configure-file.patch

    sed -i "s|@ANDROID_CC@|${ANDROID_CC}|g" nspr/configure
    sed -i "s|@ANDROID_CXX@|${ANDROID_CXX}|g" nspr/configure
    sed -i "s|@ANDROID_CPP@|cpp|g" nspr/configure
    sed -i "s|@ANDROID_AS@|${ANDROID_AS}|g" nspr/configure
    sed -i "s|@ANDROID_AR@|${ANDROID_AR}|g" nspr/configure
    sed -i "s|@ANDROID_LD@|${ANDROID_LD}|g" nspr/configure
    sed -i "s|@ANDROID_RANLIB@|${ANDROID_RANLIB}|g" nspr/configure
    sed -i "s|@ANDROID_STRIP@|${ANDROID_STRIP}|g" nspr/configure
}

build() {
    unset CFLAGS
    unset CXXFLAGS

    cd "${srcdir}/nspr-${pkgver}/nspr"
    source android-env ${_android_arch}

    # Platform specific patches
    case "$_android_arch" in
        aarch64)
                enable64bit='--enable-64bit'
            ;;
        x86-64)
                enable64bit='--enable-64bit'
            ;;
        *)
            ;;
    esac

    android-${_android_arch}-configure \
        --with-android-ndk="${ANDROID_NDK_HOME}" \
        --with-android-toolchain="${ANDROID_TOOLCHAIN}" \
        --with-android-platform="${ANDROID_PLATFORM}" \
        --with-android-version="${ANDROID_MINIMUM_PLATFORM}" \
        --includedir="${ANDROID_PREFIX_INCLUDE}/nspr" \
        $enable64bit \
        --enable-optimize \
        --disable-debug \
        --enable-64bit

    make \
        -C config \
        CC=/usr/bin/gcc \
        CXX=/usr/bin/g++ \
        CFLAGS=" -DXP_UNIX=1" \
        $MAKEFLAGS || true
    make \
      NSINSTALL=$(pwd)/config/nsinstall \
      RANLIB=${ANDROID_RANLIB} \
      $MAKEFLAGS
}

package() {
    cd "${srcdir}/nspr-${pkgver}/nspr"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm "$pkgdir/${ANDROID_PREFIX_BIN}"/{compile-et.pl,prerr.properties}
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
    ln -s nspr.pc "$pkgdir/${ANDROID_PREFIX_LIB}/pkgconfig/mozilla-nspr.pc"
    rm -r "$pkgdir/${ANDROID_PREFIX_INCLUDE}/nspr/md"
}
