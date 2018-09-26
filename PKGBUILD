# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# set the web view provider: either webkit, webengine, auto or none
_webview_provider=none

# set the JavaScript provider: either script, qml, auto or none
_js_provider=script

# whether the experimental JSON export is enabled: ON or OFF
_json_export=ON

_reponame=tageditor
pkgname=mingw-w64-tageditor
_name=${pkgname#mingw-w64-}
pkgver=3.1.2
pkgrel=1
arch=('any')
pkgdesc='A tag editor with Qt GUI and command-line interface supporting MP4/M4A/AAC (iTunes), ID3, Vorbis, Opus, FLAC and Matroska'
license=('GPL')
depends=('mingw-w64-crt' 'mingw-w64-qtutilities>=5.6.0' 'mingw-w64-tagparser>=6.2.0')
[[ $_webview_provider == none ]] && [[ $_js_provider == none ]] && depends+=('mingw-w64-qt5-base>=5.6')
[[ $_webview_provider == webkit ]] && depends+=('mingw-w64-qt5-webkit')
[[ $_webview_provider == webengine ]] && depends+=('mingw-w64-qt5-webengine>=5.6')
[[ $_js_provider == script ]] && depends+=('mingw-w64-qt5-script>=5.6')
[[ $_js_provider == qml ]] && depends+=('mingw-w64-qt5-declarative>=5.6')
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake' 'mingw-w64-qt5-tools' 'ffmpeg')
[[ $_json_export == ON ]] && makedepends+=('mingw-w64-reflective-rapidjson')
url="https://github.com/Martchus/${_reponame}"
source=("${_name}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('0bb4092196051d44cd65a34b42186041ca82384ea1b159304ef81851be918e6a')
options=(!buildflags staticlibs !strip !emptydirs)
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  for _arch in ${_architectures}; do
    local gcc_version=$($_arch-gcc --version | grep "^$_arch-gcc" | sed 's/^.* //g')
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX="/usr/${_arch}" \
      -DWEBVIEW_PROVIDER="${_webview_provider}" \
      -DJS_PROVIDER="${_js_provider}" \
      -DENABLE_JSON_EXPORT:BOOL="${_json_export}" \
      -DREFLECTION_GENERATOR_EXECUTABLE:FILEPATH='/usr/bin/reflective_rapidjson_generator' \
      -DREFLECTION_GENERATOR_TRIPLE:STRING="${_arch}" \
      -DREFLECTION_GENERATOR_INCLUDE_DIRECTORIES="/usr/lib/gcc/${_arch}/${gcc_version}/include;/usr/${_arch}/include/c++/${gcc_version};/usr/${_arch}/include/c++/${gcc_version}/${_arch};/usr/${_arch}/include" \
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
