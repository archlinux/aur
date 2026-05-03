pkgname=qml-niri
pkgver=0.1.4
pkgrel=1
pkgdesc='QML plugin for interacting with niri via IPC'
arch=('x86_64')
url='https://github.com/imiric/qml-niri'
license=('MIT')
depends=('qt6-base' 'qt6-declarative')
optdepends=('niri: Wayland compositor backend used by this plugin')
makedepends=('cmake' 'patchelf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0c536883ffe7a449500faf1aa66aada867aadd404ba748a4de6f33591ab2319c')

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
  cp -a "$srcdir/build/Niri" "$pkgdir/$qml_import_path/"
  patchelf --set-rpath '$ORIGIN' "$module_dir/libNiriplugin.so"

  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
