# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

_android_arch=x86-64

pkgname=android-${_android_arch}-libva
pkgver=2.21.0
pkgrel=2
arch=("any")
pkgdesc="Video Acceleration (VA) API for Linux (Android ${_android_arch})"
url='https://01.org/linuxmedia/vaapi'
license=('MIT')
groups=(android-libva)
depends=("android-${_android_arch}-libdrm"
         "android-${_android_arch}-libx11"
         "android-${_android_arch}-libxext"
         "android-${_android_arch}-libxfixes")
makedepends=('android-meson')
backup=("opt/android-libs/${_android_arch}/etc/libva.conf")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/intel/libva/archive/refs/tags/${pkgver}.tar.gz"
        '0001-Disable-versioned-API.patch')
md5sums=('2038f5b79612c1767ecd9bc281cd4189'
         '0efc367f03606ce6867354efbfcdfdaa')

prepare() {
    cd "${srcdir}/libva-${pkgver}"

    patch -Np1 -i ../0001-Disable-versioned-API.patch
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
