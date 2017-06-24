#PKGCONFIG for android-qt5
# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Jiaxi Hu <sftrytry _AT_ gmail _DOT_ com>
# Contributor: jimmy00784 <jimmy00784@gmail.com>
# Contributor: Ricardo (XenGi) Band <email@ricardo.band>

android_arch=mips
_pkgname=android-qt5
pkgname=${_pkgname}-${android_arch}
pkgver=5.9.0
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
         'android-platform'
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

_pkgfqn="qt-everywhere-opensource-src-${pkgver}"
options=('!strip' '!buildflags' 'staticlibs' '!emptydirs')
source=("http://download.qt-project.org/official_releases/qt/${pkgver:0:3}/${pkgver}/single/${_pkgfqn}.tar.xz"
        "JavaScriptCore.pri.patch"
        "geoservices.pro.patch")
sha256sums=('f70b5c66161191489fc13c7b7eb69bf9df3881596b183e7f6d94305a39837517'
            '133dad6c8d0bedaa5d561be26b2f7185e671900c50d11476ecb2e2ef6792d455'
            'f0770923c55725417b7f334b7558371fc9833ae914b81a456d9beee7a3eeab8b')

prepare() {
    cd ${_pkgfqn}

    # Platform specific patches.
    case "$android_arch" in
        armeabi)
            # Disable JIT.
            patch -Np1 -i "../JavaScriptCore.pri.patch"
            patch -Np1 -i "../geoservices.pro.patch"
            ;;
        *)
            ;;
    esac
}

get_last() {
    ls $1 | sort -V | tail -n 1
}

get_last_platform() {
    ls $1 | grep 'android-' | sort -V | tail -n 1
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

    if [ "${CARCH}" == 'i686' ]; then
        ndkhost='linux-x86'
    elif [ "${CARCH}" == 'x86_64' ]; then
        ndkhost='linux-x86_64'
    fi

    unset CARCH

    export ANDROID_NDK_ROOT=/opt/android-ndk
    export ANDROID_SDK_ROOT=/opt/android-sdk

    if [ -z "${ANDROID_BUILD_TOOLS_REVISION}" ]; then
        export ANDROID_BUILD_TOOLS_REVISION=$(get_last ${ANDROID_SDK_ROOT}/build-tools)
    fi

    if [ -z "${ANDROID_API_VERSION}" ]; then
        export ANDROID_API_VERSION=$(get_last ${ANDROID_SDK_ROOT}/platforms)
    fi

    export PYTHON=/usr/bin/python2

    if [ -z "${ANDROID_NDK_PLATFORM}" ]; then
        ndkPlatform=$(get_last_platform ${ANDROID_NDK_ROOT}/platforms)
    else
        ndkPlatform=${ANDROID_NDK_PLATFORM}
    fi

    _pref=/opt/${_pkgname}/${pkgver}/${android_arch}

    configue_opts="
        -confirm-license
        -opensource
        -prefix ${_pref}
        -docdir ${_pref}/doc
        -xplatform android-g++
        -nomake tests
        -nomake examples
        -android-ndk ${ANDROID_NDK_ROOT}
        -android-sdk ${ANDROID_SDK_ROOT}
        -android-ndk-host ${ndkhost}
        -android-toolchain-version 4.9
        -skip qttranslations
        -skip qtserialport
        -no-warnings-are-errors
        -no-pkg-config
        -qt-zlib
        -qt-freetype
        -android-arch ${android_arch}
        -android-ndk-platform ${ndkPlatform}"

    # Platform specific patches
    case "$android_arch" in
        x86)
             configue_opts+="
                 -no-sql-mysql
                 -no-sql-psql"
            ;;
        x86_64)
             configue_opts+="
                 -no-sql-mysql
                 -no-sql-psql"
            ;;
        *)
            ;;
    esac

    ./configure ${configue_opts}

    make || return 1
}

package() {
    cd ${_pkgfqn}

    make INSTALL_ROOT=${pkgdir} install

    case "$android_arch" in
        arm64-v8a)
            toolchain=aarch64-linux-android-4.9
            stripFolder=aarch64-linux-android
            ;;
        armeabi*)
            toolchain=arm-linux-androideabi-4.9
            stripFolder=arm-linux-androideabi
            ;;
        mips)
            toolchain=mipsel-linux-android-4.9
            stripFolder=mipsel-linux-android
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

    export ANDROID_NDK_ROOT=/opt/android-ndk
    STRIP=${ANDROID_NDK_ROOT}/toolchains/${toolchain}/prebuilt/linux-x86_64/${stripFolder}/bin/strip
    find ${pkgdir}/opt/${_pkgname}/${pkgver}/${android_arch}/lib -name 'lib*.so' -exec ${STRIP} {} \;
    find ${pkgdir}/opt/${_pkgname}/${pkgver}/${android_arch}/lib \( -name 'lib*.a' ! -name 'libQt5Bootstrap.a' ! -name 'libQt5QmlDevTools.a' \) -exec ${STRIP} {} \;
    find ${pkgdir}/opt/${_pkgname}/${pkgver}/${android_arch}/plugins -name 'lib*.so' -exec ${STRIP} {} \;
}
