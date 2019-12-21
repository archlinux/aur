# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Jiaxi Hu <sftrytry _AT_ gmail _DOT_ com>
# Contributor: jimmy00784 <jimmy00784@gmail.com>
# Contributor: Ricardo (XenGi) Band <email@ricardo.band>
# Contributor: Martchus <martchus@gmx.net>

_android_arch=aarch64

pkgname=android-${_android_arch}-qt5
pkgver=5.14.0
pkgrel=1
pkgdesc="Qt 5 for Android"
arch=('any')
url='https://www.qt.io'
license=('GPL3' 'LGPL')
makedepends=('libgl'
             'sqlite'
             'zlib'
             'python2'
             'python' # Qt Qml requires Python 3
             'ruby'
             'gperf'
             'libxslt'
             'fontconfig'
             'java-environment-openjdk<=8'
             'android-environment'
             'android-pkg-config')
depends=('java-runtime-headless-openjdk<=8'
         'apache-ant'
         'android-ndk'
         'android-sdk'
         'android-sdk-build-tools'
         'android-sdk-platform-tools'
         "android-${_android_arch}-libjpeg-turbo"
         "android-${_android_arch}-libpng"
         "android-${_android_arch}-libtiff"
         "android-${_android_arch}-libwebp"
         "android-${_android_arch}-openssl"
         "android-${_android_arch}-zlib")
groups=('android-qt5')

case "$_android_arch" in
    aarch64)
        optdepends=("android-google-apis-arm64-v8a: AVD support"
                    "android-arm64-v8a-system-image: AVD support")
        ;;
    armv7a-eabi)
        optdepends=("android-google-apis-armv7a-eabi: AVD support"
                    "android-armv7a-eabi-system-image: AVD support")
        ;;
    x86)
        optdepends=("android-google-apis-x86: AVD support"
                    "android-x86-system-image: AVD support")
        ;;
    x86-64)
        optdepends=("android-google-apis-x86-64: AVD support"
                    "android-x86-64-system-image: AVD support")
        ;;
    *)
        ;;
esac

options=(!strip !buildflags staticlibs !emptydirs)
_pkgfqn="qt-everywhere-src-${pkgver}"
install="${pkgname}.install"
source=("http://download.qt-project.org/official_releases/qt/${pkgver:0:4}/${pkgver}/single/${_pkgfqn}.tar.xz"
        "0001-Support-pkg-config-under-Android.patch"
        "0002-Use-pkg-config-to-find-external-libraries.patch")
md5sums=('e7ea948ab99a2ef0726db5eac8e4fd8e'
         '6af9dcc450ae6c69d8fddccf0680d84a'
         'f0f5dda8352a675566a08fa0f863a08b')

prepare() {
    cd ${_pkgfqn}
    source android-env ${_android_arch}

    check_ndk_version_ge_than 18.0
    check_android_platform

    patch -Np1 -i "../0001-Support-pkg-config-under-Android.patch"
    patch -Np1 -i "../0002-Use-pkg-config-to-find-external-libraries.patch"

    sed -i "s/android-21/android-$ANDROID_MINIMUM_PLATFORM/g" qtbase/configure.pri
}

build() {
    cd ${_pkgfqn}
    source android-env ${_android_arch}

    unset CC
    unset CXX
    unset CFLAGS
    unset CXXFLAGS
    unset LDFLAGS
    unset CHOST
    unset QMAKESPEC
    unset QTDIR
    unset CARCH
    export PKG_CONFIG=$ANDROID_PKGCONFIG
    export PYTHON=/usr/bin/python2
    export ANDROID_TARGET_ARCH="${ANDROID_ABI}"

    configue_opts="
        -confirm-license
        -opensource
        -silent
        -prefix ${ANDROID_PREFIX}
        -examplesdir ${ANDROID_PREFIX_SHARE}/qt5/examples
        -testsdir ${ANDROID_PREFIX_SHARE}/qt5/tests
        -xplatform android-clang
        -nomake tests
        -nomake examples
        -skip qtserialport
        -skip qtwebengine
        -no-warnings-are-errors
        -pkg-config
        -system-libjpeg
        -system-libpng
        -system-tiff
        -system-webp
        -system-zlib
        -no-feature-geoservices_mapbox
        -no-feature-geoservices_mapboxgl
        -openssl-runtime
        -qt-freetype
        -android-sdk ${ANDROID_HOME}
        -android-ndk ${ANDROID_NDK_HOME}
        -android-ndk-host linux-x86_64
        -android-abis ${ANDROID_ABI}
        -android-ndk-platform ${ANDROID_NDK_PLATFORM}
        -recheck-all
        -optimized-qmake
        -I${ANDROID_PREFIX}/include"

    [[ $QT_ANDROID_DEBUG_BUILD ]] \
        && configue_opts+=' -debug-and-release' \
        || configue_opts+=' -release'

    # Platform specific patches
    case "$_android_arch" in
        x86*)
             configue_opts+="
                 -no-sql-mysql
                 -no-sql-psql"
            ;;
        *)
            ;;
    esac

    ./configure ${configue_opts}
    make $MAKEFLAGS
}

package() {
    cd ${_pkgfqn}
    source android-env ${_android_arch}

    make INSTALL_ROOT=${pkgdir} install

    rm -rvf ${pkgdir}/libs
    find ${pkgdir}/${ANDROID_PREFIX_BIN} -type f ! -name '*.pl' -exec strip -s {} \;
    find ${pkgdir}/${ANDROID_PREFIX_LIB} -type f -name 'lib*.so' -exec ${ANDROID_STRIP} -g --strip-unneeded {} \;
#    find ${pkgdir}/${ANDROID_PREFIX_LIB} -type f \( -name 'lib*.a' ! -name 'libQt5Bootstrap.a' ! -name 'libQt5QmlDevTools.a' \) -exec ${ANDROID_STRIP} -g {} \;
    find ${pkgdir}/${ANDROID_PREFIX}/plugins -type f -name 'lib*.so' -exec ${ANDROID_STRIP} -g --strip-unneeded {} \;
    find ${pkgdir}/${ANDROID_PREFIX}/qml -type f -name 'lib*.so' -exec ${ANDROID_STRIP} -g --strip-unneeded {} \;
    sed -i '/QMAKE_PRL_BUILD_DIR/d' ${pkgdir}/${ANDROID_PREFIX_LIB}/lib*.prl
}
