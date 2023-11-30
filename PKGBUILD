# Maintainer: Martchus <martchus@gmx.net>
# Based on: AUR packages qt6-base-git and mingw-w64-qt6-base-git, official qt5-base package

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# This file is created from PKGBUILD.sh.ep contained by the mentioned repository.
# Do not edit it manually! See README.md in the repository's root directory
# for more information.

# All patches are managed at https://github.com/Martchus/qtbase

pkgname=mingw-w64-qt6-base-static
_qtver=6.6.1
pkgver=${_qtver/-/}
pkgrel=1
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
sha256sums=('450c5b4677b2fe40ed07954d7f0f40690068e80a94c9df86c2c905ccd59d02f7'
            'ccb6fbc145d6d8a14d49381a2bffb14befbd32e565675d10054be6b191056c51'
            'f6dc1f60ac38f199bac51fd23d76c079ccb9303b2eaf469c8d71113b1b28c8c7'
            '091c4ad85e5454371598ff12dddf746bccbfe3579d9b74be85236224a675d0ef'
            '324d4162d09e86cc174a877af3ec50419c239785ab53e4996e96f765f9451ce6'
            'aa16e0ce44cc2d6604f7f9a97e147b1f954a43ea42de8be6e8b6b43eed59c6eb'
            '98d713d84bad4479c9ec85bc4e7ff3e8344a968bf8b5aeff540aba28df0238c5'
            '1b7c2677ab5915c3972157c323095453759c6e97cc84805c9ac6d6e0ce157eb9'
            '96635148fbc09be5bc50d2f6de2a88675e0aef91bea058108e8d92fa6577b605'
            '803e6d7e4df781d3245b6ea1d3aa5d948d82f7db627e7e135ce7ff97fb58b4d0'
            '3e20bf38e4d1c0e640312af4f2e00837199d21a48d4dc7990e942d5575eca59b'
            'ef21feaa5614661d6a1c131ab4717fda3c5ede394776e07bbdcf9832390f654f'
            'd3b8a352ef8b9859c001252f632ad0eca6d0577676a8dfdc95e3a3691a9de00b'
            '037d691ae936b56a38a9f9873b4b3978656fe35baa05e9eb12830f08653f1945')

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
