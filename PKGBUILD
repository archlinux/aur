# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: AndyRTR <andyrtr@archlinux.org>

_android_arch=aarch64

# When releasing a xorgproto version with updated keysyms, rebuild libx11

pkgname=android-${_android_arch}-xorgproto
pkgver=2024.1
pkgrel=2
arch=('any')
pkgdesc="combined X.Org X11 Protocol headers (Android ${_android_arch}"
url="https://xorg.freedesktop.org/"
license=('custom')
groups=('android-xorgproto')
depends=('android-ndk')
makedepends=('android-meson'
             "android-${_android_arch}-xorg-util-macros")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://xorg.freedesktop.org/archive/individual/proto/xorgproto-${pkgver}.tar.xz"{,.sig})
md5sums=('12374d29fb5ae642cfa872035e401640'
         'SKIP')
validpgpkeys=('67DC86F2623FC5FD4BB5225D14706DBE1E4B4540') # "Olivier Fourdan <fourdan@xfce.org>"

build() {
    cd "${srcdir}/xorgproto-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-meson build
    ninja -C build
}

package() {
    cd "${srcdir}/xorgproto-${pkgver}"
    source android-env ${_android_arch}

    DESTDIR="${pkgdir}" meson install -C build

    # cleanup
    rm -f "${pkgdir}/${ANDROID_PREFIX_INCLUDE}/X11/extensions"/apple*
    rm -f "${pkgdir}/${ANDROID_PREFIX_SHARE}/pkgconfig/applewmproto.pc"
}
