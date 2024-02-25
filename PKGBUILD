# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_android_arch=x86

pkgname=android-${_android_arch}-nss
pkgver=3.98
pkgrel=1
arch=('any')
pkgdesc="Network Security Services"
url="https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS"
license=('MPL-2.0')
depends=("android-${_android_arch}-nspr>=4.35"
         "android-${_android_arch}-p11-kit>=0.23.19"
         "android-${_android_arch}-sqlite"
         "android-${_android_arch}-zlib")
makedepends=(clang
             perl
             python
             zip)
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://ftp.mozilla.org/pub/security/nss/releases/NSS_${pkgver//./_}_RTM/src/nss-${pkgver}.tar.gz"
        'Linux.mk.patch'
        'FreeblMakefile.patch'
        'mpcpucache.c.patch')
sha256sums=('f549cc33d35c0601674bfacf7c6ad683c187595eb4125b423238d3e9aa4209ce'
            '79d959a1af5f00e4515e930121eb12cc8927d3ee8730b0cbfb3fd005c1075f7f'
            '957675d7a34c56c388057348941d2ab814ba9e94648c79c4285bc19de8ddd6fc'
            '7e0eaf3111942f46e503464957f25b2d36a1b24b91adc6a6a858e209e0c0e27f')

prepare() {
    cd "${srcdir}/nss-${pkgver}"

    patch -Np1 -i ../Linux.mk.patch
    patch -Np1 -i ../FreeblMakefile.patch

    # Platform specific patches
    case "$_android_arch" in
        armv7a-eabi)
                patch -Np1 -i ../mpcpucache.c.patch
            ;;
        *)
            ;;
    esac
}

build() {
    cd "${srcdir}/nss-${pkgver}/nss"
    source android-env ${_android_arch}

    # Platform specific patches
    case "$_android_arch" in
        aarch64 | x86-64)
                cpuTag=_64
                enable64bit='USE_64=1'
            ;;
        *)
            ;;
    esac

    CC_NAME=$("${ANDROID_CC}" 2>&1 >/dev/null | sed -e 's/:.*//;1q')

    make \
        NSINSTALL="${PWD}/coreconf/nsinstall/Android${ANDROID_MINIMUM_PLATFORM}_arm_${CC_NAME}${cpuTag}_OPT.OBJ/nsinstall" \
        OS_TARGET=Android \
        ANDROID_NDK="${ANDROID_NDK_HOME}" \
        ANDROID_PREFIX="${ANDROID_PREFIX}" \
        OS_TARGET_RELEASE="${ANDROID_MINIMUM_PLATFORM}" \
        ANDROID_TOOLCHAIN="${ANDROID_TOOLCHAIN}" \
        ANDROID_TOOLCHAIN_VERSION="${ANDROID_MINIMUM_PLATFORM}" \
        ANDROID_SYSROOT="" \
        ANDROID_CC="${ANDROID_CC}" \
        ANDROID_CCC="${ANDROID_CXX}" \
        BUILD_OPT=1 \
        NSPR_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}/nspr" \
        NSPR_LIB_DIR="${ANDROID_PREFIX_LIB}" \
        SQLITE_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        SQLITE_LIB_DIR="${ANDROID_PREFIX_LIB}" \
        SQLITE_LIB_NAME=sqlite3 \
        NSS_USE_SYSTEM_SQLITE=1 \
        USE_SYSTEM_ZLIB=1 \
        ${enable64bit} \
        NATIVE_CC=clang \
        INCLUDES=" \
            -I${ANDROID_PREFIX_INCLUDE} \
            -I${ANDROID_PREFIX_INCLUDE}/nspr \
            -I${PWD}/cmd/lib \
            -I${PWD}/lib/base \
            -I${PWD}/lib/certdb \
            -I${PWD}/lib/certhigh \
            -I${PWD}/lib/ckfw \
            -I${PWD}/lib/ckfw/builtins \
            -I${PWD}/lib/crmf \
            -I${PWD}/lib/cryptohi \
            -I${PWD}/lib/dbm/include \
            -I${PWD}/lib/dev \
            -I${PWD}/lib/freebl \
            -I${PWD}/lib/freebl/ecl \
            -I${PWD}/lib/freebl/mpi \
            -I${PWD}/lib/freebl/verified \
            -I${PWD}/lib/freebl/verified/karamel/include \
            -I${PWD}/lib/freebl/verified/karamel/krmllib/dist/minimal \
            -I${PWD}/lib/jar \
            -I${PWD}/lib/libpkix/include \
            -I${PWD}/lib/libpkix/pkix/certsel \
            -I${PWD}/lib/libpkix/pkix/checker \
            -I${PWD}/lib/libpkix/pkix/crlsel \
            -I${PWD}/lib/libpkix/pkix/params \
            -I${PWD}/lib/libpkix/pkix/results \
            -I${PWD}/lib/libpkix/pkix/store \
            -I${PWD}/lib/libpkix/pkix/top \
            -I${PWD}/lib/libpkix/pkix/util \
            -I${PWD}/lib/libpkix/pkix_pl_nss/module \
            -I${PWD}/lib/libpkix/pkix_pl_nss/pki \
            -I${PWD}/lib/libpkix/pkix_pl_nss/system \
            -I${PWD}/lib/nss \
            -I${PWD}/lib/pk11wrap \
            -I${PWD}/lib/pkcs7 \
            -I${PWD}/lib/pkcs12 \
            -I${PWD}/lib/pki \
            -I${PWD}/lib/smime \
            -I${PWD}/lib/softoken \
            -I${PWD}/lib/ssl \
            -I${PWD}/lib/util"
}

