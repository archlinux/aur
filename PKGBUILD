# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_qt_module=qtimageformats
pkgname='apple-darwin-qt5-imageformats'
pkgver=5.9.1
pkgrel=1
arch=('any')
pkgdesc="Plugins for additional image formats: TIFF, MNG, TGA, WBMP (apple-darwin)"
depends=('apple-darwin-qt5-base')
# these dependencies will enable further functionality
#depends+=('apple-darwin-jasper') # for JPEG-2000 Part-1
#depends+=('apple-darwin-libmng') # for MNG
#depends+=('apple-darwin-libwebp') # for WebP
makedepends=('clang')
options=('!strip' '!buildflags' 'staticlibs')
groups=('apple-darwin-qt5')
license=('GPL3' 'LGPL' 'FDL' 'custom')
url='https://www.qt.io/'
_pkgfqn="${_qt_module}-opensource-src-${pkgver}"
source=("https://download.qt.io/official_releases/qt/${pkgver:0:3}/${pkgver}/submodules/${_pkgfqn}.tar.xz")
sha256sums=('79fee307310a66100bd3d907ea69bd039dcd727c15f27e990167e7a27d1b8a47')
_architectures='x86_64-apple-darwin15'
_configurations+=('CONFIG+=static')
_osxcrossprefix='/opt/osxcross'

init_osxcross() {
  # add osxcross toolchain to path
  export PATH="${_osxcrossprefix}/bin:$PATH"
  # enable use of ccache (if installed)
  [[ -f /usr/bin/ccache ]] && \
    export PATH="${_osxcrossprefix}/lib/ccache/bin:$PATH"
}

build() {
  cd "${srcdir}/${_pkgfqn}"

  init_osxcross
  for _arch in ${_architectures}; do
    for _config in "${_configurations[@]}"; do
      msg2 "Building ${_config##*=} version for ${_arch}"
      mkdir -p build-${_arch}-${_config##*=} && pushd build-${_arch}-${_config##*=}
      ${_osxcrossprefix}/bin/${_arch}-qmake-qt5 ../${_qt_module}.pro ${_config} ${_debug_config}
      make
      popd
    done
  done
}

package() {
  cd "${srcdir}/${_pkgfqn}"

  init_osxcross
  for _arch in ${_architectures}; do
    for _config in "${_configurations[@]}"; do
      pushd build-${_arch}-${_config##*=}
      make INSTALL_ROOT="$pkgdir" install

      # Strip the binaries, remove debug libraries
      find "${pkgdir}/${_osxcrossprefix}" -name "*.dylib" -a -not -iname '*_debug*' -exec ${_osxcrossprefix}/bin/${_arch}-strip -S -x {} \;
      find "${pkgdir}/${_osxcrossprefix}" -name '*.a' -a -not -iname '*_debug.a' -a -not -iname '*Bootstrap.a' -exec ${_osxcrossprefix}/bin/${_arch}-strip -S -x {} \;
      [[ $APPLE_DARWIN_QT_DEBUG_BUILD ]] || \
        find "${pkgdir}/${_osxcrossprefix}" -iname '*_debug*' -exec rm {} \;
      [[ -d "${pkgdir}/${_osxcrossprefix}/${_arch}/lib/qt/bin/" ]] && \
        find "${pkgdir}/${_osxcrossprefix}/${_arch}/lib/qt/bin/" -exec strip --strip-all {} \;
      find "${pkgdir}/${_osxcrossprefix}/${_arch}/lib/" -iname "*DevTools.a" -exec strip -g {} \;
      popd
    done
  done

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/${_osxcrossprefix}" -type f -name '*.prl' -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;
}
