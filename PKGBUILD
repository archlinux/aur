# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Jonas Witschel <diabonas@archlinux.org>
# Contributor: Bruno Pagani <archange@archlinux.org>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-tpm2-tss
pkgver=4.0.1
pkgrel=1
arch=('any')
pkgdesc="Implementation of the TCG Trusted Platform Module 2.0 Software Stack (TSS2) (Android ${_android_arch})"
url='https://github.com/tpm2-software/tpm2-tss'
license=('BSD')
depends=("android-${_android_arch}-curl"
         "android-${_android_arch}-json-c"
         "android-${_android_arch}-openssl")
makedepends=('android-configure'
             "android-${_android_arch}-cmocka"
             "android-${_android_arch}-libtpms")
options=(!strip !buildflags staticlibs !emptydirs)
source=("$url/releases/download/$pkgver/tpm2-tss-$pkgver.tar.gz"{,.asc}
        'https://raw.githubusercontent.com/tpm2-software/tpm2-tss/e237e4d33cbf280292a480edd8ad061dcd3a37a2/lib/tss2-tcti-libtpms.map'
        'https://github.com/tpm2-software/tpm2-tss/commit/218c0da8.patch')
md5sums=('fff676c669519097906bd8ce28fc4238'
         'SKIP'
         '3c8004f1845db070fd289491aa05ed14'
         '8175e80c5175290f56ec81dcfe67866a')
validpgpkeys=('D6B4D8BAC7E0CC97DCD4AC7272E88B53F7A95D84'  # Andreas Fuchs <andreas.fuchs@sit.fraunhofer.de>
              '5B482B8E3E19DA7C978E1D016DE2E9078E1F50C1') # William Roberts (Bill Roberts) <william.c.roberts@intel.com>

prepare() {
    cd "$srcdir/tpm2-tss-$pkgver"

    # Add file missing from release tarball (https://github.com/tpm2-software/tpm2-tss/issues/2313)
    cp -f "$srcdir/tss2-tcti-libtpms.map" lib
    patch -p1 -i ../218c0da8.patch # Fix tests
}

build() {
    cd "$srcdir/tpm2-tss-$pkgver"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --sysconfdir="${ANDROID_PREFIX_ETC}" \
        --localstatedir="${ANDROID_PREFIX}/var" \
        --with-runstatedir="/run" \
        --with-sysusersdir="${ANDROID_PREFIX_LIB}/sysusers.d" \
        --with-tmpfilesdir="${ANDROID_PREFIX_LIB}/tmpfiles.d" \
        --with-udevrulesprefix=60- \
        --enable-unit \
        --disable-doxygen-doc \
        --enable-doxygen-dot=no \
        --disable-doxygen-man \
        --disable-doxygen-rtf \
        --disable-doxygen-html \
        --enable-fapi=no \
        --enable-policy=no
    make $MAKEFLAGS
}

package() {
    cd "$srcdir/tpm2-tss-$pkgver"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -rf  "$pkgdir/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
