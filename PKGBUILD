# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# if tests fail due to timeout, you can try to increase the timeout
# by setting SYNCTHING_TEST_TIMEOUT_FACTOR

# set the web view provider: either webkit, webengine, auto or none
_webview_provider=${SYNCTHING_TRAY_WEBVIEW_PROVIDER:-webengine}

# set the JavaScript provider: either script, qml, auto or none
_js_provider=${SYNCTHING_TRAY_JS_PROVIDER:-qml}

# set to non-empty string to enable KIO plugin to show Syncthing actions in
# Dolphin file browser
_enable_kio_plugin=${SYNCTHING_TRAY_ENABLE_KIO_PLUGIN:-1}

# set to non-empty string to enable Plasmoid for Plasma 5 desktop
_enable_plasmoid=${SYNCTHING_TRAY_ENABLE_PLASMOID:-1}

[[ $_enable_kio_plugin == 0 ]] && _enable_kio_plugin=
[[ $_enable_plasmoid == 0 ]] && _enable_plasmoid=

_reponame=syncthingtray
pkgname=syncthingtray-git
_name=${pkgname%-git}
pkgver=1258.835ba78
pkgrel=2
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
pkgdesc='Tray application for Syncthing'
license=('GPL')
depends=('qtutilities-git' 'qtforkawesome-git' 'libboost_filesystem.so' 'qt5-svg' 'openssl' 'desktop-file-utils' 'xdg-utils')
[[ $_webview_provider == none ]] && [[ $_js_provider == none ]] && depends+=('qt5-base')
[[ $_webview_provider == webkit ]] && depends+=('qt5-webkit')
[[ $_webview_provider == webengine ]] && depends+=('qt5-webengine')
[[ $_js_provider == script ]] && depends+=('qt5-script')
[[ $_js_provider == qml ]] && depends+=('qt5-declarative')
[[ $_enable_kio_plugin ]] && optdepends+=('kio: KIO plugin for Syncthing actions in Dolphin')
[[ $_enable_plasmoid ]] && optdepends+=('plasma-workspace: Plasmoid for Plasma 5 desktop')
makedepends=('cmake' 'ninja' 'qt5-tools' 'git' 'mesa' 'boost')
checkdepends=('cppunit' 'syncthing' 'iproute2')
[[ $_enable_kio_plugin ]] && makedepends+=('kio')
[[ $_enable_plasmoid ]] && makedepends+=('plasma-framework' 'extra-cmake-modules')
#provides=("${_name}")
conflicts=("${_name}")
url="https://github.com/Martchus/${_reponame}"
source=("${_reponame}::${MARTCHUS_GIT_URL_PREFIX:-git+https://github.com/Martchus}/${_reponame}.git")
sha256sums=('SKIP')

ephemeral_port() {
  comm -23 <(seq 49152 65535) <(ss -tan | awk '{print $4}' | cut -d':' -f2 | grep "[0-9]\{1,5\}" | sort | uniq) | shuf | head -n 1
}

pkgver() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame}"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame}"

  local additional_args=
  [[ $_enable_kio_plugin ]] || additional_args+=' -DNO_FILE_ITEM_ACTION_PLUGIN=ON'
  [[ $_enable_plasmoid ]] || additional_args+=' -DNO_PLASMOID=ON'

  cmake \
    -G Ninja \
    -DCMAKE_BUILD_TYPE:STRING='Release' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -DCONFIGURATION_NAME:STRING='git' \
    -DCONFIGURATION_PACKAGE_SUFFIX:STRING='-git' \
    -DQT_FORK_AWESOME_CONFIGURATION_TARGET_SUFFIX:STRING='git' \
    -DLIB_SYNCTHING_CONNECTOR_CONFIGURATION_TARGET_SUFFIX:STRING='git' \
    -DSYNCTHINGFILEITEMACTION_CONFIGURATION_TARGET_SUFFIX:STRING='git' \
    -DLIB_SYNCTHING_MODEL_CONFIGURATION_TARGET_SUFFIX:STRING='git' \
    -DSYNCTHINGPLASMOID_CONFIGURATION_TARGET_SUFFIX:STRING='git' \
    -DSYNCTHINGWIDGETS_CONFIGURATION_TARGET_SUFFIX:STRING='git' \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DWEBVIEW_PROVIDER="${_webview_provider}" \
    -DJS_PROVIDER="${_js_provider}" \
    -DSYSTEMD_SUPPORT=ON \
    -DBUILTIN_TRANSLATIONS:BOOL=ON \
    -DBUILTIN_TRANSLATIONS_OF_QT:BOOL=OFF \
    $additional_args \
    .
  ninja
}

check() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame}"
  QT_QPA_PLATFORM=offscreen SYNCTHING_PORT=$(ephemeral_port) SYNCTHING_TEST_TIMEOUT_FACTOR=3 ninja check
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame}"
  DESTDIR="${pkgdir}" ninja install
}
