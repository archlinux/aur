# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-libva
pkgver=2.22.0
pkgrel=1
arch=("any")
pkgdesc="Video Acceleration (VA) API for Linux (Android ${_android_arch})"
url='https://01.org/linuxmedia/vaapi'
license=('MIT')
groups=('android-libva')
depends=("android-${_android_arch}-libdrm"
         "android-${_android_arch}-libx11"
         "android-${_android_arch}-libxext"
         "android-${_android_arch}-libxfixes")
makedepends=('android-meson')
backup=("opt/android-libs/${_android_arch}/etc/libva.conf")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/intel/libva/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('8dba13313d724b5e930f06e65b7437e2')

prepare() {
    cd "${srcdir}/libva-${pkgver}"

    sed -i 's|-no-undefined| |g' va/Makefile.am
    sed -i '/VA_CPP_HELPER_ALIAS/d' va/va_compat.c
}

build() {
    cd "${srcdir}/libva-${pkgver}"
    source android-env ${_android_arch}

    export CFLAGS="${CFLAGS} -DENABLE_VA_MESSAGING" # Option missing

    android-${_android_arch}-meson build
    ninja -C build
}

package() {
    cd "${srcdir}/libva-${pkgver}"
    source android-env ${_android_arch}

    DESTDIR="${pkgdir}" ninja -C build install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so

    install -Dm 644 /dev/stdin "${pkgdir}/${ANDROID_PREFIX_ETC}/libva.conf" <<END
LIBVA_MESSAGING_LEVEL=1
END
}
