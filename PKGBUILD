# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

_android_arch=riscv64

pkgname=android-${_android_arch}-libdrm
pkgver=2.4.125
pkgrel=1
arch=('any')
pkgdesc="Userspace interface to kernel DRM services (Android ${_android_arch})"
url="https://dri.freedesktop.org/"
license=('custom')
groups=('android-libdrm')
depends=("android-${_android_arch}-libpciaccess")
makedepends=('android-meson')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://dri.freedesktop.org/libdrm/libdrm-${pkgver}.tar.xz"
        '0001-Disable-open_memstream.patch')
md5sums=('3baec8e685510892b3355a7074baa874'
         'f7835471a1b6ec93215dc61339dfb117')

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

    android-${_android_arch}-meson build \
        --default-library both \
        -D udev=true \
        -D etnaviv=disabled \
        -D freedreno=enabled \
        -D vc4=disabled \
        -D valgrind=disabled \
        -D install-test-programs=false \
        -D man-pages=disabled \
        -D tests=false
    ninja -C build
}

package() {
    cd "${srcdir}/libdrm-${pkgver}"
    source android-env ${_android_arch}

    DESTDIR="${pkgdir}" ninja -C build install
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a || true
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_RANLIB} "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a || true
}
