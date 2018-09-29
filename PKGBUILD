# PKGCONFIG for android-qt5
# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Jiaxi Hu <sftrytry _AT_ gmail _DOT_ com>
# Contributor: jimmy00784 <jimmy00784@gmail.com>
# Contributor: Ricardo (XenGi) Band <email@ricardo.band>
# Contributor: Martchus <martchus@gmx.net>

# Useful link to keep track of latest API changes:
#
# https://developer.android.com/ndk/downloads/revision_history

android_arch=armeabi-v7a

# Minimum Android platform based on:
#
# https://developer.android.com/about/dashboards/
if [ -z "${ANDROID_MINIMUM_PLATFORM}" ]; then
    export ANDROID_MINIMUM_PLATFORM=21
fi

if [ -z "${ANDROID_NDK_ROOT}" ]; then
    export ANDROID_NDK_ROOT=/opt/android-ndk
fi

if [ -z "${ANDROID_SDK_ROOT}" ]; then
    export ANDROID_SDK_ROOT=/opt/android-sdk
fi

_pkgname=android-qt5
pkgname=${_pkgname}-${android_arch}
pkgver=5.11.2
pkgrel=2
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
depends=('java-runtime-headless>=7'
         'apache-ant'
         'android-ndk'
         "android-platform-$ANDROID_MINIMUM_PLATFORM"
         'android-sdk'
         'android-sdk-build-tools'
         'android-sdk-platform-tools')
groups=('android-qt5')

case "$android_arch" in
    arm*)
        optdepends=('android-google-apis-armv7a-eabi: AVD support'
                    'android-armv7a-eabi-system-image: AVD support')
        ;;
    x86)
        optdepends=('android-google-apis-x86: AVD support'
                    'android-x86-system-image: AVD support')
        ;;
    x86_64)
        optdepends=('android-google-apis-x86-64: AVD support'
                    'android-x86-64-system-image: AVD support')
        ;;
    *)
        ;;
esac

options=('!strip'
         '!buildflags'
         'staticlibs'
         '!emptydirs')
_pkgfqn="qt-everywhere-src-${pkgver}"
source=("http://download.qt-project.org/official_releases/qt/${pkgver:0:4}/${pkgver}/single/${_pkgfqn}.tar.xz"
        "0001-Fix-clang-build.patch"
        "0002-Disable-mapbox.patch")
md5sums=('152a8ade9c11fe33ff5bc95310a1bb64'
         '511eafcabe9e0c6210f1dc5e26daa5c8'
         '20d8bdd24102e9011b561b7361394728')

prepare() {
    cd ${_pkgfqn}

    # Platform specific patches.
    patch -Np1 -i "../0001-Fix-clang-build.patch"
    patch -Np1 -i "../0002-Disable-mapbox.patch"
}

get_last() {
    ls $1 | sort -V | tail -n 1
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

    if [ -z "${ANDROID_BUILD_TOOLS_REVISION}" ]; then
        export ANDROID_BUILD_TOOLS_REVISION=$(get_last ${ANDROID_SDK_ROOT}/build-tools)
    fi

    if [ -z "${ANDROID_API_VERSION}" ]; then
        export ANDROID_API_VERSION=android-$ANDROID_MINIMUM_PLATFORM
    fi

    export PYTHON=/usr/bin/python2

    if [ -z "${ANDROID_NDK_PLATFORM}" ]; then
        export ANDROID_NDK_PLATFORM=android-$ANDROID_MINIMUM_PLATFORM
    fi

    _pref=/opt/${_pkgname}/${android_arch}

    configue_opts="
        -confirm-license
        -opensource
        -silent
        -prefix ${_pref}
        -docdir ${_pref}/doc
        -xplatform android-clang
        -nomake tests
        -nomake examples
        -android-ndk ${ANDROID_NDK_ROOT}
        -android-sdk ${ANDROID_SDK_ROOT}
        -android-ndk-host linux-x86_64
        -android-toolchain-version 4.9
        -skip qttranslations
        -skip qtserialport
        -no-warnings-are-errors
        -no-pkg-config
        -qt-zlib
        -qt-freetype
        -android-arch ${android_arch}
        -android-ndk-platform ${ANDROID_NDK_PLATFORM}"

    # Platform specific patches
    case "$android_arch" in
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

    case "$android_arch" in
        arm64-v8a)
            toolchain=aarch64-linux-android-4.9
            stripFolder=aarch64-linux-android
            ;;
        armeabi-v7a)
            toolchain=arm-linux-androideabi-4.9
            stripFolder=arm-linux-androideabi
            ;;
        x86)
            toolchain=x86-4.9
            stripFolder=i686-linux-android
            ;;
        x86_64)
            toolchain=x86_64-4.9
            stripFolder=x86_64-linux-android
            ;;
    esac

    STRIP=${ANDROID_NDK_ROOT}/toolchains/${toolchain}/prebuilt/linux-x86_64/${stripFolder}/bin/strip
    find ${pkgdir}/opt/${_pkgname}/${android_arch}/lib -name 'lib*.so' -exec ${STRIP} {} \;
    find ${pkgdir}/opt/${_pkgname}/${android_arch}/lib \( -name 'lib*.a' ! -name 'libQt5Bootstrap.a' ! -name 'libQt5QmlDevTools.a' \) -exec ${STRIP} {} \;
    find ${pkgdir}/opt/${_pkgname}/${android_arch}/plugins -name 'lib*.so' -exec ${STRIP} {} \;
    sed -i '/QMAKE_PRL_BUILD_DIR/d' ${pkgdir}/opt/${_pkgname}/${android_arch}/lib/lib*.prl
}
