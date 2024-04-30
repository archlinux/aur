# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Daniel Bermond <dbermond@archlinux.org>

_android_arch=aarch64

pkgname=android-${_android_arch}-vmaf
pkgver=3.0.0
pkgrel=1
arch=('any')
pkgdesc="Perceptual video quality assessment algorithm based on multi-method fusion (Android ${_android_arch})"
url='https://github.com/Netflix/vmaf/'
license=('BSD')
depends=('android-ndk')
makedepends=('android-meson'
             'nasm')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/Netflix/vmaf/archive/v${pkgver}/vmaf-${pkgver}.tar.gz"
        '0001-Fix-fseeko-errors.patch')
sha256sums=('7178c4833639e6b989ecae73131d02f70735fdb3fc2c7d84bc36c9c3461d93b1'
            '95eddd88210f3227ee0c7c1212d6b7caeecf2a94ac0d573aa5b4cc059aa03efb')

prepare() {
    cd "${srcdir}/vmaf-${pkgver}"

    if [[ "${_android_arch}" == armv7a-eabi || "${_android_arch}" == x86 ]]; then
        patch -Np1 -i ../0001-Fix-fseeko-errors.patch
    fi
}

build() {
    cd "${srcdir}/vmaf-${pkgver}/libvmaf"
    source android-env ${_android_arch}

    mkdir -p build
    cd build
    android-${_android_arch}-meson \
        --default-library both \
        -Denable_tests=false \
        -Denable_docs=false
    ninja
}

package() {
    cd "${srcdir}/vmaf-${pkgver}/libvmaf/build"
    source android-env ${_android_arch}

    DESTDIR="${pkgdir}" ninja install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_BIN}"
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a || true
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_RANLIB} "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a || true

    cp -dr --no-preserve='ownership' "${srcdir}/vmaf-${pkgver}/model" "${pkgdir}/${ANDROID_PREFIX_SHARE}"
}
