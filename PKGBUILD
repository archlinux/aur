# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>

_android_arch=x86-64

pkgname=android-${_android_arch}-sdl3
pkgver=3.2.16
pkgrel=1
arch=('any')
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (Version 3) (Android ${_android_arch})"
url="https://www.libsdl.org"
license=('MIT')
groups=('android-sdl3')
depends=("android-${_android_arch}-libxext"
         "android-${_android_arch}-libxrender"
         "android-${_android_arch}-libx11"
         "android-${_android_arch}-libxcursor"
         "android-${_android_arch}-hidapi"
         "android-${_android_arch}-libusb")
makedepends=('android-cmake'
             "android-${_android_arch}-alsa-lib"
             "android-${_android_arch}-libxrandr"
             "android-${_android_arch}-libxinerama"
             "android-${_android_arch}-libxkbcommon"
             "android-${_android_arch}-libxss"
             'java-environment-common')
optdepends=("android-${_android_arch}-alsa-lib: ALSA audio driver")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/libsdl-org/SDL/releases/download/release-${pkgver}/SDL3-${pkgver}.tar.gz"{,.sig})
md5sums=('c046dd31de901ac7aa3da013e55f1716'
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
        -DSDL_ALSA=ON \
        -DALSA_INCLUDE_DIRS="${ANDROID_PREFIX_INCLUDE}" \
        -DALSA_LIBRARY="${ANDROID_PREFIX_LIB}/libalsa.so"
    make -C build $MAKEFLAGS

    # Build Java files

    java_source_build_dir="${PWD}/build/java"
    mkdir -p "${java_source_build_dir}"

    java_sourceslist_path="${java_source_build_dir}/java_sources.txt"

    classes_root="${java_source_build_dir}/classes"

    mkdir -p "${classes_root}/META-INF"
    cp "${PWD}/LICENSE.txt" "${classes_root}/META-INF"
    java_sourceslist_path="${java_source_build_dir}/java_sources.txt"

    echo "Collecting sources for ${clases_file_name}"
    find "${PWD}/android-project/app/src/main/java" -name "*.java" > "${java_sourceslist_path}"

    echo "Compiling classes"
    javac -encoding utf-8 -classpath "${ANDROID_SDK_JAR}" -d "${classes_root}" "@${java_sourceslist_path}"

    java_classeslist_path="${java_source_build_dir}/java_classes.txt"

    pushd "${classes_root}"
        find "." -name "*.class" > "${java_classeslist_path}"
        find "META-INF" -name "*" >> "${java_classeslist_path}"
        echo "Creating ${clases_file_name}"
        jar -cf "${srcdir}/SDL3-${pkgver}/build/${clases_file_name}" "@${java_classeslist_path}"
    popd
}

package() {
    cd "${srcdir}/SDL3-${pkgver}"
    source android-env ${_android_arch}

    make -C build DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a

    mkdir -p "${pkgdir}/${ANDROID_PREFIX_SHARE}/java"
    cp -vf "${srcdir}/SDL3-${pkgver}/build/${clases_file_name}" "${pkgdir}/${ANDROID_PREFIX_SHARE}/java"
    mkdir -p "${pkgdir}/${ANDROID_PREFIX_SHARE}/sdl3"
    cp -rf android-project "${pkgdir}/${ANDROID_PREFIX_SHARE}/sdl3/android-project"
    cp -rf build-scripts "${pkgdir}/${ANDROID_PREFIX_SHARE}/sdl3/build-scripts"

    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
