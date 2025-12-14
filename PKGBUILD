# Maintainer: pierspad <pierpaolospadafora@proton.me>
pkgname=textmerger
pkgver=2.2.0
pkgrel=1
pkgdesc="A Rust/Tauri GTK3 application for merging text files"
arch=('x86_64')
url="https://github.com/pierspad/textmerger"
license=('GPL3')
provides=('textmerger')
conflicts=('textmerger')

options=('!strip' '!debug')

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

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c069f078deb056f5c8035ff22c2ab91a898202107921da9d3f33681dc8824b86')

prepare() {
  cd "$pkgname-$pkgver/textmerger"
  npm install
}

build() {
  cd "$pkgname-$pkgver/textmerger"
  npm run tauri build -- --no-bundle
}

package() {
  cd "$pkgname-$pkgver/textmerger"

  install -Dm755 "src-tauri/target/release/textmerger" "$pkgdir/usr/bin/textmerger"

  for res in 32 128; do
    install -Dm644 "src-tauri/icons/${res}x${res}.png" \
      "$pkgdir/usr/share/icons/hicolor/${res}x${res}/apps/textmerger.png"
  done
  install -Dm644 "src-tauri/icons/128x128@2x.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/textmerger.png"

  mkdir -p "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/textmerger.desktop" <<EOF
[Desktop Entry]
Name=TextMerger
Comment=A Rust/Tauri GTK3 application for merging text files
Exec=textmerger
Icon=textmerger
Terminal=false
Type=Application
Categories=Utility;GTK;
EOF
}
