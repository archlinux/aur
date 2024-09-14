# Maintainer: Alexander Karpukhin <thealexdev23@gmail.com>

pkgname=power-options-webview
pkgver=1.0.1
pkgrel=1
pkgdesc="A Web Renderer frontend for Power Options, a blazingly fast power management solution."
arch=('x86_64')
url=https://github.com/thealexdev23/power-options
license=('MIT')

depends=('power-options-daemon' 'webkit2gtk')
makedepends=('cargo' 'dioxus-cli')

provides=('power-options-webview')
conflicts=('power-options-webview-git')

source=("$pkgname-$pkgver.tar.gz::https://github.com/thealexdev23/power-options/archive/v$pkgver.tar.gz")
sha256sums=('55b3056b972d37151397fec0c45522b566573a129779be5a3a66556aea4fe226')

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
