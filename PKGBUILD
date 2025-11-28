# Maintainer: pierspad <pierpaolospadafora@proton.me>
pkgname=textmerger
pkgver=2.0.0
pkgrel=3
pkgdesc="A Rust/Tauri GTK3 application for merging text files"
arch=('x86_64')
url="https://github.com/pierspad/textmerger"
license=('GPL3')

options=('!debug')

depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'cairo'
  'gdk-pixbuf2'
  'glib2'
  'pango'
  'libappindicator-gtk3'
)

makedepends=('cargo' 'nodejs' 'npm')

source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/pierspad/textmerger/archive/refs/tags/v$pkgver.tar.gz"

)
sha256sums=('fe8eb3552adbe4f5cc2b74755de3a06d9508c29c471ca16d70e1741babd56f99')

prepare() {
  cd "$srcdir/$pkgname-$pkgver/textmerger"
  echo "Installing Node dependencies..."
  npm install
  
  rm -f src-tauri/.cargo/config.toml
}

build() {
  cd "$srcdir/$pkgname-$pkgver/textmerger"
  
  echo "Building Tauri application..."
  sed -i 's/"active": true/"active": false/' src-tauri/tauri.conf.json
  
  npm run tauri build
}

package() {
  cd "$srcdir/$pkgname-$pkgver/textmerger"
  
  install -Dm755 "src-tauri/target/release/textmerger" "$pkgdir/usr/bin/textmerger"
  
  install -Dm644 "../packaging/textmerger.desktop" "$pkgdir/usr/share/applications/textmerger.desktop"
  
  install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/pixmaps/textmerger.png"
  
  cd ..
  install -Dm644 docs/README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 docs/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
