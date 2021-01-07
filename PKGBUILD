# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# set the web view provider: either webkit, webengine, auto or none
_webview_provider=${MINGW_64_TAGEDITOR_WEBVIEW_PROVIDER:-none}

# set the JavaScript provider: either script, qml, auto or none
_js_provider=${MINGW_64_TAGEDITOR_JS_PROVIDER:-qml}

# whether the experimental JSON export is enabled: ON or OFF
_json_export=${MINGW_64_TAGEDITOR_JSON_EXPORT:-ON}

_reponame=tageditor
pkgname=mingw-w64-tageditor
_name=${pkgname#mingw-w64-}
pkgver=3.3.10
pkgrel=1
arch=('any')
pkgdesc='A tag editor with Qt GUI and command-line interface supporting MP4/M4A/AAC (iTunes), ID3, Vorbis, Opus, FLAC and Matroska'
license=('GPL')
depends=('mingw-w64-crt' 'mingw-w64-qtutilities' 'mingw-w64-tagparser')
[[ $_webview_provider == none ]] && [[ $_js_provider == none ]] && depends+=('mingw-w64-qt5-base')
[[ $_webview_provider == webkit ]] && depends+=('mingw-w64-qt5-webkit')
[[ $_webview_provider == webengine ]] && depends+=('mingw-w64-qt5-webengine')
[[ $_js_provider == script ]] && depends+=('mingw-w64-qt5-script')
[[ $_js_provider == qml ]] && depends+=('mingw-w64-qt5-declarative')
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake' 'mingw-w64-qt5-tools' 'ffmpeg' 'ninja')
[[ $_json_export == ON ]] && makedepends+=('mingw-w64-reflective-rapidjson')
url="https://github.com/Martchus/${_reponame}"
source=("${_name}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('0d720dcfce039c5dc85c0dcc0ce3daa0bd15835394c977da28b20a63e09f0d71')
options=(!buildflags staticlibs !strip !emptydirs)

_architectures=('i686-w64-mingw32' 'x86_64-w64-mingw32')
_configurations=()
if ! [[ $NO_SHARED_LIBS ]]; then
    _configurations+=('shared')
fi
if ! [[ $NO_STATIC_LIBS ]]; then
    _configurations+=('static')
    makedepends+=('mingw-w64-qt5-base-static' 'mingw-w64-qt5-svg-static' 'mingw-w64-qt5-translations' 'breeze-icons' 'numix-icon-theme-git')
    [[ $_js_provider == script ]] && makedepends+=('mingw-w64-qt5-script-static')
    [[ $_js_provider == qml ]] && makedepends+=('mingw-w64-qt5-declarative-static')
fi

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"

  declare -A _config_flags=(
    [shared]="
        -DBUILD_SHARED_LIBS:BOOL=ON
        -DWEBVIEW_PROVIDER:STRING=${_webview_provider}
    "
    [static]='
        -DBUILD_SHARED_LIBS:BOOL=OFF
        -DCMAKE_FIND_LIBRARY_SUFFIXES:STRING=.a;.lib
        -DSTATIC_LINKAGE:BOOL=ON
        -DSTATIC_LIBRARY_LINKAGE:BOOL=ON
        -DQT_PACKAGE_PREFIX=StaticQt5
        -DKF_PACKAGE_PREFIX=StaticKF5
        -DTAGEDITOR_CONFIGURATION_TARGET_SUFFIX:STRING=static
        -DBUILTIN_TRANSLATIONS:BOOL=ON
        -DBUILTIN_ICON_THEMES:STRING=breeze;breeze-dark;Numix
        -DIMAGE_FORMAT_SUPPORT:STRING=Gif;ICO;Jpeg
        -DSVG_SUPPORT:BOOL=ON
        -DSVG_ICON_SUPPORT:BOOL=ON
        -DWEBVIEW_PROVIDER:STRING=none
    '
  )

  for _arch in "${_architectures[@]}"; do
    local gcc_version=$($_arch-gcc --version | grep "^$_arch-gcc" | sed 's/^.* //g')

    for _cfg in "${_configurations[@]}"; do
      msg2 "${_arch}-${_cfg}"
      mkdir -p "build-${_arch}-${_cfg}" && pushd "build-${_arch}-${_cfg}"
      ${_arch}-cmake \
        -G Ninja \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DCMAKE_INSTALL_PREFIX="/usr/${_arch}" \
        -DCONFIGURATION_NAME:STRING="${_cfg}" \
        -DCONFIGURATION_DISPLAY_NAME="" \
        -DCONFIGURATION_PACKAGE_SUFFIX:STRING="-${_cfg}" \
        -DJS_PROVIDER:STRING="${_js_provider}" \
        -DENABLE_JSON_EXPORT:BOOL="${_json_export}" \
        -DREFLECTION_GENERATOR_EXECUTABLE:FILEPATH='/usr/bin/reflective_rapidjson_generator' \
        -DREFLECTION_GENERATOR_TRIPLE:STRING="${_arch}" \
        -DREFLECTION_GENERATOR_INCLUDE_DIRECTORIES="/usr/lib/gcc/${_arch}/${gcc_version}/include;/usr/${_arch}/include/c++/${gcc_version};/usr/${_arch}/include/c++/${gcc_version}/${_arch};/usr/${_arch}/include" \
        -DENABLE_TARGETS_FOR_MINGW64_CROSS_PACKAGING:BOOL=ON \
        ${_config_flags[$_cfg]} \
        ../
      ninja
      popd
    done
  done
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"

  install \
    -D --target-directory="$pkgdir/usr/share/licenses/$pkgname" \
    LICENSES-windows-distribution.md

  for _arch in "${_architectures[@]}"; do
    for _cfg in "${_configurations[@]}"; do
      msg2 "${_arch}-${_cfg}"
      pushd "build-${_arch}-${_cfg}"
      DESTDIR="${pkgdir}" ninja install-mingw-w64-strip
      popd
    done
  done
}
