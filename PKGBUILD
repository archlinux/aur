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

source=("textmerger-$pkgver.tar.gz")
sha256sums=('22c87e92f50d70f154f70924b9683d8706bfe2e0b6b64ad449156191a6cc7361')

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
