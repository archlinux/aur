# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=mingw-w64-qt6-multimedia-static
_qtver=6.6.1
pkgver=${_qtver/-/}
pkgrel=1
arch=(any)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='Classes for audio, video, radio and camera functionality (mingw-w64)'
depends=('mingw-w64-qt6-base-static')
optdepends=('mingw-w64-qt6-declarative-static: QML bindings')
makedepends=('mingw-w64-cmake-static' 'mingw-w64-qt6-declarative-static' 'mingw-w64-qt6-shadertools-static' 'mingw-w64-vulkan-headers' 'mingw-w64-vulkan-icd-loader' 'qt6-declarative' 'qt6-shadertools' 'ninja')
options=('!strip' '!buildflags' 'staticlibs' '!emptydirs')
groups=(mingw-w64-qt6)
_pkgfqn="qtmultimedia-everywhere-src-${_qtver}"
source=("https://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz"
        '0001-Fix-compile-flags-of-resonance-audio-for-mingw-w64.patch')
sha256sums=('7ee4e2296f5714961692f6ded568d3e3fde3687cee48e9d717194b5d1360db4a'
            'ceaa0f8f2223a7801081c3751b6a997442496930e45a0d50c591e04cbece92b2')

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

prepare () {
  cd $_pkgfqn

  # apply patches; further descriptions can be found in patch files itself
  for patch in "$srcdir/"*.patch; do
    msg2 "Applying patch $patch"
    patch -p1 -i "$patch"
  done
  # work around case-insensitive includes on case-sensitive filesystems
  sed -i'' 's/\(.*\) \(Mf.*\|Propsys\) HINTS \(.*\)/\1 \L\2 HINTS \3/g' cmake/FindWMF.cmake
  find src -type f -exec sed -i'' 's/#include <\(Dbt.*\|InitGuid.*\|Mf.*\|Wmcodec.*\|Functiondiscoverykeys_devpkey.*\)>/#include <\L\1>/g' {} \;
  find src -type f -exec sed -i'' 's/#include "\(Dbt.*\|InitGuid.*\|Mf.*\|Wmcodec.*\|QUrl.*\)"/#include "\L\1"/g' {} \;
}

build() {
  for _arch in ${_architectures}; do
    export PKG_CONFIG=/usr/bin/$_arch-pkg-config
    $_arch-cmake-static -G Ninja -B build-$_arch -S $_pkgfqn \
      -DCMAKE_INSTALL_PREFIX:PATH="/usr/$_arch/static" \
      -DCMAKE_DISABLE_FIND_PACKAGE_harfbuzz=TRUE \
      -DFEATURE_static_runtime=ON \
      -DFEATURE_pkg_config=ON \
      -DFEATURE_wmsdk=ON \
      -DFEATURE_ffmpeg=OFF \
      -DFEATURE_gstreamer=OFF
    # note: Enable Windows Media SDK as it is not optional (disabling it would lead to build errors).
    #       Unfortunately it doesn't build as well (maybe it would using a newer mingw-w64 version).
    #       Disabling ffmpeg and gstreamer at this point explicitly due to lack of testing.
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

