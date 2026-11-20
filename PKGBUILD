# Maintainer: Justin Dickey <justin.dickey.eg@gmail.com>

pkgname=gnotes-gtk
_appid=com.erisdor.Gnotes
pkgver=1.10.0
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
sha256sums=('4d9bef75685af82b5931028ca9a91d81be375df1726c071ffb62752309378632')

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
