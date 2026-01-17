# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Andrew Cook <ariscop@gmail.com>

_android_arch=x86-64

pkgname=android-${_android_arch}-libbluray
pkgver=1.4.0
pkgrel=1
arch=('any')
pkgdesc="Library to access Blu-Ray disks for video playback (Android ${_android_arch})"
url='https://www.videolan.org/developers/libbluray.html'
license=('LGPL2.1')
groups=('android-libbluray')
depends=("android-${_android_arch}-fontconfig"
         "android-${_android_arch}-freetype2"
         "android-${_android_arch}-libxml2"
         "android-${_android_arch}-libudfread")
makedepends=('android-meson'
             'ninja')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://code.videolan.org/videolan/libbluray/-/archive/${pkgver}/libbluray-${pkgver}.tar.bz2")
md5sums=('e34fadf9160147c218679526e52aebef')

build() {
    cd "${srcdir}/libbluray-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-meson build \
        -Denable_tools=false \
        -Dbdj_jar=disabled
    ninja -C build all
}

package() {
    cd "${srcdir}/libbluray-${pkgver}"
    source android-env ${_android_arch}

    DESTDIR="${pkgdir}" ninja -C build install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a || true

    install -vDm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
