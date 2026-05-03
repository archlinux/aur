pkgname=qml-niri-git
_pkgname=qml-niri
pkgver=0.1.4.r6.g3e90700
pkgrel=1
pkgdesc='QML plugin for interacting with niri via IPC'
arch=('x86_64')
url='https://github.com/imiric/qml-niri'
license=('MIT')
depends=('qt6-base' 'qt6-declarative')
optdepends=('niri: Wayland compositor backend used by this plugin')
makedepends=('cmake' 'git' 'patchelf')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags --match 'v[0-9]*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "$_pkgname" \
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
  patchelf --set-rpath '$ORIGIN' "$module_dir/libNiriplugin.so"

  install -Dm644 "$srcdir/$_pkgname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
