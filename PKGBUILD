# Maintainer: Sebastián Arrieta <sebastian.arrieta@pm.me>

pkgname=croc-gui
pkgver=1.0.0
pkgrel=1
pkgdesc="Encrypted Croc file transfers for Android, Linux, Windows, and web"
arch=('x86_64')
url="https://github.com/sarrietav-dev/croc"
license=('MIT')
depends=('gtk3' 'libx11' 'pango' 'cairo' 'glib2' 'gdk-pixbuf2' 'atk' 'libxkbcommon' 'libgl')
makedepends=('flutter' 'go' 'cmake' 'ninja' 'pkg-config' 'clang' 'base-devel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sarrietav-dev/croc/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')
options=('!strip')

build() {
  cd "$srcdir/croc-$pkgver"
  flutter config --no-analytics
  flutter pub get
  flutter build linux --release
}

package() {
  cd "$srcdir/croc-$pkgver"
  local bundle="build/linux/x64/release/bundle"
  install -d "$pkgdir/usr/lib/croc"
  cp -r "$bundle"/. "$pkgdir/usr/lib/croc/"
  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/croc/croc" "$pkgdir/usr/bin/croc-gui"
  install -Dm644 "third_party/croc-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
