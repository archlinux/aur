# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# This file is created from PKGBUILD.sh.ep contained by the mentioned repository.
# Do not edit it manually! See README.md in the repository's root directory
# for more information.

# All patches are managed at https://github.com/Martchus/qtbase

_android_arch=aarch64
pkgname=android-aarch64-qt6-base
_qtver=6.7.2
pkgver=${_qtver/-/}
pkgrel=1
arch=(any)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='A cross-platform application and UI framework (android)'
depends=('java-runtime-headless-openjdk>=11' 'ant' 'android-ndk' 'android-sdk' 'android-sdk-build-tools'
         'android-sdk-platform-tools' 'android-platform' "android-${_android_arch}-libjpeg-turbo"
         "android-${_android_arch}-libpng" "android-${_android_arch}-openssl" "android-${_android_arch}-zlib")
makedepends=('android-cmake' 'android-pkg-config'
             'java-environment-openjdk=17' 'qt6-base' 'ninja')
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
        '0008-Find-fontconfig-via-pkg-config-for-correct-handling-.patch'
        '0009-Fix-dependency-of-xcb-image-on-xcb-util.patch'
        '0010-Allow-using-properties-of-PkgConfig-targets-for-glib.patch'
        '0011-Allow-using-properties-of-PkgConfig-targets-for-Wayl.patch'
        '0012-Allow-overriding-preference-for-shared-libzstd-libra.patch'
        '0013-Fix-errors-due-to-disabled-exceptions-with-cpp_winrt.patch'
        '0014-Fix-setting-exception-flags-of-plugin-targets.patch'
        '0015-Link-corelib-correctly-against-runtimeobject-when-co.patch'
        '0016-Workaround-linker-error-about-missing-symbol-__sync_.patch'
        '0017-Workaround-Unknown-CMake-command-_qt_test_emscripten.patch'
        '0018-Fix-configuration-when-EMSCRIPTEN_ROOT-is-an-absolut.patch')
sha256sums=('c5f22a5e10fb162895ded7de0963328e7307611c688487b5d152c9ee64767599'
            '217fa5c44df0277155e2ef3d4cae8fc9285e379379a411d8ca1f3fc1324b6989'
            '972e547f5e67ddaefab50d214f314efc28e79bf833354f358a1e1ab6a2f8d707'
            '2f468ed9d2df0c4268b36899496c117f2ce79ba3f93baf02697ae3b78893546e'
            'd392e4333b5c22fe9311c2e6eff5e2fc9475125b1ee7cb3b674ce2c6ecea0ff0'
            'f9b5bf7e7b2596ceb3a5f6128df4d5673d3924db3a171297eaf7354379f5bb73'
            '08316d483dcbf4fb09dfa57e8813842d9a9676b74d0526977e7c972d49137a81'
            '284ee48fef5fc950b13100406b51603edab78a3ce844b30c283e7d43cd680770'
            '3fa62a55e2bba3f1c61420b7b37f1cf51f57b8773da14d4d2fbd98cbe1a34d4f'
            'fae4939da47d5382daabcc219ae769bd9b0e58bc3574816da681f45b6d350aca'
            '47591452c62e9d50a1267d82c890173cfe211feb5fa2ad7d67ce92da56d452ab'
            '201897d416eba8a5c70a491bbfcbf854669322d1116240571a3757087c4e1623'
            '9f47f026417454ee04c9c6977fb8c0527b30dfe21481bb9aa1d519873fe520fa'
            'cb2ae60aa82697d81347752901f3c0f5ab59b49948b0d68fbbc61864434d50fb'
            'ae7f962f0532426ab5d63f40b5a42871f2a1dad66c69b0c3009ad6068c18d7e7'
            '28c8635532fa0864659223cf311da87c362db308b62cb9373fb7ca8cf745ed24'
            'fa7d743363115ac193b86820cdc39038a963ab540dbd52616b4f82bb67698538'
            '5da28b0cea5bdf027601201bdc3512d5723d6dc64faac74a1c1a10eeffd91fcb'
            'fb5d3896be9eada68ca77d9ff978adf30e8673f1736b56695766e74848a3e251')

prepare () {
  cd $_pkgfqn

  # apply patches; further descriptions can be found in patch files itself
  for patch in "$srcdir/"*.patch; do
    msg2 "Applying patch $patch"
    patch -p1 -i "$patch"
  done
}

build() {
  export PATH=/usr/lib/jvm/java-17-openjdk/bin:$PATH
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
