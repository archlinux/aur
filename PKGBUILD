# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Controbutor: Jan de Groot <jgc@archlinux.org>

_android_arch=x86

pkgname=android-${_android_arch}-libxrender
pkgver=0.9.12
pkgrel=1
arch=('any')
pkgdesc="X Rendering Extension client library (Android ${_android_arch})"
url="https://xorg.freedesktop.org/"
license=('custom')
groups=('android-libxrender')
depends=("android-${_android_arch}-libx11")
makedepends=("android-${_android_arch}-xorgproto")
options=(!strip !buildflags staticlibs !emptydirs)
source=("${url}/archive/individual/lib/libXrender-${pkgver}.tar.xz"{,.sig})
md5sums=('4c54dce455d96e3bdee90823b0869f89'
         'SKIP')
validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') #Alan Coopersmith <alan.coopersmith@oracle.com>

build() {
    cd "${srcdir}/libXrender-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --disable-malloc0returnsnull
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libXrender-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
