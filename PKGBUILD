# PKGCONFIG for android-qt5
# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Jiaxi Hu <sftrytry _AT_ gmail _DOT_ com>
# Contributor: jimmy00784 <jimmy00784@gmail.com>
# Contributor: Ricardo (XenGi) Band <email@ricardo.band>
# Contributor: Martchus <martchus@gmx.net>

_android_arch=aarch64
source android-env.sh ${_android_arch}

pkgname=android-${_android_arch}-qt5
pkgver=5.12.2
pkgrel=4
pkgdesc="Qt 5 for Android"
arch=('x86_64')
url='https://www.qt.io'
license=('GPL3' 'LGPL')
makedepends=('libgl'
             'sqlite'
             'zlib'
             'python2'
             'ruby'
             'gperf'
             'libxslt'
             'fontconfig')

if [ -z "${ANDROID_NO_DEPS}" ]; then
    depends=('java-runtime-headless-openjdk<=8'
            'apache-ant'
            'android-pkg-config'
            'android-ndk'
            "android-platform-$ANDROID_MINIMUM_PLATFORM"
            'android-sdk'
            'android-sdk-build-tools'
            'android-sdk-platform-tools')
else
    depends=('java-runtime-headless-openjdk<=8'
             'apache-ant'
             'android-pkg-config')
fi

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
md5sums=('99c2eb46e533371798b4ca2d1458e065'
         '0b19ddef193baddb656d3170635e6de6'
         '20d8bdd24102e9011b561b7361394728')

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
        -prefix ${ANDROID_LIBS}
        -examplesdir ${ANDROID_LIBS}/share/qt5/examples
        -testsdir ${ANDROID_LIBS}/share/qt5/tests
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
    STRIP=${ANDROID_NDK_HOME}/toolchains/${toolchain}/prebuilt/linux-x86_64/${stripFolder}/bin/strip
    find ${pkgdir}/${ANDROID_LIBS}/bin -type f ! -name '*.pl' -exec strip -s {} \;
    find ${pkgdir}/${ANDROID_LIBS}/lib -type f -name 'lib*.so' -exec ${ANDROID_STRIP} -g --strip-unneeded {} \;
#    find ${pkgdir}/${ANDROID_LIBS}/lib -type f \( -name 'lib*.a' ! -name 'libQt5Bootstrap.a' ! -name 'libQt5QmlDevTools.a' \) -exec ${ANDROID_STRIP} -g {} \;
    find ${pkgdir}/${ANDROID_LIBS}/plugins -type f -name 'lib*.so' -exec ${ANDROID_STRIP} -g --strip-unneeded {} \;
    find ${pkgdir}/${ANDROID_LIBS}/qml -type f -name 'lib*.so' -exec ${ANDROID_STRIP} -g --strip-unneeded {} \;
    sed -i '/QMAKE_PRL_BUILD_DIR/d' ${pkgdir}/${ANDROID_LIBS}/lib/lib*.prl
}
