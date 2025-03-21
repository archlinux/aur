# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Eric Bélanger <eric@archlinux.org>

_android_arch=x86-64

pkgname=android-${_android_arch}-libmodplug
pkgver=0.8.9.0
pkgrel=2
arch=('any')
pkgdesc="A MOD playing library (Android ${_android_arch})"
url="http://modplug-xmms.sourceforge.net/"
license=('custom')
groups=('android-libmodplug')
depends=('android-ndk')
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://downloads.sourceforge.net/modplug-xmms/libmodplug-${pkgver}.tar.gz"
        'libmodplug-0.8.9.0-no-fast-math.patch')
sha256sums=('457ca5a6c179656d66c01505c0d95fafaead4329b9dbaa0f997d00a3508ad9de'
            '24b97252803b39546199715158ab1d61616755c6c9756f8b2b9b1948477ce4ed')

prepare() {
    cd "${srcdir}/libmodplug-${pkgver}"
    source android-env ${_android_arch}

    # FS#76950 (Gentoo)
    patch -Np1 -i ../libmodplug-0.8.9.0-no-fast-math.patch

    autoreconf -vfi
    sed -i 's|register||g' src/fastmix.cpp
}

build() {
    cd "${srcdir}/libmodplug-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure
    sed -i 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libmodplug-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
