# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# This file is created from PKGBUILD.sh.ep contained by the mentioned repository.
# Do not edit it manually! See README.md in the repository's root directory
# for more information.

# All patches are managed at https://github.com/Martchus/qtbase

_android_arch=aarch64
pkgname=android-aarch64-qt6-base
_qtver=6.7.3
pkgver=${_qtver/-/}
pkgrel=1
arch=(any)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='A cross-platform application and UI framework (android)'
depends=('java-runtime-headless-openjdk=17' 'ant' 'android-ndk' 'android-sdk' 'android-sdk-build-tools'
         'android-sdk-platform-tools' 'android-platform-34' "android-${_android_arch}-libjpeg-turbo"
         "android-${_android_arch}-libpng" "android-${_android_arch}-openssl" "android-${_android_arch}-zlib")
makedepends=('android-cmake' 'android-pkg-config'
             'java-environment-openjdk=17' 'qt6-base' 'ninja')
optdepends=('qt6-base: development tools')
# note: Using the java-environment-openjdk and android-platform-X versions that match what is documented
# on https://doc.qt.io/qt-6/supported-platforms.html#android because using unsupported versions is not a
# good idea (see e.g. https://bugreports.qt.io/browse/QTBUG-119223 for Java; using a newer version of
# android-platform also did not work in my tests with Qt 6.7.2 and android-platform 35).
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
sha256sums=('8ccbb9ab055205ac76632c9eeddd1ed6fc66936fc56afc2ed0fd5d9e23da3097'
            'af547377e9d6d6ab757fbcbc1c555cf3c4bf345838bceb0e4e4cb176515a8a81'
            '523bc7177d282f71d0d70d8ea6fb83861e45d9b8882f88df8a71e4276619bd15'
            '14070979d32a347bfab32aaf6d05245ddcadc30c75541f4a84cadf635d12ef41'
            '0499063e794112a910c2b50bd4c0d393efcb3e78251551d403091c2cb8b0ed99'
            'b5219ef30553b2cf2c581b3af16e44dfa2c4fe32779bae27ea383d64b6134557'
            'f0194a9b8c724926f893eda11a2d9e10f3bd2eb19bb7f0593ea8addce80eb0d9'
            '4aa57b28d808acf23c77271cfa1cba20352e0e05cd887009bdf59d2f16e7ca14'
            'f17dbc7ead2be8d8b9dac6e88e499a0981fd350134329a6dd1ad7d815c0cfa10'
            'a811e3678c3bad11e8798ea90d84690c73a6151042bc4d202af647b1cdb25537'
            '1fa56c96eefdfe64d16bc46bbf7a815b18491c706e9d902dc91a66f874654535'
            '2c6aaee3715fc94aec622b0e33290ec2ec388f7301220b3d8edeceba7b871bc0'
            'e496216b356067e9d8ec18648a3aa97845a0f1a9e644a879eeda883525349f86'
            'b15f4555a7f271824e87995fe5eb0bd7b9cb86c8c1286a2f23e4eb35c8e62ce6'
            '7541ed5a3fbaec82edec6aefc4a5f350dfd9ca38e505be9adc6e3bdedee5d6a4'
            'ca1fb271f30d606ffdc0a8688ba510ed3597b6d84ac9a1f8a1e42ecf6111397c'
            '842cff7c1d91ed3665925b9295a054f9ce1c85d904f7de520d42859a5e3af01f'
            '129e3572ed9dd9ab9e172093748fa81469f31eaf5870dd6dc3a9768ebfc18883'
            '3a86f0edfe27fa14abd4fa8b10f9e9bcf289d23808829991b40834d04abaeb2e')

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
