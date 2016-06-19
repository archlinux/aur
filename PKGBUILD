# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# set the web view provider: either webkit, webengine or none
_webview_provider=none

# set the JavaScript provider: either script, qml or none
_js_provider=script

_name=tageditor
_reponame=tageditor
pkgname=mingw-w64-tageditor
pkgver=1.4.0
pkgrel=1
arch=('any')
pkgdesc="A tag editor with Qt GUI and command-line interface supporting MP4/M4A/AAC (iTunes), ID3, Vorbis, Opus and Matroska (mingw-w64)."
license=('GPL')
depends=(mingw-w64-{crt,qtutilities,tagparser})
[[ $_webview_provider == none ]] && [[ $_js_provider == none ]] && depends+=('mingw-w64-qt5-base')
[[ $_webview_provider == webkit ]] && depends+=('mingw-w64-qt5-webkit')
[[ $_webview_provider == webengine ]] && depends+=('mingw-w64-qt5-webengine')
[[ $_js_provider == script ]] && depends+=('mingw-w64-qt5-script')
[[ $_js_provider == qml ]] && depends+=('mingw-w64-qt5-declarative')
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake' 'mingw-w64-qt5-tools' 'ffmpeg')
url="https://github.com/Martchus/${_reponame}"
source=("tageditor-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('37281b85c633b2f91310c0747f6ae69a108961ee5de1fa5ad3ba27a1707359aa')
options=(!buildflags staticlibs !strip !emptydirs)
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  # build utilities for each architecture
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX="/usr/${_arch}" \
      -DWEBVIEW_PROVIDER="${_webview_provider}" \
      -DJS_PROVIDER="${_js_provider}" \
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