package() {
    cd "${srcdir}/nss-${pkgver}/nss"
    source android-env ${_android_arch}

    # Platform specific patches
    case "$_android_arch" in
        aarch64 | x86-64)
                cpuTag=_64
            ;;
        *)
            ;;
    esac

    nsprver="$(pkg-config --modversion nspr)"

    sed pkg/pkg-config/nss.pc.in \
        -e "s,%prefix%,${ANDROID_PREFIX},g" \
        -e "s,%exec_prefix%,\${prefix},g" \
        -e "s,%libdir%,${ANDROID_PREFIX_LIB},g" \
        -e "s,%includedir%,${ANDROID_PREFIX_INCLUDE}/nss,g" \
        -e "s,%NSPR_VERSION%,$nsprver,g" \
        -e "s,%NSS_VERSION%,$pkgver,g" |
        install -Dm644 /dev/stdin "$pkgdir/${ANDROID_PREFIX_LIB}/pkgconfig/nss.pc"

    ln -s nss.pc "$pkgdir/${ANDROID_PREFIX_LIB}/pkgconfig/mozilla-nss.pc"
    install -Dt "$pkgdir/${ANDROID_PREFIX_LIB}" ../dist/Android${ANDROID_MINIMUM_PLATFORM}_arm${cpuTag}_OPT.OBJ/lib/*.so

    NSS_VMAJOR=$(grep '#define.*NSS_VMAJOR' lib/nss/nss.h | awk '{print $3}')
    NSS_VMINOR=$(grep '#define.*NSS_VMINOR' lib/nss/nss.h | awk '{print $3}')
    NSS_VPATCH=$(grep '#define.*NSS_VPATCH' lib/nss/nss.h | awk '{print $3}')

    sed pkg/pkg-config/nss-config.in \
        -e "s,@prefix@,${ANDROID_PREFIX},g" \
        -e "s,@exec_prefix@,${ANDROID_PREFIX},g" \
        -e "s,@libdir@,${ANDROID_PREFIX_LIB},g" \
        -e "s,@includedir@,${ANDROID_PREFIX_INCLUDE}/nss,g" \
        -e "s,@MOD_MAJOR_VERSION@,$NSS_VMAJOR,g" \
        -e "s,@MOD_MINOR_VERSION@,$NSS_VMINOR,g" \
        -e "s,@MOD_PATCH_VERSION@,$NSS_VPATCH,g" |
        install -D /dev/stdin "$pkgdir/${ANDROID_PREFIX_BIN}/nss-config"

    install -Dt "$pkgdir/${ANDROID_PREFIX_INCLUDE}/nss" -m644 ../dist/public/nss/*.h
}
