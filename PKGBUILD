# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Maxime de Roucy <maxime.deroucy@gmail.com>
# Contributor: Darwin Bautista <djclue917@gmail.com>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-gsm
pkgver=1.0.22
pkgrel=2
arch=('any')
pkgdesc="Shared libraries for GSM 06.10 lossy speech compression (Android ${_android_arch})"
url="https://www.quut.com/gsm/"
license=('custom')
groups=('android-gsm')
depends=('android-ndk')
makedepends=('android-environment')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://www.quut.com/gsm/gsm-${pkgver}.tar.gz")
md5sums=('fcca74c770a341d78ea4604418c1264b')

prepare() {
    cd "${srcdir}/gsm-${pkgver%.*}-pl${pkgver##*.}"

    # Fix code comments
    sed -i 's|/\*efine|//define|g' inc/config.h
}

build() {
    cd "${srcdir}/gsm-${pkgver%.*}-pl${pkgver##*.}"
    source android-env ${_android_arch}

    make CC="${CC}" CCFLAGS="${CFLAGS} -c -fPIC" $MAKEFLAGS ./lib/libgsm.a
    ${CC} -shared ${LDFLAGS} -o lib/libgsm.so src/*.o
}

package() {
    cd "${srcdir}/gsm-${pkgver%.*}-pl${pkgver##*.}"
    source android-env ${_android_arch}

    # Prepare directories
    install -m755 -d "${pkgdir}/${ANDROID_PREFIX}"/{lib,include/gsm}

    make -j1 \
        INSTALL_ROOT="${pkgdir}/${ANDROID_PREFIX}" \
        GSM_INSTALL_INC="${pkgdir}/${ANDROID_PREFIX_INCLUDE}/gsm" \
        "${pkgdir}/${ANDROID_PREFIX_INCLUDE}/gsm/gsm.h" \
        "${pkgdir}/${ANDROID_PREFIX_LIB}/libgsm.a"
    install -v -m644 lib/libgsm.so "${pkgdir}/${ANDROID_PREFIX_LIB}/"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
