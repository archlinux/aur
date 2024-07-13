# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Eric Bélanger <eric@archlinux.org>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-popt
pkgver=1.19
pkgrel=1
pkgdesc="A commandline option parser (Android ${_android_arch})"
arch=('any')
url="https://github.com/rpm-software-management/popt"
license=('custom')
depends=('android-ndk')
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://ftp.osuosl.org/pub/rpm/popt/releases/popt-1.x/popt-${pkgver}.tar.gz")
md5sums=('eaa2135fddb6eb03f2c87ee1823e5a78')

prepare() {
    cd "${srcdir}/popt-${pkgver}"
    source android-env ${_android_arch}

    if [ "${ANDROID_MINIMUM_PLATFORM}" -lt 28 ]; then
        sed -i '/HAVE_GLOB_H/d' configure
    fi

    if [ "${ANDROID_MINIMUM_PLATFORM}" -lt 26 ]; then
        sed -i '/HAVE_LANGINFO_H/d' configure
    fi
}

build() {
    cd "${srcdir}/popt-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --enable-ld-version-script=no
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/popt-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
