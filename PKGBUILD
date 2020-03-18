# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# set the web view provider: either webkit, webengine, auto or none
_webview_provider=${MINGW_W64_SYNCTHING_TRAY_WEBVIEW_PROVIDER:-none}

# set the JavaScript provider: either script, qml, auto or none
_js_provider=${MINGW_W64_SYNCTHING_TRAY_JS_PROVIDER:-qml}

# set whether libsyncthing should be enabled: either ON or OFF
_enable_libsyncthing=${MINGW_W64_SYNCTHING_TRAY_JS_PROVIDER:-ON}

_reponame=syncthingtray
pkgname=mingw-w64-syncthingtray
_name=${pkgname#mingw-w64-}
pkgver=0.10.7
pkgrel=1
arch=('any')
pkgdesc='Tray application for Syncthing (mingw-w64)'
license=('GPL')
depends=('mingw-w64-crt' 'mingw-w64-qt5-svg' 'mingw-w64-qtutilities' 'mingw-w64-openssl')
[[ $_webview_provider == none ]] && depends+=('mingw-w64-qt5-base')
[[ $_webview_provider == webkit ]] && depends+=('mingw-w64-qt5-webkit')
[[ $_webview_provider == webengine ]] && depends+=('mingw-w64-qt5-webengine')
[[ $_js_provider == script ]] && depends+=('mingw-w64-qt5-script')
[[ $_js_provider == qml ]] && depends+=('mingw-w64-qt5-declarative')
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake' 'mingw-w64-qt5-tools' 'ffmpeg')
[[ $_enable_libsyncthing == ON ]] && makedepends+=('git' 'go')
url="https://github.com/Martchus/${_reponame}"
source=("${_name}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
[[ $_enable_libsyncthing == ON ]] && source+=("syncthing::git+https://github.com/Martchus/syncthing.git#branch=libsyncthing-latest")
sha256sums=('06522571891e67d0010535f5c416bf83f156938c4817f3f23b28d9fed658f998'
            'SKIP')
options=(!buildflags staticlibs !strip !emptydirs)

_architectures=('i686-w64-mingw32' 'x86_64-w64-mingw32')
_configurations=()
[[ $NO_SHARED_LIBS ]] || _configurations+=('shared')
[[ $NO_STATIC_LIBS ]] || _configurations+=('static') makedepends+=('mingw-w64-qt5-base-static' 'mingw-w64-qt5-translations' 'breeze-icons' 'numix-icon-theme-git')
[[ $_enable_libsyncthing == ON ]] && _disable_libsyncthing=OFF || _disable_libsyncthing=ON

prepare() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"

  # ensure path where the libsyncthing Git submodule would be cloned into exists
  mkdir -p 'libsyncthing/go/src/github.com/syncthing'
  pushd 'libsyncthing/go/src/github.com/syncthing'

  # delete empty sub directory of the Git submodule present in the archive from GitHub
  [[ -d syncthing ]] && rm -r syncthing

  # link libsyncthing repo where the Git submodule would have been cloned into
  ln -sf "$srcdir/syncthing" .

  popd
}

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"

  declare -A _config_flags=(
    [shared]='
        -DBUILD_SHARED_LIBS:BOOL=ON
    '
    [static]='
        -DBUILD_SHARED_LIBS:BOOL=OFF
        -DCMAKE_FIND_LIBRARY_SUFFIXES:STRING=.a;.lib
        -DSTATIC_LINKAGE:BOOL=ON
        -DSTATIC_LIBRARY_LINKAGE:BOOL=ON
        -DQT_PACKAGE_PREFIX=StaticQt5
        -DKF_PACKAGE_PREFIX=StaticKF5
        -DSYNCTHINGCTL_CONFIGURATION_TARGET_SUFFIX:STRING=static
        -DSYNCTHINGTRAY_CONFIGURATION_TARGET_SUFFIX:STRING=static
        -DENABLE_QT_TRANSLATIONS:BOOL=ON
        -DBUILTIN_TRANSLATIONS:BOOL=ON
        -DBUILTIN_ICON_THEMES:STRING=breeze;breeze-dark;Numix
        -DIMAGE_FORMAT_SUPPORT:STRING=Gif;ICO;Jpeg
        -DSVG_SUPPORT:BOOL=ON
        -DSVG_ICON_SUPPORT:BOOL=0N
    '
  )

  for _arch in "${_architectures[@]}"; do
    for _cfg in "${_configurations[@]}"; do
      msg2 "${_arch}-${_cfg}"
      mkdir -p "build-${_arch}-${_cfg}" && pushd "build-${_arch}-${_cfg}"
      ${_arch}-cmake \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DCMAKE_INSTALL_PREFIX="/usr/${_arch}" \
        -DCONFIGURATION_NAME:STRING="${_cfg}" \
        -DCONFIGURATION_PACKAGE_SUFFIX:STRING="-${_cfg}" \
        -DWEBVIEW_PROVIDER:STRING="${_webview_provider}" \
        -DJS_PROVIDER:STRING="${_js_provider}" \
        -DSYSTEMD_SUPPORT=OFF \
        -DNO_FILE_ITEM_ACTION_PLUGIN=ON \
        -DENABLE_TARGETS_FOR_MINGW64_CROSS_PACKAGING:BOOL=ON \
        -DNO_LIBSYNCTHING:BOOL="${_disable_libsyncthing}" \
        -DUSE_LIBSYNCTHING:BOOL="${_enable_libsyncthing}" \
        ${_config_flags[$_cfg]} \
        ../
      make
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
      make DESTDIR="${pkgdir}" install-mingw-w64-strip
      popd
    done
  done
}
