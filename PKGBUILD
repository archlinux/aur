# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-libpciaccess
pkgver=0.18.1
pkgrel=2
arch=('any')
pkgdesc="X11 PCI access library (Android ${_android_arch})"
license=('LicenseRef-libpciaccess')
url="https://gitlab.freedesktop.org/xorg/lib/libpciaccess"
groups=(android-libpciaccess)
depends=("android-${_android_arch}-zlib")
makedepends=('android-meson'
             "android-${_android_arch}-xorg-util-macros")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://xorg.freedesktop.org/releases/individual/lib/libpciaccess-${pkgver}.tar.xz"{,.sig}
        '0001-Set-linux-host.patch'
        '0002-Do-not-use-sys-io.patch')
md5sums=('57c7efbeceedefde006123a77a7bc825'
         'SKIP'
         'c605afd4f4edd9b2e261ed66c24b5b69'
         '5f8c7b710ac2dfeaa37c945ffd8bb88b')
validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # Alan Coopersmith <alan.coopersmith@oracle.com>

prepare() {
    cd "${srcdir}/libpciaccess-${pkgver}"

    patch -Np1 -i ../0001-Set-linux-host.patch

    # Platform specific patches
    case "${_android_arch}" in
        x86*)
            patch -Np1 -i ../0002-Do-not-use-sys-io.patch
            ;;
    esac
}

build() {
    cd "${srcdir}/libpciaccess-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-meson build
    ninja -C build
}

package() {
    cd "${srcdir}/libpciaccess-${pkgver}"
    source android-env ${_android_arch}

    DESTDIR="${pkgdir}" ninja -C build install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a || true
}
