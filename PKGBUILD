# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Aleksey Filippov <sarum9in@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-protobuf
pkgver=25.3
pkgrel=2
arch=('any')
pkgdesc="Protocol Buffers - Google's data interchange format (Android ${_android_arch})"
url='https://developers.google.com/protocol-buffers/'
license=('BSD')
depends=("android-${_android_arch}-zlib"
         "android-${_android_arch}-abseil-cpp")
makedepends=('android-cmake')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/protocolbuffers/protobuf/archive/v$pkgver/protobuf-$pkgver.tar.gz"
        "https://github.com/protocolbuffers/protobuf/commit/2e62ef1e.patch")
md5sums=('5e82b6696d6bcacc2e60313f187f3551'
         'SKIP')

prepare() {
    cd "${srcdir}/protobuf-${pkgver}"

    # Fix cmake config compatibility mode
    patch -Np1 -i ../2e62ef1e.patch
}

build() {
    cd "${srcdir}/protobuf-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build \
        -Dprotobuf_BUILD_SHARED_LIBS=ON \
        -Dprotobuf_ABSL_PROVIDER=package \
        -Dprotobuf_BUILD_CONFORMANCE=OFF \
        -Dprotobuf_BUILD_EXAMPLES=OFF \
        -Dprotobuf_BUILD_TESTS=OFF \
        -Dabsl_DIR="${ANDROID_PREFIX_LIB}/cmake/absl" \
        -Wno-dev
    make -C build $MAKEFLAGS
}

package() {
    cd "${srcdir}/protobuf-${pkgver}"
    source android-env ${_android_arch}

    make -C build DESTDIR="$pkgdir" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_BIN}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
