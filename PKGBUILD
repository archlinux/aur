# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_qt_module=qtdeclarative
pkgname='apple-darwin-qt5-declarative'
pkgver=5.9.1
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="Classes for QML and JavaScript languages (apple-darwin)"
depends=('apple-darwin-qt5-base')
makedepends=('clang' 'python')
options=('!strip' '!buildflags' 'staticlibs')
groups=('apple-darwin-qt5')
license=('GPL3' 'LGPL3' 'FDL' 'custom')
url='https://www.qt.io/'
_pkgfqn="${_qt_module}-opensource-src-${pkgver}"
source=("https://download.qt.io/official_releases/qt/${pkgver:0:3}/${pkgver}/submodules/${_pkgfqn}.tar.xz")
sha256sums=('d2fe6c9c1a9f19af6e96553c6d75366ab8f397bc232acd67d31476955fee94ff'
            'd93731901616f494b5474cf78ec938c4c7e9e79a088457275b97f1f65cc82fe3')
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
      ${_osxcrossprefix}/bin/${_arch}-qmake-qt5 ../${_qt_module}.pro ${_config}

      # Search paths for host standard library (/usr/lib) and for Qt5Bootstrap (/usr/$_arch/lib) are not set correctly by qmake
      # hence we need insert those paths manually
      make qmake_all
      find ./src/qmldevtools -type f -iname 'Makefile' -exec sed -i "s|-L$_osxcrossprefix/$_arch/lib -lQt5Bootstrap|-L/usr/lib $_osxcrossprefix/$_arch/lib/libQt5Bootstrap.a|g" {} \;
      find . -type f -iname 'Makefile' -exec sed -i "s|-L$PWD/lib -L$_osxcrossprefix/$_arch/lib -lQt5Bootstrap|-L/usr/lib -L$PWD/lib $_osxcrossprefix/$_arch/lib/libQt5Bootstrap.a|g" {} \;
      find . -type f -iname 'Makefile' -exec sed -i "s|-L$_osxcrossprefix/$_arch/lib -lQt5Bootstrap|-L/usr/lib $_osxcrossprefix/$_arch/lib/libQt5Bootstrap.a|g" {} \;
      [ ${_config##*=} == 'shared' ] && local _ext='so' || local _ext='a'
      find . -type f -iname 'Makefile' -exec sed -i "s|-L$PWD/lib -lQt5QmlDevTools|-L/usr/lib -L$PWD/lib ${srcdir}/${_pkgfqn}/build-${_arch}-${_config##*=}/lib/libQt5QmlDevTools.${_ext}|g" {} \;
      find . -type f -iname 'Makefile' -exec sed -i "s|-lQt5QmlDevTools|-L/usr/lib ${srcdir}/${_pkgfqn}/build-${_arch}-${_config##*=}/lib/libQt5QmlDevTools.${_ext}|g" {} \;
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

      # QmlDebuggerServiceFactory plugin is not available so remove CMake plugin file for it
      rm "${pkgdir}/${_osxcrossprefix}/${_arch}/lib/cmake/Qt5Qml/Qt5Qml_QQmlDebuggerServiceFactory.cmake"

      # Strip the binaries, remove debug libraries
      find "${pkgdir}/${_osxcrossprefix}" -name "*.dylib" -a -not -iname '*_debug*' -exec ${_osxcrossprefix}/bin/${_arch}-strip -S -x {} \;
      find "${pkgdir}/${_osxcrossprefix}" -name '*.a' -a -not -iname '*_debug.a' -a -not -iname '*DevTools.a' -a -not -iname '*Bootstrap.a' -exec ${_osxcrossprefix}/bin/${_arch}-strip -S -x {} \;
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
