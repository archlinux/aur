# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# This file is created from PKGBUILD.sh.ep contained by the mentioned repository.
# Do not edit it manually! See README.md in the repository's root directory
# for more information.

# All patches are managed at https://github.com/Martchus/qtbase

_android_arch=aarch64
pkgname=android-aarch64-qt6-base
_qtver=6.4.1
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
        '0008-Fix-crashes-in-rasterization-code-using-setjmp.patch'
        '0009-Find-fontconfig-via-pkg-config-for-correct-handling-.patch'
        '0010-Fix-dependency-of-xcb-image-on-xcb-util.patch'
        '0011-Allow-using-properties-of-PkgConfig-targets-for-glib.patch'
        '0012-Allow-using-properties-of-PkgConfig-targets-for-Wayl.patch')
sha256sums=('532ad71cc0f9c8f7cb92766c47bc3d23263c60876becd9053802f9727af24fae'
            '6aea45d1f820ff6b447a4d15773ce15389de7ed4e537788f62ed77676cc6c42f'
            '1576f074c32c14e73a8b71445a5872b467d6ab1378e9a4eeeaf2a958b9d7cfe6'
            '36d024993349d4f671e8caf27b05213301a3e00c138a8dc1511b4869a77022b8'
            '9307389e5e21a9cb194606b704882c313bdbfeae933bf88d40b7cf1378638e26'
            'ef675f0ecca827066dbcff73395467881a4b912afb83d0ded1bcd2a0468be5da'
            '65dbc0e805fdd5bd43c8a9e509f20ae4159235cc2e56ce9080b9bd5c560000d6'
            '5a9fad4e1765b4ddc8479255cad3dede58defb0b0103c38bde3a1cfad02298b9'
            '26eda5d063b19553d8e6f6a9bd9c447e0fdbaf672351dfe763ca310ca5552061'
            '85cd61a2099af49c2bb93e06ead056524e9bb47ffab479f5df2fea5ffd420b69'
            '89d93e9ac08b96b7eb6fd3d080e80404522f037803b3953f63ec7fcc9b26fd29'
            'b94517bf2d57a8d635207fdaf6e7ab5dd20ee66c0eb5a2080a769ffed90bab7f'
            '075d509531e4e70f9b85c9accb38cc326b27b16a231613a9e3bfe80e2e188a70')

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

  install -Dm644 $_pkgfqn/LICENSES/* -t "$pkgdir"/usr/share/licenses/$pkgname

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/${ANDROID_PREFIX}/" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  find ${pkgdir}/${ANDROID_PREFIX} -type f -name 'lib*.so' -exec ${ANDROID_STRIP} -g --strip-unneeded {} \;
  find ${pkgdir}/${ANDROID_PREFIX} -type f -name 'lib*.a' -exec ${ANDROID_STRIP} -g {} \;
  [[ -d "${pkgdir}/${ANDROID_PREFIX}/share/doc" ]] && rm -r "${pkgdir}/${ANDROID_PREFIX}/share/doc" || true
}
