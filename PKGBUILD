# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# This file is created from PKGBUILD.sh.ep contained by the mentioned repository.
# Do not edit it manually! See README.md in the repository's root directory
# for more information.

# All patches are managed at https://github.com/Martchus/qtbase

_android_arch=aarch64
pkgname=android-aarch64-qt6-base
_qtver=6.6.2
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
        '0008-Fix-crashes-in-rasterization-code-using-setjmp.patch'
        '0009-Find-fontconfig-via-pkg-config-for-correct-handling-.patch'
        '0010-Fix-dependency-of-xcb-image-on-xcb-util.patch'
        '0011-Allow-using-properties-of-PkgConfig-targets-for-glib.patch'
        '0012-Allow-using-properties-of-PkgConfig-targets-for-Wayl.patch'
        '0013-Allow-overriding-preference-for-shared-libzstd-libra.patch'
        '0014-Fix-errors-due-to-disabled-exceptions-with-cpp_winrt.patch'
        '0015-Fix-setting-exception-flags-of-plugin-targets.patch'
        '0016-Link-corelib-correctly-against-runtimeobject-when-co.patch'
        '0017-Workaround-linker-error-about-missing-symbol-__sync_.patch')
sha256sums=('b89b426b9852a17d3e96230ab0871346574d635c7914480a2a27f98ff942677b'
            '7691272ccd272a6b0a750777a7d8d738588145cefce1f250d6ad756fcf1fe3d4'
            '7dcb792c97098b44857e4932088b4164a85dc702f5f519654937ee38c98e5ffc'
            '140904d07d65e77080040337536f4ccd5285672e0d8867a3807a8b1f80c430a5'
            '17a09b620fc06518167f04fc5b28bd453c58ca3d32c70ef10e09802160843639'
            'eeb14b5298ec1b9b564ee78edc41670470e0efa68755f954b79ac83c684ea387'
            '5f1780805561985c9f575dbbefe704f5c61b622ce75bb4a30532f51c95ae1436'
            'adc1b10e565b10944951df9e10ce6999c0210071b75b7a4dd230f617d88aab4f'
            '54646442b7a00aa59d6be6ec7be95b2424fb4b152b0ee801451b38e8252c2c2f'
            'a8971b7c21da5ed1f7fcd02a69d4f1491303d991b0f84b83ed97367bb9778247'
            '9e97d8c5487c9212ffb00a1e90c7ccd11cb400696b77c94306e65360d2c11ede'
            '6d31790b364ce516d82b78f78146076d1f6b8fdf9adaa90c63aeb4cfb8dc00ee'
            '7be1875458af031925d2e91e262782f15801f6f5deff8babd0685037a7588d1f'
            'a73a8fbdbd14a132e97a58abf0b58270d2af43d86ba238a236265d1341e84d06'
            'c7c30f1da326b07abae0ab1c3f257cee0691c8b1ca26d1266978e77d6a769272'
            'a316377d963838af16c02645b88ac16cb49714e6df998a44675f8536dea72301'
            'fd77316b643ebde5bb607e871c1d7983273b1292798d510c848aa2873037ab9e'
            '120e463090b99b70235a722fb1a671b7b742cb77f5c400a3856da534fcfae356')

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
