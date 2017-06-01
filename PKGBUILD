# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# set the web view provider: either webkit, webengine, auto or none
_webview_provider=none

_reponame=syncthingtray
pkgname=mingw-w64-syncthingtray
_name=${pkgname#mingw-w64-}
pkgver=0.6.0
pkgrel=1
arch=('any')
pkgdesc='Tray application for Syncthing (mingw-w64)'
license=('GPL')
depends=('mingw-w64-crt' 'mingw-w64-qt5-svg' 'mingw-w64-qtutilities' 'mingw-w64-openssl')
[[ $_webview_provider == none ]] && depends+=('mingw-w64-qt5-base')
[[ $_webview_provider == webkit ]] && depends+=('mingw-w64-qt5-webkit')
[[ $_webview_provider == webengine ]] && depends+=('mingw-w64-qt5-webengine')
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake' 'mingw-w64-qt5-tools' 'ffmpeg')
url="https://github.com/Martchus/${_reponame}"
source=("${_name}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('97940ce14b9480583da1d0a71c5797458a2d29f203d54ecd1ccd2b30065dbdf4')
options=(!buildflags staticlibs !strip !emptydirs)
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
[[ $NO_STATIC_LIBS ]] ||
  makedepends+=('mingw-w64-qt5-base-static') \
  optdepends+=('mingw-w64-qt5-base-static: use of static library')
  _configurations='-DENABLE_STATIC_LIBS:BOOL=ON'
[[ $NO_SHARED_LIBS ]] && _configurations+=' -DDISABLE_SHARED_LIBS:BOOL=ON'

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX="/usr/${_arch}" \
      -DWEBVIEW_PROVIDER="${_webview_provider}" \
      -DSYSTEMD_SUPPORT=OFF \
      -DNO_FILE_ITEM_ACTION_PLUGIN=ON \
      ${_configurations} \
      ../
    make
    popd
  done
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  for _arch in ${_architectures}; do
    pushd build-${_arch}
    make DESTDIR="${pkgdir}" install-mingw-w64-strip
    popd
  done
}
