# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=mingw-w64-qt6-multimedia
_qtver=6.6.0
pkgver=${_qtver/-/}
pkgrel=1
arch=(any)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='Classes for audio, video, radio and camera functionality (mingw-w64)'
depends=('mingw-w64-qt6-base')
optdepends=('mingw-w64-qt6-declarative: QML bindings')
makedepends=('mingw-w64-cmake' 'mingw-w64-qt6-declarative' 'mingw-w64-qt6-shadertools' 'mingw-w64-vulkan-headers' 'mingw-w64-vulkan-icd-loader' 'qt6-declarative' 'qt6-shadertools' 'ninja')
options=('!strip' '!buildflags' 'staticlibs' '!emptydirs')
groups=(mingw-w64-qt6)
_pkgfqn="qtmultimedia-everywhere-src-${_qtver}"
source=("https://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz"
        '0001-Fix-compile-flags-of-resonance-audio-for-mingw-w64.patch')
sha256sums=('ba4b236ca3ec118841b7f5ba87797e24a8c5cbef9ba973fe219fbfc310d38782'
            '42d5613a32fcbf2c0b44a51bb24b35fa223e1dc0e537a1f53ab0a0a450a1c51f')

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
    $_arch-cmake -G Ninja -B build-$_arch -S $_pkgfqn \
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

    # Add symlinks of DLLs in usual bin directory
    mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/$_arch/bin"
    for dll in "$pkgdir"/usr/$_arch/lib/qt6/bin/*.dll; do
        ln -rs "$dll" "$pkgdir/usr/$_arch/bin/${dll##*/}"
    done

    # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
    find "$pkgdir/usr/$_arch/lib" -type f -name '*.prl' \
      -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

    find "$pkgdir/usr/$_arch" -iname '*.exe' -exec $_arch-strip --strip-all {} \;
    find "$pkgdir/usr/$_arch" -iname '*.dll' -exec $_arch-strip --strip-unneeded {} \;
    find "$pkgdir/usr/$_arch" -iname '*.a'   -exec $_arch-strip -g {} \;
    [[ -d "$pkgdir/usr/$_arch/share/doc" ]] && rm -r "$pkgdir/usr/$_arch/share/doc"
  done

  install -d "$pkgdir"/usr/share/licenses
  ln -s /usr/share/licenses/mingw-w64-qt6-base "$pkgdir"/usr/share/licenses/$pkgname

}
