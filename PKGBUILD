# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

pkgname=android-cmake
pkgver=1
pkgrel=1
arch=('any')
pkgdesc="CMake wrapper for Android (android)"
depends=('cmake' 'android-environment' 'android-pkg-config')
license=("custom")
url="https://cmake.org/"
source=("android-cmake.sh"
        "android-cmake-py.sh")
sha256sums=('SKIP'
            'SKIP')
_architectures="aarch64 armv7a-eabi x86 x86-64"
_python_versions="27 35 36 37"

build() {
    for _arch in ${_architectures}; do
        source android-env ${_arch}
        processor=$(basename ${ANDROID_CC})
        processor="${processor%%-*}"
        sed "s|@TRIPLE@|${_arch}|g" android-cmake.sh > android-${_arch}-cmake

        for _pyver in ${_python_versions}; do
            sed "s|@TRIPLE@|${_arch}|g;s|@PYMAJMIN@|${_pyver}|g" android-cmake-py.sh > android-${_arch}-cmake-py${_pyver}
        done
    done
}

package() {
    install -d "${pkgdir}"/usr/bin

    for _arch in ${_architectures}; do
        source android-env ${_arch}
        install -m 755 android-${_arch}-cmake "${pkgdir}"/usr/bin/

        for _pyver in ${_python_versions}; do
            install -m 755 android-${_arch}-cmake-py${_pyver} "${pkgdir}"/usr/bin/
        done
    done
}
