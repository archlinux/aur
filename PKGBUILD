# Maintainer: flear <teymurzadehuseyn14 at gmail dot com>
# AUR: mdflowviewer (kaynaktan derler). Hazır ikili için: mdflowviewer-bin
pkgname=mdflowviewer
pkgver=3.0.2
pkgrel=1
pkgdesc="Markdown viewer and editor with live preview (Tauri + WebKitGTK)"
arch=('x86_64' 'aarch64')
url="https://github.com/cafercan/MDViewer"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'glib2' 'cairo' 'pango' 'gdk-pixbuf2' 'libsoup3' 'xdg-utils' 'hicolor-icon-theme')
makedepends=('cargo')
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6bcdf5ca5eb4d2007a1e6eae1e2b0b86d6420ba9183972e7619e0dd381ee975d')

prepare() {
  cd "MDViewer-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "MDViewer-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # tauri/custom-protocol: arayüzü (public/) ikiliye gömer; `tauri build` da bunu yapar.
  cargo build --frozen --release -p mdflowviewer --features tauri/custom-protocol
}

check() {
  cd "MDViewer-$pkgver"
  # Pencere açmadan arayüzün ikiliye gömüldüğünü dener
  target/release/mdflowviewer --selftest
}

package() {
  cd "MDViewer-$pkgver"
  install -Dm755 target/release/mdflowviewer "$pkgdir/usr/bin/mdflowviewer"
  install -Dm644 packaging/linux/mdflowviewer.desktop "$pkgdir/usr/share/applications/mdflowviewer.desktop"
  for size in 32 192 512; do
    install -Dm644 "public/favicon-$size.png" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/mdflowviewer.png"
  done
  install -Dm644 public/favicon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/mdflowviewer.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
