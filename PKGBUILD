# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Bruno Pagani <archange@archlinux.org>

_android_arch=x86-64

pkgname=android-${_android_arch}-libfabric
pkgver=2.1.0
pkgrel=1
arch=('any')
pkgdesc="User-space API for OpenFabrics Interfaces (OFI) (Android ${_android_arch})"
url="https://ofiwg.github.io/libfabric/"
license=('GPL2')
groups=('android-libfabric')
depends=("android-${_android_arch}-numactl")
makedepends=("android-configure")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/ofiwg/libfabric/releases/download/v${pkgver}/libfabric-${pkgver}.tar.bz2"
        '0002-Remove-macro.patch'
        '0003-Remove-shmctl.patch'
        '0004-Fix-osd.patch'
        '0005-Fix-smr.patch')
md5sums=('5739118445d72d6ed960d606eff5791b'
         'a86bc3102e6f00bb8310cd42250c80ab'
         '0eda3ac07a34acb8a50a3472dacc7d9b'
         '0d567377eeab5a196dc87fe7ee2171a2'
         'b6b0249696f7aec49ac0dd4b9c5d94c9')

prepare() {
    cd "${srcdir}/libfabric-${pkgver}"
    source android-env ${_android_arch}

    patch -Np1 -i ../0002-Remove-macro.patch
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

    case "${_android_arch}" in
        x86-64)
            config_options="--enable-lpp=no"
            ;;
        *)
            ;;
    esac

    android-${_android_arch}-configure \
        --enable-shm=no \
        ${config_options}
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libfabric-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_BIN}"
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
