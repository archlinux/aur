# Maintainer: Martchus <martchus@gmx.net>
# Based on: AUR packages qt6-base-git and mingw-w64-qt6-base-git, official qt5-base package

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# This file is created from PKGBUILD.sh.ep contained by the mentioned repository.
# Do not edit it manually! See README.md in the repository's root directory
# for more information.

# All patches are managed at https://github.com/Martchus/qtbase

pkgname=mingw-w64-qt6-base
_qtver=6.0.0-beta1
pkgver=${_qtver/-/}
pkgrel=1
arch=(any)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='A cross-platform application and UI framework (mingw-w64)'
depends=('mingw-w64-crt' 'mingw-w64-zlib' 'mingw-w64-libjpeg-turbo' 'mingw-w64-sqlite'
         'mingw-w64-libpng' 'mingw-w64-openssl' 'mingw-w64-dbus' 'mingw-w64-harfbuzz'
         'mingw-w64-brotli' 'mingw-w64-pcre2' 'mingw-w64-zstd')
makedepends=('mingw-w64-cmake' 'mingw-w64-postgresql' 'mingw-w64-mariadb-connector-c'
             'mingw-w64-vulkan-headers' 'mingw-w64-vulkan-icd-loader' 'mingw-w64-pkg-config'
             'qt6-base' 'ninja')
optdepends=('mingw-w64-postgresql: PostgreSQL driver'
            'mingw-w64-mariadb-connector-c: MariaDB driver'
            'qt6-base: development tools')
options=('!strip' '!buildflags' 'staticlibs' '!emptydirs')
groups=(mingw-w64-qt6)
_pkgfqn="qtbase-everywhere-src-${_qtver}"
source=("https://download.qt.io/development_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz"
        '0001-Use-CMake-s-default-import-library-suffix.patch'
        '0002-Rename-qtmain-to-qt6main-to-make-Qt-6-co-installable.patch'
        '0003-Fix-finding-D-Bus.patch')
sha256sums=('d23210ba903be38aa43fe7887b8df62a1a310ea053712a30670cc479cf0219a0'
            '43a19aaaf39d9e5fbce15657f216b5bd343b4be3eeffcb888dcb0d00a011d744'
            '74871688a19acd6e254852485c07a1bceb0ce8ae67274d44227528c25e913b37'
            '969c980eb3d8e9dc06063def818172e443e87b0511e5a6c95a84a1b5f4a5f841')

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
    $_arch-cmake -G Ninja -B build-$_arch -S $_pkgfqn \
      -DQT_HOST_PATH=/usr \
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
      -DINPUT_openssl=runtime \
      -DVulkan_LIBRARY="/usr/$_arch/lib/libvulkan.dll.a" \
      -DVulkan_INCLUDE_DIR="/usr/$_arch/include" \
      -DMySQL_LIBRARIES="/usr/$_arch/lib/libmariadb.dll.a" \
      -DMySQL_INCLUDE_DIRS="/usr/$_arch/include/mariadb"
    VERBOSE=1 cmake --build build-$_arch
  done
}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" cmake --install build-$_arch

    install -Dm644 $_pkgfqn/LICENSE* -t "$pkgdir"/usr/$_arch/share/licenses/$pkgname

    # Add symlinks of DLLs in usual bin directory
    mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/$_arch/bin"
    for dll in "$pkgdir"/usr/$_arch/lib/qt6/bin/*.dll; do
        ln -rs "$dll" "$pkgdir/usr/$_arch/bin/${dll##*/}"
    done

    # Symlinks for backwards compatibility
    for qmake; do
        ln -rs "$pkgdir"/usr/$_arch/lib/qt6/bin/$_b "$pkgdir"/usr/bin/$_arch-$_b-qt6
    done

    # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
    find "$pkgdir/usr/$_arch/lib" -type f -name '*.prl' \
      -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

    find "$pkgdir/usr/$_arch" -iname '*.exe' -exec $_arch-strip --strip-all {} \;
    find "$pkgdir/usr/$_arch" -iname '*.dll' -exec $_arch-strip --strip-unneeded {} \;
    find "$pkgdir/usr/$_arch" -iname '*.a'   -exec $_arch-strip -g {} \;
  done
}
