# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_android_arch=riscv64

pkgname=android-${_android_arch}-nss
pkgver=3.113.1
pkgrel=1
arch=('any')
pkgdesc="Network Security Services (Android ${_android_arch})"
url="https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS"
license=('MPL-2.0')
groups=('android-nss')
depends=("android-${_android_arch}-nspr>=4.35"
         "android-${_android_arch}-p11-kit>=0.23.19"
         "android-${_android_arch}-sqlite"
         "android-${_android_arch}-zlib")
makedepends=('clang'
             'gyp'
             'ninja'
             'perl'
             'python'
             'zip')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://ftp.mozilla.org/pub/security/nss/releases/NSS_${pkgver//./_}_RTM/src/nss-${pkgver}.tar.gz"
        'Linux.mk.patch'
        'FreeblMakefile.patch'
        'mpcpucache.c.patch')
md5sums=('157b2a0d54383923ba3ea5ff56fac0dc'
         'd70d79aa9d8914a9e9d3df1739b63c00'
         'abd61b14e76846b4eb67556211ab8d9d'
         '2cc719ad09173f4eb818ce2badcab283')

prepare() {
    cd "${srcdir}/nss-${pkgver}"

    patch -Np1 -i ../Linux.mk.patch
    patch -Np1 -i ../FreeblMakefile.patch

    # Platform specific patches
    case "${_android_arch}" in
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
    case "${_android_arch}" in
        aarch64)
            GYP_ARCH="arm64"
            ;;
        armv7a-eabi)
            GYP_ARCH="arm"
            ;;
        riscv64)
            GYP_ARCH="riscv64"
            ;;
        x86)
            GYP_ARCH="ia32"
            ;;
        x86-64)
            GYP_ARCH="x64"
            ;;
        *)
            ;;
    esac

    gyp -f ninja-android nss.gyp \
        --depth "${PWD}" \
        --generator-output="${PWD}/build" \
        -DOS=android \
        -Dforce_integrated_as=1 \
        -Dnspr_lib_dir="${ANDROID_PREFIX_LIB}" \
        -Dnspr_include_dir="${ANDROID_PREFIX_INCLUDE}/nspr" \
        -Dnss_dist_dir="${PWD}/build" \
        -Dnss_dist_obj_dir="${PWD}/build" \
        -Dhost_arch="${GYP_ARCH}" \
        -Dtarget_arch="${GYP_ARCH}" \
        -Dstatic_libs=1 \
        -Ddisable_dbm=1 \
        -Dsign_libs=0 \
        -Denable_sslkeylogfile=0 \
        -Ddisable_tests=1 \
        -Duse_system_sqlite=1 \
        -Ddisable_libpkix=1
    ninja -C build/out/Release
}

package() {
    cd "${srcdir}/nss-${pkgver}/nss"
    source android-env ${_android_arch}

    nsprver="$(pkg-config --modversion nspr)"

    sed pkg/pkg-config/nss.pc.in \
        -e "s,%prefix%,${ANDROID_PREFIX},g" \
        -e "s,%exec_prefix%,\${prefix},g" \
        -e "s,%libdir%,${ANDROID_PREFIX_LIB},g" \
        -e "s,%includedir%,${ANDROID_PREFIX_INCLUDE}/nss,g" \
        -e "s,%NSPR_VERSION%,${nsprver},g" \
        -e "s,%NSS_VERSION%,${pkgver},g" |
        install -Dm644 /dev/stdin "${pkgdir}/${ANDROID_PREFIX_LIB}/pkgconfig/nss.pc"

    ln -s nss.pc "${pkgdir}/${ANDROID_PREFIX_LIB}/pkgconfig/mozilla-nss.pc"
    install -v -Dt "${pkgdir}/${ANDROID_PREFIX_LIB}" build/lib/*.so
    install -v -Dt "${pkgdir}/${ANDROID_PREFIX_LIB}" build/lib/*.a

    NSS_VMAJOR=$(grep '#define.*NSS_VMAJOR' lib/nss/nss.h | awk '{print $3}')
    NSS_VMINOR=$(grep '#define.*NSS_VMINOR' lib/nss/nss.h | awk '{print $3}')
    NSS_VPATCH=$(grep '#define.*NSS_VPATCH' lib/nss/nss.h | awk '{print $3}')

    sed pkg/pkg-config/nss-config.in \
        -e "s,@prefix@,${ANDROID_PREFIX},g" \
        -e "s,@exec_prefix@,${ANDROID_PREFIX},g" \
        -e "s,@libdir@,${ANDROID_PREFIX_LIB},g" \
        -e "s,@includedir@,${ANDROID_PREFIX_INCLUDE}/nss,g" \
        -e "s,@MOD_MAJOR_VERSION@,${NSS_VMAJOR},g" \
        -e "s,@MOD_MINOR_VERSION@,${NSS_VMINOR},g" \
        -e "s,@MOD_PATCH_VERSION@,${NSS_VPATCH},g" |
        install -D /dev/stdin "${pkgdir}/${ANDROID_PREFIX_BIN}/nss-config"

    install -v -Dt "${pkgdir}/${ANDROID_PREFIX_INCLUDE}/nss" -m644 build/public/nss/*.h
    install -v -Dt "${pkgdir}/${ANDROID_PREFIX_INCLUDE}/nss/mozpkix" -m644 build/public/nss/mozpkix/*.h

    rm -f "${pkgdir}/${ANDROID_PREFIX_LIB}/libssl.a"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a || true
}
