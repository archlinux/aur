# Maintainer: Alexander Karpukhin <thealexdev23@gmail.com>

pkgname=power-options-webview
pkgver=1.2.3
pkgrel=1
pkgdesc="A Web Renderer frontend for Power Options, a blazingly fast power management solution."
arch=('x86_64')
url=https://github.com/thealexdev23/power-options
license=('MIT')

depends=('power-options-daemon' 'webkit2gtk' 'xdotool')
makedepends=('cargo' 'dioxus-cli')

provides=('power-options-webview')
conflicts=('power-options-webview-git')

source=("$pkgname-$pkgver.tar.gz::https://github.com/thealexdev23/power-options/archive/v$pkgver.tar.gz")
sha256sums=('e604cc0ef8b786697cda0ff67d5abdff334d2449bf83efba7c2ee0112b6b9f12')

build() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$srcdir/power-options-$pkgver/crates/frontend-webview"
  dx build --release
}

package() {
  cd "$srcdir/power-options-$pkgver"

  install -Dm755 "target/release/frontend" "$pkgdir/usr/bin/power-options-webview"

  mkdir -p "$pkgdir/usr/lib/power-options-webview/"
  cp -r "crates/frontend-webview/assets" "$pkgdir/usr/lib/power-options-webview/"

  install -Dm755 "icon.png" "$pkgdir/usr/share/icons/power-options-webview.png"

  install -Dm755 "install/power-options-webview.desktop" "$pkgdir/usr/share/applications/power-options-webview.desktop"
}
