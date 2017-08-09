# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_qt_module=qttranslations
pkgname='apple-darwin-qt5-translations'
pkgver=5.9.1
pkgrel=1
arch=('any')
pkgdesc="A cross-platform application and UI framework (translations, apple-darwin)"
depends=('apple-darwin-qt5-base')
makedepends=('clang' 'apple-darwin-qt5-tools')
options=('!strip' '!buildflags' 'staticlibs')
groups=('apple-darwin-qt5')
license=('GPL3' 'LGPL3' 'FDL' 'custom')
url='https://www.qt.io/'
_pkgfqn="${_qt_module}-opensource-src-${pkgver}"
source=("https://download.qt.io/official_releases/qt/${pkgver:0:3}/${pkgver}/submodules/${_pkgfqn}.tar.xz")
sha256sums=('4a12528a14ed77f31672bd7469cad30624e7b672f241b8f19ad59510298eb269')
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
      popd
    done
  done
}
