# Maintainer: Martchus <martchus@gmx.net>
# Based on: AUR packages qt6-base-git and mingw-w64-qt6-base-git, official qt5-base package

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# This file is created from PKGBUILD.sh.ep contained by the mentioned repository.
# Do not edit it manually! See README.md in the repository's root directory
# for more information.

# All patches are managed at https://github.com/Martchus/qtbase

pkgname=mingw-w64-qt6-base-static
_qtver=6.6.0
pkgver=${_qtver/-/}
pkgrel=2
arch=(any)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='A cross-platform application and UI framework (mingw-w64)'
depends=('mingw-w64-crt' 'mingw-w64-zlib' 'mingw-w64-libjpeg-turbo' 'mingw-w64-sqlite'
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
        '0008-Fix-crashes-in-rasterization-code-using-setjmp.patch'
        '0009-Find-fontconfig-via-pkg-config-for-correct-handling-.patch'
        '0010-Fix-dependency-of-xcb-image-on-xcb-util.patch'
        '0011-Allow-using-properties-of-PkgConfig-targets-for-glib.patch'
        '0012-Allow-using-properties-of-PkgConfig-targets-for-Wayl.patch'
        '0013-Allow-overriding-preference-for-shared-libzstd-libra.patch')
sha256sums=('039d53312acb5897a9054bd38c9ccbdab72500b71fdccdb3f4f0844b0dd39e0e'
            '76a2d1f30653f1de8738e8a84875e3b65df2742d1b9c2970d9125a110e42147c'
            '05d8a7eb4c76f14e4671ec69698c544d2bb3d10c63f7bb6b0564cb4ad038635b'
            '5c4ffce869c20f16f4a481b780718cec097bead67451649d96638de27a9647d4'
            'c731472656cd4881e4371c37a9e16e89ee0afe53618fc48585f95c84d13cf080'
            'b7681214860c627ccc7a6628e8d2b2d5fd14c72fbd48b453a74fbe8c4122973f'
            'd1f41b62738376bbe981760d7b8eb6980bda2830a4208341e25eda40b0440121'
            '622d16f443c9e4a1ded1cf1af264a923e64c880f4a2885d2a63d9be7fbbe95f2'
            '5186fb24fd3a746f1ad06a423a9c11379f63e260dcee574391940240f6fa93bb'
            'c72b8e8bcbb9bc4dc3b9008bff109a52e29694443d9a164906ed3c5ba78c20a7'
            'e6842b36b691cfa4a595ba62ea2bc3bddf616a1aa0a308c4b7c95f7c29c2ceb2'
            '26ab4278577b58a2f038378a5f7038053d36639ab3af1071c54745c254bcc888'
            '641bce64d7a8ba16238e2ed4285c3bcf49edb82287e9528379f4b69a0159b9e6'
            '8fc74155ae001841f01e372813dc1b42de791e38310590331089e73d9427a584')

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

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
    $_arch-cmake-static -G Ninja -B build-$_arch -S $_pkgfqn \
      -DCMAKE_INSTALL_PREFIX:PATH="/usr/$_arch/static" \
      -DFEATURE_static_runtime=ON \
      -DFEATURE_openssl_linked=ON \
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
