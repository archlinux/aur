# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Dan McGee <dan@archlinux.org>
# Contributor: Florian Zeitz <florob at babelmonkeys dot de>

_android_arch=x86-64

pkgname=android-${_android_arch}-numactl
pkgver=2.0.18
pkgrel=1
arch=('any')
pkgdesc="Simple NUMA policy support (android)"
url="https://github.com/numactl/numactl"
license=('GPL-2.0-only'
         'LGPL-2.1-only')
depends=('android-ndk')
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("$url/archive/refs/tags/v$pkgver.tar.gz"
        '0001-Disable-attach_sysvshm.patch')
md5sums=('4f90cc917d0055c29d85432e5a536f13'
         '78f308cfb3a98f68bd3d07eaef7572dd')

prepare(){
    cd "${srcdir}/numactl-$pkgver"
    source android-env ${_android_arch}

    if [ "${ANDROID_MINIMUM_PLATFORM}" -lt 26 ]; then
        patch -Np1 -i ../0001-Disable-attach_sysvshm.patch
    fi

    autoreconf -fiv
}

build() {
    cd "${srcdir}/numactl-$pkgver"
    source android-env ${_android_arch}

    android-${_android_arch}-configure
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/numactl-$pkgver"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_BIN}"
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
