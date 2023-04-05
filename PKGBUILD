# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=mingw-w64-qt6-activeqt
_qtver=6.5.0
pkgver=${_qtver/-/}
pkgrel=1
arch=(any)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='ActiveX integration framework (mingw-w64)'
depends=('mingw-w64-qt6-base')
optdepends=('mingw-w64-qt6-declarative: QML bindings')
makedepends=('mingw-w64-cmake' 'mingw-w64-qt6-declarative' 'mingw-w64-vulkan-headers' 'mingw-w64-vulkan-icd-loader' 'qt6-declarative' 'ninja')
options=('!strip' '!buildflags' 'staticlibs' '!emptydirs')
groups=(mingw-w64-qt6)
_pkgfqn="qtactiveqt-everywhere-src-${_qtver}"
source=("https://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz"
        '0001-Handle-win64-in-dumpcpp-and-MetaObjectGenerator-read.patch'
        '0002-Build-tools-for-the-target-platform.patch'
        '0003-Fix-compile-error-about-missing-QStringView-overload.patch')
sha256sums=('25b0aacbd9aaac3822ee44ac201a159d3e63c77bfbce57599c0368f294f89c3b'
            '869a86ceb1801432bada4f12420703140563393661d9d4283982019d5831cd14'
            '78e8f82cf03e5ce55498f553a98e65b8e990c38038b58bf98afcceb65add27ed'
            'c83752006cae2dd3573c88aa674daef6cb62d2e7e1146a8c8ea32cbca9a20362')

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
    [[ -d "$pkgdir/usr/$_arch/share/doc" ]] && rm -r "$pkgdir/usr/$_arch/share/doc"
  done

  install -d "$pkgdir"/usr/share/licenses
  ln -s /usr/share/licenses/mingw-w64-qt6-base "$pkgdir"/usr/share/licenses/$pkgname

}
