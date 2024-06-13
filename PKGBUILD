# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

_android_arch=aarch64

pkgname=android-${_android_arch}-libdrm
pkgver=2.4.121
pkgrel=1
arch=('any')
pkgdesc="Userspace interface to kernel DRM services (Android ${_android_arch})"
url="https://dri.freedesktop.org/"
license=('custom')
depends=("android-${_android_arch}-libpciaccess")
makedepends=('android-meson')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://dri.freedesktop.org/libdrm/libdrm-$pkgver.tar.xz"
        '0001-Disable-open_memstream.patch')
md5sums=('9eaa82b7b7a79972c6b11dd25a4356b1'
         'b01f3f9e59e04924adcc3385e634c8dc')

prepare() {
    cd "${srcdir}/libdrm-${pkgver}"
    source android-env ${_android_arch}

    if [ "${ANDROID_MINIMUM_PLATFORM}" -lt 23 ]; then
        patch -Np1 -i ../0001-Disable-open_memstream.patch
    fi
}

build() {
    cd "${srcdir}/libdrm-${pkgver}"
    source android-env ${_android_arch}

    mkdir -p build
    cd build
    android-${_android_arch}-meson \
        --default-library both \
        -D udev=true \
        -D etnaviv=disabled \
        -D freedreno=enabled \
        -D vc4=disabled \
        -D valgrind=disabled \
        -D install-test-programs=false \
        -D man-pages=disabled \
        -D tests=false
    ninja
}

package() {
    cd "${srcdir}/libdrm-${pkgver}/build"
    source android-env ${_android_arch}

    DESTDIR="${pkgdir}" ninja install
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a || true
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_RANLIB} "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a || true
}
