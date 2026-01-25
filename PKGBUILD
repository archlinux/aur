# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>

_android_arch=x86

pkgname=android-${_android_arch}-sdl3
pkgver=3.4.0
pkgrel=1
arch=('any')
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (Version 3) (Android ${_android_arch})"
url="https://www.libsdl.org"
license=('MIT')
groups=('android-sdl3')
depends=("android-${_android_arch}-hidapi"
         "android-${_android_arch}-libusb"
         "android-${_android_arch}-zlib")
makedepends=('android-cmake'
             'java-environment-common')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/libsdl-org/SDL/releases/download/release-${pkgver}/SDL3-${pkgver}.tar.gz"{,.sig})
md5sums=('25cc9aade08c60e883b7accd87eb4600'
         'SKIP')
validpgpkeys=('1528635D8053A57F77D1E08630A59377A7763BE6') # Sam Lantinga
clases_file_name=sdl3.jar

build() {
    cd "${srcdir}/SDL3-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build \
        -DSDL_HIDAPI_LIBUSB=ON \
        -DSDL_STATIC=ON \
        -DSDL_RPATH=OFF \
        -DSDL_TESTS=OFF \
        -DSDL_TEST_LIBRARY=OFF
    make -C build $MAKEFLAGS

    # Build Java files

    java_build_dir="${PWD}/build/java"
    mkdir -p "${java_build_dir}/classes"
    javac -encoding utf-8 \
          -classpath "${ANDROID_SDK_JAR}" \
          -d "${java_build_dir}/classes" \
          android-project/app/src/main/java/org/libsdl/app/*.java

    jar cf "${java_build_dir}/sdl3.jar" -C "${java_build_dir}/classes" .
}

package() {
    cd "${srcdir}/SDL3-${pkgver}"
    source android-env ${_android_arch}

    make -C build DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_BIN}"
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}/man"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a

    install -Dm644 build/java/sdl3.jar "${pkgdir}${ANDROID_PREFIX_SHARE}/java/sdl3.jar"

    mkdir -p "${pkgdir}/${ANDROID_PREFIX_SHARE}/sdl3"
    cp -rf android-project "${pkgdir}/${ANDROID_PREFIX_SHARE}/sdl3/android-project"
    cp -rf build-scripts "${pkgdir}/${ANDROID_PREFIX_SHARE}/sdl3/build-scripts"

    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
