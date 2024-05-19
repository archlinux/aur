# Maintainer: Martchus <martchus@gmx.net>
# Based on: AUR packages qt6-base-git and mingw-w64-qt6-base-git, official qt5-base package

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# This file is created from PKGBUILD.sh.ep contained by the mentioned repository.
# Do not edit it manually! See README.md in the repository's root directory
# for more information.

# All patches are managed at https://github.com/Martchus/qtbase

pkgname=mingw-w64-qt6-base-static
_qtver=6.7.0
pkgver=${_qtver/-/}
pkgrel=1
arch=(any)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='A cross-platform application and UI framework (mingw-w64)'
depends=('mingw-w64-crt' 'mingw-w64-cppwinrt' 'mingw-w64-zlib' 'mingw-w64-libjpeg-turbo' 'mingw-w64-sqlite'
         'mingw-w64-libpng' 'mingw-w64-openssl' 'mingw-w64-dbus' 'mingw-w64-harfbuzz'
         'mingw-w64-brotli' 'mingw-w64-pcre2' 'mingw-w64-zstd')
makedepends=('mingw-w64-cmake-static' 'mingw-w64-postgresql' 'mingw-w64-mariadb-connector-c'
             'mingw-w64-vulkan-headers' 'mingw-w64-vulkan-icd-loader' 'mingw-w64-pkg-config'
             'qt6-base' 'ninja')
optdepends=('mingw-w64-postgresql: PostgreSQL driver'
            'mingw-w64-mariadb-connector-c: MariaDB driver'
            'qt6-base: development tools')
options=('!strip' '!buildflags' 'staticlibs' '!emptydirs')
groups=(mingw-w64-qt6)
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
        '0017-Fix-wrong-cpp-conditional-in-qspan.h.patch')
sha256sums=('11b2e29e2e52fb0e3b453ea13bbe51a10fdff36e1c192d8868c5a40233b8b254'
            'e25f83ddf9e3f9eefcb833751cff8957f32cb2f13f5a1f033679b45d2c9e544e'
            'ae4a20f41df34eefc960ed5cb2cf54afb421573f08545d5492882edd18e00a3c'
            '5d329d722365c07a28b85a9d1ba9c6c53ad19124662aa1825cdd78ece82c47f3'
            '86dd06b2a1bd7b050763346d2bd16a63c914c516782df64a3c6c78268ea33e06'
            '4390d712d64d50e2cd8d0cea3a53317cda4e7a21bd99a346f1bd82d18514b6f5'
            '73c2780b8efe19f32ea433d2254e0ceeb503f77004812048e3fcef5da363fd31'
            '272db976e1a219063d87b8ef21537fbe8959c87acbb34de4cbe5b995bc2eb46a'
            '43c5a589616a200ded1a2c81b2d4c09919dc96b7ed0df50dea97148f373db147'
            '1fbc2aecb48912ef1f4563f5eb4a1d3f5fad0767052a763cebe72d631cdf1e77'
            'e7f591f23724529b6f45182352f0a4274d4c09f0a2686d7f6588857c3d81df08'
            '313ae6611f91ce7c12366035f0271a1bd1fa787f68a652de95f2fd55a71b4e1f'
            '7de102a3e66bf6aafeb3c0cd0ae49b344e166b902d4d29fd33366883b11f1d5d'
            '5e9b7c818bd972c694075a0a01d0f44a9d6d6aaf9e3b36174702b8839f30b76b'
            'b707bf9d69cf866dd776e5c07235161186747607dc24264320784e1222272fcc'
            '04811ea7c29e15a9d5c63c6f483804ec2538e8e826c3c06019b78a98435b56b2'
            'ce7dc86c30f160e6d565c579a84e0b0f799b1afa751ebe0748a0e80f8408cb7f'
            '55959f673e409ea952661cbddfb8b046bec7cda3d8b05686bed82ace4246e273')

# disable i686 build because 32-bit Windows is generally not supported by upstream and
# it does not build anymore as of GCC 14 (probably due to commit 9a19fa8b616f83474c35cc5b34a3865073ced829)
# remarks:
# - This is in-line with MSYS2's packaging of mingw-w64 Qt 6 packages.
# - You may override MINGW_W64_QT6_ARCHS by adding the variable to `/etc/makepkg.conf` in case you
#   nevertheless want to attempt the i686 build.
_architectures=${MINGW_W64_QT6_ARCHS:-x86_64-w64-mingw32}

prepare () {
  cd $_pkgfqn

  # apply patches; further descriptions can be found in patch files itself
  for patch in "$srcdir/"*.patch; do
    msg2 "Applying patch $patch"
    patch -p1 -i "$patch"
  done
}

build() {
  for _arch in ${_architectures}; do
    export PKG_CONFIG=/usr/bin/$_arch-pkg-config

    local _enable_winrt_support=ON
    if [[ ! -e /usr/${_arch}/include/winrt/Windows.Foundation.h ]]; then
      echo "cppwinrt headers seem incomplete, disabling FEATURE_cpp_winrt"
      _enable_winrt_support=OFF
    fi

    $_arch-cmake-static -G Ninja -B build-$_arch -S $_pkgfqn \
      -DCMAKE_CXX_STANDARD=20 \
      -DCMAKE_CXX_FLAGS="$CXX_FLAGS -std=c++20" \
      -DCMAKE_INSTALL_PREFIX:PATH="/usr/$_arch/static" \
      -DFEATURE_static_runtime=ON \
      -DFEATURE_openssl_linked=ON \
      -DFEATURE_cpp_winrt=$_enable_winrt_support \
      -DFEATURE_pkg_config=ON \
      -DFEATURE_system_pcre2=ON \
      -DFEATURE_system_freetype=ON \
      -DFEATURE_system_harfbuzz=ON \
      -DFEATURE_system_sqlite=ON \
      -DINSTALL_BINDIR=lib/qt6/bin \
      -DINSTALL_DOCDIR=share/doc/qt6 \
      -DINSTALL_ARCHDATADIR=lib/qt6 \
      -DINSTALL_DATADIR=share/qt6 \
      -DINSTALL_INCLUDEDIR=include/qt6 \
      -DINSTALL_MKSPECSDIR=lib/qt6/mkspecs \
      -DINSTALL_EXAMPLESDIR=share/doc/qt6/examples \
      -DINPUT_openssl=linked
    VERBOSE=1 cmake --build build-$_arch
  done
}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" cmake --install build-$_arch

    install -Dm644 $_pkgfqn/LICENSES/* -t "$pkgdir"/usr/share/licenses/$pkgname

    # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
    find "$pkgdir/usr/$_arch/static/lib" -type f -name '*.prl' \
      -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

    find "$pkgdir/usr/$_arch" -iname '*.exe' -exec $_arch-strip --strip-all {} \;
    find "$pkgdir/usr/$_arch" -iname '*.dll' -exec $_arch-strip --strip-unneeded {} \;
    find "$pkgdir/usr/$_arch" -iname '*.a'   -exec $_arch-strip -g {} \;
    [[ -d "$pkgdir/usr/$_arch/static/share/doc" ]] && rm -r "$pkgdir/usr/$_arch/static/share/doc"
  done
}
