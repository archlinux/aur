# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=mingw-w64-qt6-activeqt-static
_qtver=6.1.3
pkgver=${_qtver/-/}
pkgrel=1
arch=(any)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='ActiveX integration framework (mingw-w64)'
depends=('mingw-w64-qt6-base-static')
optdepends=('mingw-w64-qt6-declarative-static: QML bindings')
makedepends=('mingw-w64-cmake-static' 'mingw-w64-qt6-declarative-static' 'mingw-w64-vulkan-headers' 'mingw-w64-vulkan-icd-loader' 'qt6-declarative' 'ninja')
options=('!strip' '!buildflags' 'staticlibs' '!emptydirs')
groups=(mingw-w64-qt6)
_pkgfqn="qtactiveqt-everywhere-src-${_qtver}"
source=("https://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz"
        '0001-Handle-win64-in-dumpcpp-and-MetaObjectGenerator-read.patch'
        '0002-Build-tools-for-the-target-platform.patch')
sha256sums=('bb35cab37e12fd053d84a204998795bdce02a2e353fbc5da452638dd1e13ddf4'
            '61baa4f0e3e713af36df7b73a78ade58bd1e2b64864be68c0a8ec231f6cec58b'
            '7f5309d5b3fe4a0590a42582500dd6585c3f43b664f6aea1b3e71ab5d3080328')

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

