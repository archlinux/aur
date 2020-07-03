# Maintainer: Martchus <martchus@gmx.net>
# Contributor (maintains regular package): Antonio Rojas <arojas@archlinux.org>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_pkgname=kirigami2
_android_arch=x86_64
_pkg_arch=x86-64
_android_toolchain=$_pkg_arch-linux-android
_android_platform=22
_prefix=/opt/android-libs/$_pkg_arch

pkgname=android-$_pkg_arch-$_pkgname
pkgver=5.71.0
pkgrel=1
pkgdesc="A QtQuick based components set (Android, $_pkg_arch)"
arch=('any')
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=("android-$_pkg_arch-qt5")
makedepends=('cmake' 'android-ndk' 'android-sdk' 'extra-cmake-modules')
conflicts=("android-$_pkgname-$_android_arch")
replaces=("android-$_pkgname-$_android_arch")
source=("https://download.kde.org/stable/frameworks/${pkgver%.*}/$_pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('f323efb96a809dc9e572a0e68e04c4f485fc27f9ae65ffa3988830e348151356'
            'SKIP')
validpgpkeys=('53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB') # David Faure <faure@kde.org>
options=(!buildflags staticlibs !strip !emptydirs)

prepare() {
  mkdir -p build
}

build() {
  cd build

  # note: needs workaround for https://gitlab.kitware.com/cmake/cmake/issues/18739 (currently provided outside of the PKGBUILD itself)

  cmake ../$_pkgname-$pkgver \
    -DCMAKE_SYSTEM_NAME=Android \
    -DCMAKE_SYSTEM_VERSION=$_android_platform \
    -DANDROID_ABI=$_android_arch \
    -DCMAKE_ANDROID_ARCH_ABI=$_android_arch \
    -DCMAKE_ANDROID_NDK=/opt/android-ndk \
    -DCMAKE_ANDROID_SDK=/opt/android-sdk \
    -DCMAKE_ANDROID_STL_TYPE=c++_shared \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="$_prefix" \
    -DCMAKE_EXE_LINKER_FLAGS="-Wl,-rpath-link,$_prefix/lib" \
    -DCMAKE_FIND_ROOT_PATH="/opt/android-ndk/sysroot;$_prefix" \
    -DECM_DIR=/usr/share/ECM/cmake \
    -DBUILD_EXAMPLES=OFF \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  make VERBOSE=1
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
