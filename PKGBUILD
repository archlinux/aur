pkgname=qml-niri
pkgver=0.2.0
pkgrel=1
pkgdesc='QML plugin for interacting with niri via IPC'
arch=('x86_64')
url='https://github.com/imiric/qml-niri'
license=('MIT')
depends=('qt6-base' 'qt6-declarative')
optdepends=('niri: Wayland compositor backend used by this plugin')
makedepends=('cmake' 'patchelf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f8ed442aa4850c35fa9c95a8904b7a3317d2335a72bcc2dbb6f5ea7866c47d06')

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=None
  cmake --build build
}

package() {
  local qml_import_path
  local module_dir
  qml_import_path="$(/usr/lib/qt6/bin/qtpaths6 --query QT_INSTALL_QML)"
  module_dir="$pkgdir/$qml_import_path/Niri"

  install -d "$pkgdir/$qml_import_path"
  cp -r "$srcdir/build/Niri" "$pkgdir/$qml_import_path/"
  rm -f "$module_dir/Niri_qml_module_dir_map.qrc"
  patchelf --set-rpath '$ORIGIN' "$module_dir/libNiriplugin.so"

  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
