# Maintainer: adelmonte
pkgname=g-view
pkgver=0.1.0
pkgrel=3
pkgdesc="Minimal image viewer (GTK3 port of qView)"
arch=('x86_64' 'aarch64')
url="https://github.com/adelmonte/g-view"
license=('GPL-3.0-or-later')
depends=('gtk3' 'lcms2' 'gdk-pixbuf2' 'cairo' 'pango' 'glib2' 'hicolor-icon-theme')
makedepends=('cargo')
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7f06498f5422e2c4708e8740f3bd00ab5f962e38374c600ce4dfd3c978e7c033')

_host() {
  rustc -vV | sed -n 's/^host: //p'
}

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(_host)"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release --target "$(_host)"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/$(_host)/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "dist/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  for d in dist/hicolor/*/apps; do
    size=$(basename "$(dirname "$d")")
    for f in "$d"/*; do
      ext="${f##*.}"; case "$f" in *symbolic*) name=$pkgname-symbolic;; *) name=$pkgname;; esac
      install -Dm644 "$f" "$pkgdir/usr/share/icons/hicolor/$size/apps/$name.$ext"
    done
  done
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
