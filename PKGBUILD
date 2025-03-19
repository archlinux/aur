# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Jonas Witschel <diabonas@archlinux.org>
# Contributor: Bruno Pagani <archange@archlinux.org>

_android_arch=riscv64

pkgname=android-${_android_arch}-tpm2-tss
pkgver=4.1.3
pkgrel=1
arch=('any')
pkgdesc="Implementation of the TCG Trusted Platform Module 2.0 Software Stack (TSS2) (Android ${_android_arch})"
url='https://github.com/tpm2-software/tpm2-tss'
license=('BSD')
groups=('android-tpm2-tss')
depends=("android-${_android_arch}-curl"
         "android-${_android_arch}-json-c"
         "android-${_android_arch}-openssl")
makedepends=('android-configure'
             "android-${_android_arch}-cmocka"
             "android-${_android_arch}-libtpms")
options=(!strip !buildflags staticlibs !emptydirs)
source=("${url}/releases/download/${pkgver}/tpm2-tss-${pkgver}.tar.gz")
md5sums=('018e7f53a7c2d6385c7a76cf7699019c')

build() {
    cd "${srcdir}/tpm2-tss-${pkgver}"
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
    cd "${srcdir}/tpm2-tss-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf  "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
