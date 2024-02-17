# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: AndyRTR <andyrtr@archlinux.org>

_android_arch=x86

# When releasing a xorgproto version with updated keysyms, rebuild libx11

pkgname=android-${_android_arch}-xorgproto
pkgver=2023.2
pkgrel=2
pkgdesc="combined X.Org X11 Protocol headers (android)"
arch=('any')
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('android-ndk')
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-meson'
             "android-${_android_arch}-xorg-util-macros")
source=("https://xorg.freedesktop.org/archive/individual/proto/xorgproto-$pkgver.tar.xz"{,.sig})
sha512sums=('af0a8c8094fc6a490a886a8c048175762b6334798f2e48b6f6e19a7bb39ddbef05fa1237c4e9d9f1d870d24f5ca7a7c463044c41ceebd108f8ab0816677a582d'
            'SKIP')
validpgpkeys=('67DC86F2623FC5FD4BB5225D14706DBE1E4B4540') # "Olivier Fourdan <fourdan@xfce.org>"

build() {
    cd "${srcdir}"/xorgproto-${pkgver}
    source android-env ${_android_arch}

    android-${_android_arch}-meson build
    ninja -C build
}

package() {
    cd "${srcdir}"/xorgproto-${pkgver}
    source android-env ${_android_arch}

    DESTDIR="${pkgdir}" meson install -C build

    # cleanup
    rm -f "${pkgdir}"/${ANDROID_PREFIX_INCLUDE}/X11/extensions/apple*
    rm -f "${pkgdir}"/${ANDROID_PREFIX_SHARE}/pkgconfig/applewmproto.pc
}
