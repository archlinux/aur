# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Controbutor: Jan de Groot <jgc@archlinux.org>

_android_arch=x86

pkgname=android-${_android_arch}-libxrender
pkgver=0.9.11
pkgrel=1
arch=('any')
pkgdesc="X Rendering Extension client library"
url="https://xorg.freedesktop.org/"
license=('custom')
depends=("android-${_android_arch}-libx11")
makedepends=("android-${_android_arch}-xorgproto")
options=(!strip !buildflags staticlibs !emptydirs)
source=(${url}/archive/individual/lib/libXrender-${pkgver}.tar.xz{,.sig})
sha512sums=('2327cc1b530382d81df29b8d579f801f1f990202107cc84506986bcf5d15010d414e9418987b200e3f222d188afce46f0d7754febcdca62a5fc1e541b3bb82de'
            'SKIP')
validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') #Alan Coopersmith <alan.coopersmith@oracle.com>

build() {
    cd "$srcdir/libXrender-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --disable-malloc0returnsnull
    make $MAKEFLAGS
}

package() {
    cd "$srcdir/libXrender-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
