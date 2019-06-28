# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Jiaxi Hu <sftrytry _AT_ gmail _DOT_ com>
# Contributor: jimmy00784 <jimmy00784@gmail.com>
# Contributor: Ricardo (XenGi) Band <email@ricardo.band>
# Contributor: Martchus <martchus@gmx.net>

_android_arch=armv7a-eabi
source android-env ${_android_arch}

pkgname=android-${_android_arch}-qt5
pkgver=5.13.0
pkgrel=1
pkgdesc="Qt 5 for Android"
arch=('any')
url='https://www.qt.io'
license=('GPL3' 'LGPL')
makedepends=('android-environment'
             'libgl'
             'sqlite'
             'zlib'
             'python2'
             'ruby'
             'gperf'
             'libxslt'
             'fontconfig')
depends=('java-runtime-headless-openjdk<=8'
        'apache-ant'
        'android-pkg-config'
        'android-ndk'
        "android-platform-$ANDROID_MINIMUM_PLATFORM"
        'android-sdk'
        'android-sdk-build-tools'
        'android-sdk-platform-tools')
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
        "0001-Fix-clang-build.patch"
        "0002-Disable-mapbox.patch")
md5sums=('3c168d9a3a08248ff36f4f54c82e437f'
         'SKIP'
         'SKIP')

prepare() {
    cd ${_pkgfqn}
    check_ndk_version_ge_than 18.0

    # Platform specific patches.

    patch -Np1 -i "../0001-Fix-clang-build.patch"
    patch -Np1 -i "../0002-Disable-mapbox.patch"
    sed -i "s/android-16/android-$ANDROID_MINIMUM_PLATFORM/g" qtbase/mkspecs/features/android/sdk.prf
    sed -i "s/android-16/android-$ANDROID_MINIMUM_PLATFORM/g" qtbase/src/android/jar/jar.pro
    sed -i "s/android-16/android-$ANDROID_MINIMUM_PLATFORM/g" qtgamepad/src/plugins/gamepads/android/jar/jar.pro
    sed -i "s/android-16/android-$ANDROID_MINIMUM_PLATFORM/g" qtbase/configure.pri
}

build() {
    cd ${_pkgfqn}

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

    case "$_android_arch" in
        aarch64)
            target_arch=arm64-v8a
            ;;
        armv7a-eabi)
            target_arch=armeabi-v7a
            ;;
        x86)
            target_arch=x86
            ;;
        x86-64)
            target_arch=x86_64
            ;;
    esac

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
        -android-sdk ${ANDROID_HOME}
        -android-ndk ${ANDROID_NDK_HOME}
        -android-ndk-host linux-x86_64
        -android-toolchain-version 4.9
        -skip qttranslations
        -skip qtserialport
        -no-warnings-are-errors
        -pkg-config
        -qt-zlib
        -qt-freetype
        -android-arch ${target_arch}
        -android-ndk-platform ${ANDROID_NDK_PLATFORM}"

    [[ $ANDROID_DEBUG_BUILD ]] \
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

    make INSTALL_ROOT=${pkgdir} install
    find ${pkgdir}/${ANDROID_PREFIX_BIN} -type f ! -name '*.pl' -exec strip -s {} \;
    find ${pkgdir}/${ANDROID_PREFIX_LIB} -type f -name 'lib*.so' -exec ${ANDROID_STRIP} -g --strip-unneeded {} \;
#    find ${pkgdir}/${ANDROID_PREFIX_LIB} -type f \( -name 'lib*.a' ! -name 'libQt5Bootstrap.a' ! -name 'libQt5QmlDevTools.a' \) -exec ${ANDROID_STRIP} -g {} \;
    find ${pkgdir}/${ANDROID_PREFIX}/plugins -type f -name 'lib*.so' -exec ${ANDROID_STRIP} -g --strip-unneeded {} \;
    find ${pkgdir}/${ANDROID_PREFIX}/qml -type f -name 'lib*.so' -exec ${ANDROID_STRIP} -g --strip-unneeded {} \;
    sed -i '/QMAKE_PRL_BUILD_DIR/d' ${pkgdir}/${ANDROID_PREFIX_LIB}/lib*.prl
}
