# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>

_android_arch=x86

pkgname=android-${_android_arch}-gpgme
pkgver=1.24.2
pkgrel=1
arch=('any')
pkgdesc="A C wrapper library for GnuPG (Android ${_android_arch})"
url='https://www.gnupg.org/related_software/gpgme/'
license=('LGPL')
groups=('android-gpgme')
depends=("android-${_android_arch}-libgpg-error"
         "android-${_android_arch}-libassuan"
         'gnupg>=2'
         'python')
makedepends=("android-${_android_arch}-libgpg-error"
             'gnupg'
             'python'
             'python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel'
             'swig')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-${pkgver}.tar.bz2"{,.sig})
md5sums=('2e0cc1df9f3da8c2a7d7c9dc33b7f0bf'
         'SKIP')
validpgpkeys=('6DAA6E64A76D2840571B4902528897B826403ADA'  # Werner Koch (dist signing 2020)
              'AC8E115BF73E2D8D47FA9908E98E9B2D19C6C8BD') # Niibe Yutaka (GnuPG Release Key)

prepare() {
    cd "${srcdir}/gpgme-${pkgver}"
    source android-env ${_android_arch}

    autoreconf -fi
}

build() {
    cd "${srcdir}/gpgme-${pkgver}"
    source android-env ${_android_arch}

    export CFLAGS="${CFLAGS} -mno-outline-atomics"
    export CXXFLAGS="${CXXFLAGS} -mno-outline-atomics"

    android-${_android_arch}-configure \
        --enable-languages=cl,cpp \
        --disable-fd-passing \
        --disable-gpgsm-test
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/gpgme-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "$pkgdir/${ANDROID_PREFIX_BIN}"
    rm -rf "$pkgdir/${ANDROID_PREFIX_SHARE}/aclocal"
    rm -rf "$pkgdir/${ANDROID_PREFIX_SHARE}/info"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
