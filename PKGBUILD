# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Martchus <martchus@gmx.net>

_android_arch=riscv64

pkgname=android-${_android_arch}-openssl
pkgver=3.6.1
pkgrel=1
arch=('any')
pkgdesc="The Open Source toolkit for Secure Sockets Layer and Transport Layer Security (Android ${_android_arch})"
url='https://www.openssl.org'
license=('Apache-2.0')
groups=('android-openssl')
depends=('android-ndk')
makedepends=('android-environment')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://www.openssl.org/source/openssl-${pkgver}.tar.gz")
md5sums=('589777dc85ebbfeca70161c0c384d572')

build() {
    cd "${srcdir}/openssl-${pkgver}"
    source android-env ${_android_arch}

    build_arch=

    case "${_android_arch}" in
        aarch64)
            build_arch=arm64
            ;;
        armv7a-eabi)
            build_arch=arm
            ;;
        riscv64)
            build_arch=riscv64

            export CFLAGS="${ANDROID_CFLAGS} -O1 -pipe"
            export CXXFLAGS="${ANDROID_CXXFLAGS} -O1 -pipe -fexceptions"
            export CPPFLAGS="${ANDROID_CPPFLAGS} -D_FORTIFY_SOURCE=2 -D__USE_FORTIFY_LEVEL=2 -isystem ${ANDROID_PREFIX_INCLUDE}"
            export LDFLAGS="${ANDROID_LDFLAGS} -Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now -L${ANDROID_PREFIX_LIB}"
            ;;
        x86)
            build_arch=x86
            ;;
        x86-64)
            build_arch=x86_64
            ;;
    esac

    export PATH="${ANDROID_TOOLCHAIN}/bin:${PATH}"

    ./Configure \
        --prefix="${ANDROID_PREFIX}" \
        --libdir="${ANDROID_PREFIX_LIB}" \
        --openssldir="${ANDROID_PREFIX}" \
        -U__ANDROID_API__ \
        -D__ANDROID_API__="${ANDROID_MINIMUM_PLATFORM}" \
        threads \
        shared \
        android-${build_arch} \
        no-stdio \
        no-ui-console \
        no-tests \
        no-docs \
        no-apps \
        no-legacy \
        no-asm

    # get rid of debug printing so the library doesn't depend on stdio (no-stdio and no-ui are not entirely sufficient)
    sed -i -e 's/\#define TEST_ENG_OPENSSL_RC4_P_INIT//' crypto/engine/eng_openssl.c

    # build only libraries
    # note: Setting SHLIB_EXT in accordance with qtbase/src/network/ssl/qsslsocket_openssl_symbols.cpp to avoid loading
    #       system library.
    make CALC_VERSIONS="SHLIB_COMPAT=; SHLIB_SOVER=" SHLIB_VERSION_NUMBER= SHLIB_EXT=.so build_libs $MAKEFLAGS
}

package() {
    cd "$srcdir/openssl-${pkgver}"
    source android-env ${_android_arch}

    # install header files, libraries and license
    for lib in libcrypto{.a,.so} libssl{.a,.so}; do
        install -Dm644 "${lib}" "${pkgdir}/${ANDROID_PREFIX_LIB}/${lib}"
    done

    for pc in libcrypto.pc libssl.pc openssl.pc; do
        install -Dm644 "${pc}" "${pkgdir}/${ANDROID_PREFIX_LIB}/pkgconfig/${pc}"
    done

    mkdir -p "${pkgdir}/${ANDROID_PREFIX_INCLUDE}"
    cp -r include/openssl "${pkgdir}/${ANDROID_PREFIX_INCLUDE}"

    # strip binaries
    find "${pkgdir}" -name 'lib*.so' -type f -exec "${ANDROID_STRIP}" --strip-unneeded {} \;
    find "${pkgdir}" -name 'lib*.a' -type f -exec "${ANDROID_STRIP}" -g {} \;

    install -vDm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
