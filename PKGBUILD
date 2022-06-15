# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=mingw-w64-qt6-charts-static
_qtver=6.3.1
pkgver=${_qtver/-/}
pkgrel=1
arch=(any)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='Provides a set of easy to use chart components (mingw-w64)'
depends=('mingw-w64-qt6-declarative-static')
makedepends=('mingw-w64-cmake-static' 'mingw-w64-vulkan-headers' 'mingw-w64-vulkan-icd-loader' 'qt6-declarative' 'ninja')
options=('!strip' '!buildflags' 'staticlibs' '!emptydirs')
groups=(mingw-w64-qt6)
_pkgfqn="qtcharts-everywhere-src-${_qtver}"
source=("https://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz")
sha256sums=('f330cc2328729104d79b2088990ce0840f2da89d9d989360d4c352e797d27cf7')

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

build() {
  for _arch in ${_architectures}; do
    export PKG_CONFIG=/usr/bin/$_arch-pkg-config
    $_arch-cmake-static -G Ninja -B build-$_arch -S $_pkgfqn \
      -DCMAKE_INSTALL_PREFIX:PATH="/usr/$_arch/static" \
      -DFEATURE_static_runtime=ON \
      -DFEATURE_pkg_config=ON
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

