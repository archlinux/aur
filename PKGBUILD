# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_android_arch=x86-64

pkgname=android-${_android_arch}-opentimelineio
pkgver=0.17.0
pkgrel=1
arch=('any')
pkgdesc="Open Source API and interchange format for editorial timeline information (Android ${_android_arch})"
url='http://opentimeline.io/'
license=('Apache-2.0')
depends=('android-ndk')
groups=(android-opentimelineio)
makedepends=('android-cmake'
             "android-${_android_arch}-imath")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/AcademySoftwareFoundation/OpenTimelineIO/archive/refs/tags/v${pkgver}.tar.gz"
        'rapidjson-master.tar.gz::https://github.com/Tencent/rapidjson/archive/refs/heads/master.tar.gz')
md5sums=('efc3dff4adb57164e83afb68908018eb'
         'SKIP')

prepare() {
    cd "${srcdir}/OpenTimelineIO-${pkgver}"

    rm -rf src/deps/rapidjson
    ln -sfv "${srcdir}/rapidjson-master" src/deps/rapidjson
    sed -e '/cmake/d' -i pyproject.toml
}

build() {
    cd "${srcdir}/OpenTimelineIO-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build-shared \
        -DBUILD_SHARED_LIBS=ON \
        -DBUILD_TESTING=OFF \
        -DOTIO_SHARED_LIBS=ON \
        -DOTIO_INSTALL_COMMANDLINE_TOOLS=OFF \
        -DOTIO_FIND_IMATH=ON \
        -DOTIO_AUTOMATIC_SUBMODULES=OFF \
        -DOTIO_DEPENDENCIES_INSTALL=OFF \
        -DOTIO_INSTALL_CONTRIB=OFF \
        -DOTIO_INSTALL_PYTHON_MODULES=OFF \
        -DImath_DIR="${ANDROID_PREFIX_LIB}/cmake/Imath"
    cmake --build build-shared

    android-${_android_arch}-cmake \
        -S . \
        -B build-static \
        -DBUILD_SHARED_LIBS=OFF \
        -DBUILD_TESTING=OFF \
        -DOTIO_SHARED_LIBS=OFF \
        -DOTIO_INSTALL_COMMANDLINE_TOOLS=OFF \
        -DOTIO_FIND_IMATH=ON \
        -DOTIO_AUTOMATIC_SUBMODULES=OFF \
        -DOTIO_DEPENDENCIES_INSTALL=OFF \
        -DOTIO_INSTALL_CONTRIB=OFF \
        -DOTIO_INSTALL_PYTHON_MODULES=OFF \
        -DImath_DIR="${ANDROID_PREFIX_LIB}/cmake/Imath"
    cmake --build build-static
}

package() {
    cd "${srcdir}/OpenTimelineIO-${pkgver}"
    source android-env ${_android_arch}

    make -C build-shared DESTDIR="${pkgdir}" install
    make -C build-static DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
