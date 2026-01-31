# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=mingw-w64-qt6-tools-static
_qtver=6.10.2
pkgver=${_qtver/-/}
pkgrel=1
arch=(any)
url='https://www.qt.io'
license=(GPL-3.0-only
         LGPL-3.0-only
         LicenseRef-Qt-Commercial
         Qt-GPL-exception-1.0)
pkgdesc='A cross-platform application and UI framework (tools, mingw-w64)'
depends=('mingw-w64-qt6-base-static')
makedepends=('mingw-w64-cmake-static' 'mingw-w64-vulkan-headers' 'mingw-w64-vulkan-icd-loader' 'mingw-w64-qt6-declarative-static' 'qt6-declarative' 'qt6-tools' 'ninja')
options=('!strip' '!buildflags' 'staticlibs' '!emptydirs')
groups=(mingw-w64-qt6)
_pkgfqn="qttools-everywhere-src-${_qtver}"
source=("https://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz"
        '0001-Enable-only-SQL-plugins-which-are-known-to-work.patch')
sha256sums=('1e3d2c07c1fd76d2425c6eaeeaa62ffaff5f79210c4e1a5bc2a6a9db668d5b24'
            '0760b47c4b77b3e9eccf8873c7c7ea1c1c43cadcb71fe5e03285651a605f8e9b')

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

    # workaround https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120495
    [[ $pkgname =~ .*-clang-.* ]] || export CXXFLAGS+=' -Wno-template-body -fcoroutines'

    $_arch-cmake-static -G Ninja -B build-$_arch -S $_pkgfqn \
      -DCMAKE_INSTALL_PREFIX:PATH="/usr/$_arch/static" \
      -DCMAKE_DISABLE_FIND_PACKAGE_harfbuzz=TRUE \
      -DUSE_LINK_GROUP=OFF \
      -DFEATURE_static_runtime=ON \
      -DQT_NO_PACKAGE_VERSION_CHECK:BOOL=TRUE \
      -DFEATURE_pkg_config=ON \
      -DFEATURE_windeployqt=OFF
    cmake --build build-$_arch
  done
}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" cmake --install build-$_arch

    find "$pkgdir/usr/$_arch" -iname '*.exe' -exec $_arch-strip --strip-all {} \;
    find "$pkgdir/usr/$_arch" -iname '*.dll' -exec $_arch-strip --strip-unneeded {} \;
    find "$pkgdir/usr/$_arch" -iname '*.a'   -exec $_arch-strip -g {} \;
    [[ -d "$pkgdir/usr/$_arch/static/share/doc" ]] && rm -r "$pkgdir/usr/$_arch/static/share/doc"
  done

  install -d "$pkgdir"/usr/share/licenses
  ln -s /usr/share/licenses/mingw-w64-qt6-base-static "$pkgdir"/usr/share/licenses/$pkgname

}

