# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Bruno Pagani <archange@archlinux.org>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-libfabric
pkgver=1.20.1
pkgrel=1
arch=('any')
pkgdesc="User-space API for OpenFabrics Interfaces (OFI) (Android ${_android_arch})"
url="https://ofiwg.github.io/libfabric/"
license=('GPL2')
depends=("android-${_android_arch}-numactl")
makedepends=("android-configure")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/ofiwg/libfabric/releases/download/v${pkgver}/libfabric-${pkgver}.tar.bz2"
        '0001-Use-pthread_kill.patch'
        '0003-Remove-shmctl.patch'
        '0004-Fix-osd.patch'
        '0005-Fix-smr.patch')
sha256sums=('fd88d65c3139865d42a6eded24e121aadabd6373239cef42b76f28630d6eed76'
            '4c9e4afc69b152d97505faeae12a29959ba092bd16e7455b0b624619a54f3368'
            'e1592bece8eaec5c8f4fe9f0fb145cd7d8771653ca5cb3f144e6e731d30eb987'
            '4c3344485f4971a32f71a7b665a0772e24cf5e653240c12dedd13fe9f9cf447b'
            '212ae851eea73b5f1b0f6f560672ec183110481abbf91da6492e43be5b0ed509')

prepare() {
    cd "${srcdir}/libfabric-${pkgver}"
    source android-env ${_android_arch}

    patch -Np1 -i ../0001-Use-pthread_kill.patch
    patch -Np1 -i ../0004-Fix-osd.patch
    patch -Np1 -i ../0005-Fix-smr.patch

    if [ "${ANDROID_MINIMUM_PLATFORM}" -lt 26 ]; then
        patch -Np1 -i ../0003-Remove-shmctl.patch
    fi

    autoreconf -fvi

    # Force compile even if shm functions are no available.

    sed -i 's|LIBS="-lpthread |LIBS=" |g' configure
    sed -i 's|LIBS="-lrt |LIBS=" |g' configure
    sed -i '/char shm_open ();/d' configure
    sed -i '/char shm_open (void);/d' configure
    sed -i '/return shm_open ();/d' configure
}

build() {
    cd "${srcdir}/libfabric-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --enable-shm=no
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libfabric-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_BIN}"
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
