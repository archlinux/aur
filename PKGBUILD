# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Jiaxi Hu <sftrytry _AT_ gmail _DOT_ com>
# Contributor: jimmy00784 <jimmy00784@gmail.com>
# Contributor: Ricardo (XenGi) Band <email@ricardo.band>
# Contributor: Martchus <martchus@gmx.net>

_android_arch=x86-64

pkgname=android-${_android_arch}-qt5
pkgver=5.13.2
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
         "android-${_android_arch}-zlib"
         "android-${_android_arch}-libpng"
         "android-${_android_arch}-libjpeg-turbo"
         "android-${_android_arch}-openssl")
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
        "0001-Fix-clang-libc-build-under-Android.patch"
        "0002-Disable-mapboxgl.patch"
        "0003-Support-pkg-config-under-Android.patch"
        "0004-Use-pkg-config-to-find-libjpeg.patch")
md5sums=('7c04c678d4ecd9e9c06747e7c17e0bb9'
         '0658c31a909beba3e73e503060df5fba'
         '2fafec93d1dc9da0797095b815a60d88'
         '621a2b82623d5514be88d15700e9eb20'
         '9e4577ed83ed53a7758f4bfbb5ddbe98')

prepare() {
    cd ${_pkgfqn}
    source android-env ${_android_arch}

    check_ndk_version_ge_than 18.0
    check_android_platform

    # Platform specific patches.

    patch -Np1 -i "../0001-Fix-clang-libc-build-under-Android.patch"

    # Skip building mapboxgl as it increases compile time significantly and
    # likely not a lot of people actually using it; if you need it, just remove the
    # following line:
    patch -Np1 -i "../0002-Disable-mapboxgl.patch"

    patch -Np1 -i "../0003-Support-pkg-config-under-Android.patch"
    patch -Np1 -i "../0004-Use-pkg-config-to-find-libjpeg.patch"

    sed -i "s/android-16/android-$ANDROID_MINIMUM_PLATFORM/g" qtbase/mkspecs/features/android/sdk.prf
    sed -i "s/android-16/android-$ANDROID_MINIMUM_PLATFORM/g" qtbase/src/android/jar/jar.pro
    sed -i "s/android-16/android-$ANDROID_MINIMUM_PLATFORM/g" qtgamepad/src/plugins/gamepads/android/jar/jar.pro
    sed -i "s/android-16/android-$ANDROID_MINIMUM_PLATFORM/g" qtbase/configure.pri
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
        -skip qtserialport
        -no-warnings-are-errors
        -pkg-config
        -pkg-config
        -system-zlib
        -system-libpng
        -system-libjpeg
        -openssl-runtime
        -qt-freetype
        -android-arch ${ANDROID_ABI}
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

    find ${pkgdir}/${ANDROID_PREFIX_BIN} -type f ! -name '*.pl' -exec strip -s {} \;
    find ${pkgdir}/${ANDROID_PREFIX_LIB} -type f -name 'lib*.so' -exec ${ANDROID_STRIP} -g --strip-unneeded {} \;
#    find ${pkgdir}/${ANDROID_PREFIX_LIB} -type f \( -name 'lib*.a' ! -name 'libQt5Bootstrap.a' ! -name 'libQt5QmlDevTools.a' \) -exec ${ANDROID_STRIP} -g {} \;
    find ${pkgdir}/${ANDROID_PREFIX}/plugins -type f -name 'lib*.so' -exec ${ANDROID_STRIP} -g --strip-unneeded {} \;
    find ${pkgdir}/${ANDROID_PREFIX}/qml -type f -name 'lib*.so' -exec ${ANDROID_STRIP} -g --strip-unneeded {} \;
    sed -i '/QMAKE_PRL_BUILD_DIR/d' ${pkgdir}/${ANDROID_PREFIX_LIB}/lib*.prl
}
