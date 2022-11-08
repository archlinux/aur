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
pkgname=syncthingtray
pkgver=1.3.0
pkgrel=5
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
pkgdesc='Tray application for Syncthing'
license=('GPL')
depends=('libqtutilities.so' 'libqtforkawesome.so' 'libc++utilities.so' 'libboost_filesystem.so' 'qt5-svg' 'openssl'
         'desktop-file-utils' 'xdg-utils')
[[ $_webview_provider == none ]] && depends+=('qt5-base')
[[ $_webview_provider == webkit ]] && depends+=('qt5-webkit')
[[ $_webview_provider == webengine ]] && depends+=('qt5-webengine')
[[ $_js_provider == script ]] && depends+=('qt5-script')
[[ $_js_provider == qml ]] && depends+=('qt5-declarative')
[[ $_enable_kio_plugin ]] && optdepends+=('kio: KIO plugin for Syncthing actions in Dolphin')
[[ $_enable_plasmoid ]] && optdepends+=('plasma-workspace: Plasmoid for Plasma 5 desktop')
makedepends=('cmake' 'ninja' 'qt5-tools' 'mesa' 'boost')
checkdepends=('cppunit' 'syncthing' 'iproute2' 'appstream')
[[ $_enable_kio_plugin ]] && makedepends+=('kio')
[[ $_enable_plasmoid ]] && makedepends+=('plasma-framework' 'extra-cmake-modules')
url="https://github.com/Martchus/${_reponame}"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz"
        'https://github.com/Martchus/syncthingtray/commit/f121f5f740d799c2b29e9f5ce8e15ddae7857a28.patch'
        'https://github.com/Martchus/syncthingtray/commit/ad81c29a1d8024e79da51efc2b3dc19583be1e21.patch'
        'https://github.com/Martchus/syncthingtray/commit/0ca1fd163824e3100ff3ab258ffeb65a6ceadb3a.patch'
        'https://github.com/Martchus/syncthingtray/commit/0ab21657c4feb0500299af79314664b05edfc365.patch'
        'https://github.com/Martchus/syncthingtray/commit/521567f2350baa1e75a60ad48f5ed7923777b024.patch'
        'https://github.com/Martchus/syncthingtray/commit/10ddc79382a385ac361a968121548e616d54004d.patch'
        'https://github.com/Martchus/syncthingtray/commit/8f4961d1b93f1eb868d8782ba54b97d36721cb56.patch'
        'https://github.com/Martchus/syncthingtray/commit/e5ffffcaec07c60b49ddc9bd1e8ffc19738f1ea2.patch')
sha256sums=('aece0be140187a3c0c989a50007c3d5541d9e1abd51ec45b8c1e45ab783a9e52'
            '2df0516de56fa279af4fa1f85d524a1aa9e9df4ea3ecd8bacbc146aabf5920d9'
            'd6b4af56e0a80d3c813637bc0e9b74dae51f2fbd3919e992a342f9a5abd10acc'
            '763fd7e2804c5bcf2f78ed3fb3669528163f2ba0b0b4d14eda07174932761cc2'
            '8dfddabf8f231457327d4eb91a6d204af64f4c621038cdb488b050c07581a430'
            'db68ebd99729865788da17d2b7d61e58602b0df494dcd83de58b5ad088dd225c'
            '959d85df17243215fb144d4556e10dc2a3dc0a8e380ac5e2bc9e17de29f96027'
            '89c4ddda556926ea4dbb66d2c9373930804801fa276f8cbcb61daef2fe2e801e'
            '43dcb6baaa5ea16efecebc4bceb11677d04c82945a4ec0642483fe85f8909ba4')

ephemeral_port() {
  comm -23 <(seq 49152 65535) <(ss -tan | awk '{print $4}' | cut -d':' -f2 | grep "[0-9]\{1,5\}" | sort | uniq) | shuf | head -n 1
}

prepare() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"

  patch -p1 -i ../f121f5f740d799c2b29e9f5ce8e15ddae7857a28.patch
  patch -p1 -i ../ad81c29a1d8024e79da51efc2b3dc19583be1e21.patch
  patch -p1 -i ../0ca1fd163824e3100ff3ab258ffeb65a6ceadb3a.patch
  patch -p1 -i ../0ab21657c4feb0500299af79314664b05edfc365.patch
  patch -p1 -i ../521567f2350baa1e75a60ad48f5ed7923777b024.patch
  patch -p1 -i ../10ddc79382a385ac361a968121548e616d54004d.patch
  patch -p1 -i ../8f4961d1b93f1eb868d8782ba54b97d36721cb56.patch
  patch -p1 -i ../e5ffffcaec07c60b49ddc9bd1e8ffc19738f1ea2.patch
}

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"

  local additional_args=
  [[ $_enable_kio_plugin ]] || additional_args+=' -DNO_FILE_ITEM_ACTION_PLUGIN=ON'
  [[ $_enable_plasmoid ]] || additional_args+=' -DNO_PLASMOID=ON'

  cmake \
    -G Ninja \
    -DCMAKE_BUILD_TYPE:STRING='Release' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
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
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  QT_QPA_PLATFORM=offscreen SYNCTHING_PORT=$(ephemeral_port) SYNCTHING_TEST_TIMEOUT_FACTOR=3 ninja check
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  DESTDIR="${pkgdir}" ninja install
}
