# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

_android_arch=riscv64

pkgname=android-${_android_arch}-libcap-ng
pkgver=0.8.5
pkgrel=2
arch=('any')
pkgdesc="A library for Linux that makes using posix capabilities easy (Android ${_android_arch})"
url='https://people.redhat.com/sgrubb/libcap-ng/'
license=('GPL-2.0-or-later'
         'LGPL-2.1-or-later')
groups=('android-libcap-ng')
depends=('android-ndk')
makedepends=('android-configure'
             'swig')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/stevegrubb/libcap-ng/archive/v${pkgver}/libcap-ng-${pkgver}.tar.gz"
        '0001-Disable-fsetlocking.patch')
md5sums=('8635fae2b1ead2381a9630d00e8f80b7'
         '2ecb9b10f198c5222237864ab215d217')

prepare() {
    cd "${srcdir}/libcap-ng-${pkgver}"
    source android-env ${_android_arch}

    if [ "${ANDROID_MINIMUM_PLATFORM}" -lt 23 ]; then
        patch -Np1 -i ../0001-Disable-fsetlocking.patch
    fi

    # make stupid autotools happy -_-
    touch NEWS
    autoreconf -fiv
}

build() {
    cd "${srcdir}/libcap-ng-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --without-python \
        --without-python3
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libcap-ng-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_BIN}"
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
