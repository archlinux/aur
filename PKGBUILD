# Maintainer: Justin Dickey <justin.dickey.eg@gmail.com>

pkgname=gnotes-gtk
_appid=com.erisdor.Gnotes
pkgver=1.9.2
pkgrel=1
pkgdesc="Native GNOME client for Gnotes, self-hosted Markdown notes with live shared editing"
arch=('x86_64')
url="https://github.com/justinmdickey/gnotes"
license=('MIT')
depends=('glib2' 'glibc' 'graphene' 'gst-plugins-base' 'gst-plugins-base-libs' 'gst-plugins-good' 'gstreamer'
         'gtk4' 'hicolor-icon-theme' 'libadwaita' 'libgcc' 'pango')
makedepends=('cargo')
options=(!lto)
source=("gnotes-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('347c1fa3d2fd60a2ded876a2893be13564c118c75f498e0eaa593c2c708c3498')

prepare() {
  cd "gnotes-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "gnotes-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p gnotes-gtk
}

package() {
  cd "gnotes-$pkgver"
  install -Dm755 target/release/gnotes "$pkgdir/usr/bin/gnotes"
  install -Dm644 "gtk/data/$_appid.desktop" "$pkgdir/usr/share/applications/$_appid.desktop"
  install -Dm644 "gtk/data/$_appid.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_appid.svg"
  install -Dm644 "gtk/data/$_appid.metainfo.xml" "$pkgdir/usr/share/metainfo/$_appid.metainfo.xml"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
