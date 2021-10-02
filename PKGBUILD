# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# This file is created from PKGBUILD.sh.ep contained by the mentioned repository.
# Do not edit it manually! See README.md in the repository's root directory
# for more information.

# All patches are managed at https://github.com/Martchus/qtbase

_android_arch=aarch64
pkgname=android-aarch64-qt6-base
_qtver=6.2.0
pkgver=${_qtver/-/}
pkgrel=1
arch=(any)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='A cross-platform application and UI framework (android)'
depends=('java-runtime-headless-openjdk=8' 'ant' 'android-ndk' 'android-sdk' 'android-sdk-build-tools'
         'android-sdk-platform-tools' 'android-platform' "android-${_android_arch}-libjpeg-turbo"
         "android-${_android_arch}-libpng" "android-${_android_arch}-openssl" "android-${_android_arch}-zlib")
makedepends=('android-cmake' 'android-pkg-config'
             'java-environment-openjdk=8' 'qt6-base' 'ninja')
optdepends=('qt6-base: development tools')
options=('!strip' '!buildflags' 'staticlibs' '!emptydirs')
groups=(android-${_android_arch}-qt6)
_pkgfqn="qtbase-everywhere-src-${_qtver}"
source=("https://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz"
        '0001-Use-CMake-s-default-import-library-suffix.patch'
        '0002-Fix-finding-D-Bus.patch'
        '0003-Fix-using-static-PCRE2-and-DBus-1.patch'
        '0004-Fix-transitive-dependencies-of-static-libraries.patch'
        '0005-Fix-libjpeg-workaround-for-conflict-with-rpcndr.h.patch'
        '0006-Support-finding-static-MariaDB-client-library.patch'
        '0007-Allow-overriding-CMAKE_FIND_LIBRARY_SUFFIXES-to-pref.patch'
        '0008-Fix-crashes-in-rasterization-code-using-setjmp.patch')
sha256sums=('fdfff0716d093bcb6bcd53746ce1d3c9701a6bf3326d47813866d43949b47769'
            '02811ca9f69e29242e817cae9afbcbd6b0eb1377c5f680a835c517b9d82e42ff'
            '14524bf028ba07e04a6428e0eb2049d3743571d181d5037f65e2624af5e57bf4'
            '25c6fef400bac3b701ddf5d429d74fc744c612e683838cdf44b874bc24d379be'
            'b0cb32ec2dadc4479c9090f1f9326ff5b26550b94c88380e12ae68c0535f56af'
            '00ad6ee9b73a128a94e813cccf17122232063cb0dd503952b8858012da0cc2d3'
            'f33c044eed6224c4f71c43de5157c8ff1028ccdc3cefa7b26b37e6705ea7483c'
            '937833cb719d9ec40b049f4440002c4507666ea53bfd0f4f9af4cc849a9016e3'
            '3b40db6950bcbafd0d921b6d9683c03da47581a8b465cda6ac8781135ef8db17')

prepare () {
  cd $_pkgfqn

  # apply patches; further descriptions can be found in patch files itself
  for patch in "$srcdir/"*.patch; do
    msg2 "Applying patch $patch"
    patch -p1 -i "$patch"
  done
}

build() {
  source android-env ${_android_arch}
  android-${_android_arch}-cmake -G Ninja -B build-$_android_arch -S $_pkgfqn \
      -DCMAKE_FIND_ROOT_PATH="${ANDROID_PREFIX}" \
      -DQT_BINARY_DIR=${ANDROID_PREFIX_BIN} \
      -DQT_INCLUDE_DIRS_NO_SYSTEM=ON \
      -DQT_HOST_PATH=/usr \
      -DANDROID_SDK_ROOT=${ANDROID_HOME} \
      -DANDROID_NDK_ROOT=${ANDROID_NDK_HOME} \
      -DANDROID_STL="c++_shared" \
      -DFEATURE_pkg_config=ON \
      -DFEATURE_system_pcre2=OFF \
      -DFEATURE_system_freetype=OFF \
      -DFEATURE_system_harfbuzz=OFF \
      -DFEATURE_system_sqlite=OFF \
      -DFEATURE_system_libjpeg=ON \
      -DFEATURE_system_libpng=ON \
      -DFEATURE_system_zlib=ON \
      -DINSTALL_DOCDIR=share/doc/qt6 \
      -DINSTALL_EXAMPLESDIR=share/doc/qt6/examples \
      -DINPUT_openssl=runtime
  VERBOSE=1 cmake --build build-$_android_arch

  # note: Avoid using `-DINSTALL_` options like in the regular package to avoid any problems with androiddeployqt.
}

package() {
  source android-env ${_android_arch}
  DESTDIR="$pkgdir" cmake --install build-$_android_arch

  install -Dm644 $_pkgfqn/LICENSE* -t "$pkgdir"/usr/share/licenses/$pkgname

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/${ANDROID_PREFIX}/" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  find ${pkgdir}/${ANDROID_PREFIX} -type f -name 'lib*.so' -exec ${ANDROID_STRIP} -g --strip-unneeded {} \;
  find ${pkgdir}/${ANDROID_PREFIX} -type f -name 'lib*.a' -exec ${ANDROID_STRIP} -g {} \;
  [[ -d "${pkgdir}/${ANDROID_PREFIX}/share/doc" ]] && rm -r "${pkgdir}/${ANDROID_PREFIX}/share/doc" || true
}
