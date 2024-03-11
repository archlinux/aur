# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

_android_arch=x86

pkgname=android-${_android_arch}-pciutils
pkgver=3.11.1
pkgrel=2
arch=('any')
pkgdesc="PCI bus configuration space access library and tools (Android, ${_android_arch})"
license=('GPL2')
url="https://mj.ucw.cz/sw/pciutils/"
depends=("android-${_android_arch}-hwdata"
         "android-${_android_arch}-kmod")
makedepends=('android-environment')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://mj.ucw.cz/download/linux/pci/pciutils-${pkgver}.tar.gz"{,.sign}
        '0001-Do-not-use-lresolv.patch'
        '0002-Disable-ecam.patch')
sha256sums=('1904864ce5b0272d0a2e42e72ceac9e8810d1898480567f36b70642f8205fbfd'
            'SKIP'
            '14a963d11acb299db114187768bdf53ee1cb39f1044a0a2aa5c5a90ae58e42a3'
            'bff4d9e509ceba0cdde7a20e83afa5303f27cd93705c54867c6c073fc153aa87')
validpgpkeys=('C466A56CADA981F4297D20C31F3D0761D9B65F0B') # Martin Mares <mj@ucw.cz>

prepare() {
    cd "${srcdir}/pciutils-$pkgver"
    source android-env ${_android_arch}

    patch -Np1 -i ../0001-Do-not-use-lresolv.patch

    if [ "${ANDROID_MINIMUM_PLATFORM}" -lt 28 ]; then
        patch -Np1 -i ../0002-Disable-ecam.patch
    fi
}

build() {
    cd "${srcdir}/pciutils-$pkgver"
    source android-env ${_android_arch}

    # Platform specific patches
    case "$_android_arch" in
        aarch64)
            host=armv8-linux
            ;;
        armv7a-eabi)
            host=armv7-linux
            ;;
        *)
            host=intel-linux
            ;;
    esac

    make \
        HOST=${host} \
        OPT="${CFLAGS} -fPIC -DPIC" \
        ZLIB=no \
        SHARED=no \
        PREFIX="${ANDROID_PREFIX}" \
        SBINDIR="${ANDROID_PREFIX_BIN}" \
        SHAREDIR="${ANDROID_PREFIX_SHARE}/hwdata" \
        MANDIR="${ANDROID_PREFIX_SHARE}/man" \
        CC="${ANDROID_CC}" \
        AR="${ANDROID_AR}" \
        RANLIB="${ANDROID_RANLIB}" \
        STRIP="${ANDROID_STRIP}" \
        lib/libpci.a
    cp -f lib/libpci.a "${srcdir}/"
    make clean
    make \
        HOST=${host} \
        OPT="${CFLAGS}" \
        ZLIB=no \
        SHARED=yes \
        PREFIX="${ANDROID_PREFIX}" \
        SBINDIR="${ANDROID_PREFIX_BIN}" \
        SHAREDIR="${ANDROID_PREFIX_SHARE}/hwdata" \
        MANDIR="${ANDROID_PREFIX_SHARE}/man" \
        CC="${ANDROID_CC}" \
        AR="${ANDROID_AR}" \
        RANLIB="${ANDROID_RANLIB}" \
        STRIP="${ANDROID_STRIP}" \
        all
}

package() {
    cd "${srcdir}/pciutils-$pkgver"
    source android-env ${_android_arch}

    # Platform specific patches
    case "$_android_arch" in
        aarch64)
            host=armv8-linux
            ;;
        armv7a-eabi)
            host=armv7-linux
            ;;
        *)
            host=intel-linux
            ;;
    esac

    make \
        HOST=${host} \
        SHARED=yes \
        PREFIX="${ANDROID_PREFIX}" \
        SBINDIR="${ANDROID_PREFIX_BIN}" \
        SHAREDIR="${ANDROID_PREFIX_SHARE}/hwdata" \
        MANDIR="${ANDROID_PREFIX_SHARE}/man" \
        DESTDIR="${pkgdir}" \
        CC="${ANDROID_CC}" \
        AR="${ANDROID_AR}" \
        RANLIB="${ANDROID_RANLIB}" \
        STRIP="${ANDROID_STRIP}" \
        install \
        install-lib

    rm -f "$pkgdir/${ANDROID_PREFIX_BIN}/"{llvm-strip,lspci,pcilmr,setpci}
    rm -rf "$pkgdir/${ANDROID_PREFIX_SHARE}"
    cp -f "${srcdir}/libpci.a" "${pkgdir}/${ANDROID_PREFIX_LIB}/"
    mv -f "${pkgdir}/${ANDROID_PREFIX_LIB}/libpci.so".*.* "${pkgdir}/${ANDROID_PREFIX_LIB}/libpci.so"
    rm -f "${pkgdir}/${ANDROID_PREFIX_LIB}/libpci.so".*
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
