# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>

_android_arch=riscv64

pkgname=android-${_android_arch}-sdl2
pkgver=2.32.2
pkgrel=1
arch=('any')
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (Version 2) (Android ${_android_arch})"
url="https://www.libsdl.org"
license=('MIT')
groups=('android-sdl2')
depends=("android-${_android_arch}-hidapi"
         "android-${_android_arch}-libusb"
         "android-${_android_arch}-zlib")
makedepends=('android-cmake'
             'java-environment-common')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/libsdl-org/SDL/releases/download/release-${pkgver}/SDL2-${pkgver}.tar.gz"{,.sig})
md5sums=('3dbb100178a1f37fa96dfc63c8a23367'
         'SKIP')
validpgpkeys=('1528635D8053A57F77D1E08630A59377A7763BE6') # Sam Lantinga
clases_file_name=sdl2.jar

build() {
    cd "${srcdir}/SDL2-${pkgver}"
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

    jar cf "${java_build_dir}/sdl2.jar" -C "${java_build_dir}/classes" .
#
#     # Build Java files
#
#     java_source_build_dir="${PWD}/build/java"
#     mkdir -p "${java_source_build_dir}"
#
#     java_sourceslist_path="${java_source_build_dir}/java_sources.txt"
#
#     classes_root="${java_source_build_dir}/classes"
#
#     mkdir -p "${classes_root}/META-INF"
#     cp "${PWD}/LICENSE.txt" "${classes_root}/META-INF"
#     java_sourceslist_path="${java_source_build_dir}/java_sources.txt"
#
#     echo "Collecting sources for ${clases_file_name}"
#     find "${PWD}/android-project/app/src/main/java" -name "*.java" > "${java_sourceslist_path}"
#
#     echo "Compiling classes"
#     javac -encoding utf-8 -classpath "${ANDROID_SDK_JAR}" -d "${classes_root}" "@${java_sourceslist_path}"
#
#     java_classeslist_path="${java_source_build_dir}/java_classes.txt"
#
#     pushd "${classes_root}"
#         find "." -name "*.class" > "${java_classeslist_path}"
#         find "META-INF" -name "*" >> "${java_classeslist_path}"
#         echo "Creating ${clases_file_name}"
#         jar -cf "${srcdir}/SDL2-${pkgver}/build/${clases_file_name}" "@${java_classeslist_path}"
#     popd
}

package() {
    cd "${srcdir}/SDL2-${pkgver}"
    source android-env ${_android_arch}

    make -C build DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_BIN}"
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}/man"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a

    install -Dm644 build/java/sdl2.jar "${pkgdir}${ANDROID_PREFIX_SHARE}/java/sdl2.jar"

#     mkdir -p "${pkgdir}/${ANDROID_PREFIX_SHARE}/java"
#     cp -vf "${srcdir}/SDL2-${pkgver}/build/${clases_file_name}" "${pkgdir}/${ANDROID_PREFIX_SHARE}/java"
    mkdir -p "${pkgdir}/${ANDROID_PREFIX_SHARE}/sdl2"
    cp -rf android-project "${pkgdir}/${ANDROID_PREFIX_SHARE}/sdl2/android-project"
    cp -rf build-scripts "${pkgdir}/${ANDROID_PREFIX_SHARE}/sdl2/build-scripts"

    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
