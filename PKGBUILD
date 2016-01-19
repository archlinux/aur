#PKGCONFIG for android-qt5 for qt 5.5
# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Jiaxi Hu <sftrytry _AT_ gmail _DOT_ com>
# Contributor: jimmy00784 <jimmy00784@gmail.com>
# Contributor: Ricardo (XenGi) Band <email@ricardo.band>

pkgname='android-qt5'
pkgver=5.5.1
_pkgver=5.5
pkgrel=2
pkgdesc="Qt 5 for Android"
arch=('i686' 'x86_64')
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
groups=('qt-android')
# Uninstalling 'tk' and 'tcl' packages is recommended since it causes build
# conflicts.
conflicts=('qt-android')
optdepends=('android-armv7a-eabi-system-image: AVD support'
            'android-google-apis-x86: AVD support'
            'android-google-apis-x86-64: AVD support'
            'android-x86-64-system-image: AVD support'
            'android-x86-system-image: AVD support')
_pkgfqn="qt-everywhere-opensource-src-${pkgver}"
source=("http://download.qt-project.org/official_releases/qt/${_pkgver}/${pkgver}/single/${_pkgfqn}.tar.xz")
sha256sums=('6f028e63d4992be2b4a5526f2ef3bfa2fe28c5c757554b11d9e8d86189652518')

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

    export ANDROID_SDK_ROOT=/opt/android-sdk
    export ANDROID_BUILD_TOOLS_REVISION=23.0.2
    export ANDROID_API_VERSION=android-23
    export PYTHON=/usr/bin/python2

    ./configure -confirm-license -opensource \
        -prefix /opt/android-qt5/${pkgver} \
        -docdir /usr/share/doc/android-qt5-${_pkgver} \
        -xplatform android-g++ \
        -nomake tests \
        -nomake examples \
        -android-ndk /opt/android-ndk \
        -android-sdk /opt/android-sdk \
        -android-ndk-host ${ndkhost} \
        -android-toolchain-version 4.9 \
        -skip qttranslations \
        -skip qtwebkit \
        -skip qtserialport \
        -skip qtwebkit-examples \
        -no-warnings-are-errors \
        -qt-zlib \
        -qt-freetype
#        -android-ndk-platform android-21 \
#        -android-arch armeabi-v7a \

    make || return 1
}

package() {
    cd ${_pkgfqn}
    make INSTALL_ROOT=${pkgdir} install
}
