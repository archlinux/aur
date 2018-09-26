# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# set the web view provider: either webkit, webengine, auto or none
_webview_provider=none

_reponame=syncthingtray
pkgname=mingw-w64-syncthingtray
_name=${pkgname#mingw-w64-}
pkgver=0.8.2
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
sha256sums=('34ebc32c78bfc2c6ebba390e78dafc32e6eddbac7e613ab3b4573f79cb1c01b2')
options=(!buildflags staticlibs !strip !emptydirs)
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

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
      -DENABLE_STATIC_LIBS:BOOL=OFF \
      -DDISABLE_SHARED_LIBS:BOOL=OFF \
      -DSTATIC_LINKAGE:BOOL=OFF \
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
