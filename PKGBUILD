# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Jonas Witschel <diabonas@archlinux.org>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-libtpms
pkgver=0.10.1
pkgrel=1
arch=('any')
pkgdesc="Library providing a software emulation of a Trusted Platform Module (TPM 1.2 and TPM 2.0) (Android ${_android_arch})"
url='https://github.com/stefanberger/libtpms'
license=('BSD')
groups=('android-libtpms')
depends=("android-${_android_arch}-openssl")
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/stefanberger/libtpms/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('05c5c0aec50f4afe7de0724d3bf7eb2e')

prepare() {
    cd "${srcdir}/libtpms-${pkgver}"
    source android-env ${_android_arch}

    autoreconf --install --force
    sed -i 's/ = index(/ = strchr(/g' src/tpm2/RuntimeProfile.c
}

build() {
    cd "${srcdir}/libtpms-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --with-openssl \
        --with-tpm2
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libtpms-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
