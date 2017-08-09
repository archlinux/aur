# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_qt_module=qttools
pkgname="apple-darwin-qt5-tools"
pkgver=5.9.1
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="A cross-platform application and UI framework (Development Tools, QtHelp; apple-darwin)"
depends=('apple-darwin-qt5-declarative')
makedepends=('clang')
options=('!strip' '!buildflags' 'staticlibs')
groups=('apple-darwin-qt5')
license=('GPL3' 'LGPL3' 'FDL' 'custom')
url='https://www.qt.io/'
_pkgfqn="${_qt_module}-opensource-src-${pkgver}"
source=("https://download.qt.io/official_releases/qt/${pkgver:0:3}/${pkgver}/submodules/${_pkgfqn}.tar.xz"
        '0001-Fix-linguist-macro.patch')
sha256sums=('c4eb56cf24a75661b8317b566be37396c90357b4f6730ef12b8c97a7079ca0e8'
            'de1f0114b723d07f1c7a2c11c15e8c5b05852c690e3a36d3f65f3a411fd81127')
_architectures='x86_64-apple-darwin15'
_configurations+=('CONFIG+=static')
_osxcrossprefix='/opt/osxcross'

prepare() {
  cd "${srcdir}/${_pkgfqn}"

  # Apply patches; further descriptions can be found in patch files itself
  for patch in "$srcdir/"*.patch; do
    patch -p1 -i "$patch"
  done
}

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
      ${_osxcrossprefix}/bin/${_arch}-qmake-qt5 ../${_qt_module}.pro ${_config}

      # Search paths for host standard library (/usr/lib) and for Qt5Bootstrap (/usr/$_arch/lib) are not set correctly by qmake
      # hence we need insert those paths manually
      make qmake_all
      find . -type f -iname 'Makefile' -exec sed -i "s|-L$_osxcrossprefix/$_arch/lib -lQt5QmlDevTools -lQt5Bootstrap|-L/usr/lib $_osxcrossprefix/$_arch/lib/libQt5QmlDevTools.a $_osxcrossprefix/$_arch/lib/libQt5Bootstrap.a|g" {} \;
      find . -type f -iname 'Makefile' -exec sed -i "s|-L$_osxcrossprefix/$_arch/lib -lQt5QmlDevTools|-L/usr/lib $_osxcrossprefix/$_arch/lib/libQt5QmlDevTools.a|g" {} \;
      find . -type f -iname 'Makefile' -exec sed -i "s|-L$_osxcrossprefix/$_arch/lib -lQt5Bootstrap|-L/usr/lib $_osxcrossprefix/$_arch/lib/libQt5Bootstrap.a|g" {} \;
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
      find "${pkgdir}/${_osxcrossprefix}" -name '*.a' -a -not -iname '*_debug.a' -a -not -iname '*DevTools.a' -a -not -iname '*Bootstrap.a' -exec ${_osxcrossprefix}/bin/${_arch}-strip -S -x {} \;
      [[ $APPLE_DARWIN_QT_DEBUG_BUILD ]] || \
        find "${pkgdir}/${_osxcrossprefix}" -iname '*_debug*' -exec rm {} \;
      [[ -d "${pkgdir}/${_osxcrossprefix}/${_arch}/lib/qt/bin/" ]] && \
        find "${pkgdir}/${_osxcrossprefix}/${_arch}/lib/qt/bin/" -exec strip --strip-all {} \;
      find "${pkgdir}/${_osxcrossprefix}/${_arch}/lib/" -iname "*DevTools.a" -exec strip -g {} \;

      # Create symlinks for tools
      mkdir -p "${pkgdir}/${_osxcrossprefix}/bin"
      for tool in lconvert lupdate lrelease; do
        ln -s "../${_arch}/lib/qt/bin/${tool}" "${pkgdir}/${_osxcrossprefix}/bin/${_arch}-${tool}-qt5"
      done
      popd
    done
  done

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/${_osxcrossprefix}" -type f -name '*.prl' -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;
}
