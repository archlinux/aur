# Maintainer: Meliodas888 <marticolelmolina@gmail.com>
pkgname=poe2-price-check
pkgver=0.1.0
pkgrel=1
pkgdesc="Path of Exile 2 price checker for Wayland: live trade listings and poe.ninja economy data"
arch=('x86_64')
# ring builds C sources; makepkg's default -flto=auto makes them LTO bitcode that
# rust-lld cannot link (undefined ring_core_* symbols).
options=('!lto')
url="https://github.com/Meliodas8/PoE2-PriceCheck"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'hicolor-icon-theme')
optdepends=('wl-clipboard: item copy from the game (Price Check tab)')
makedepends=('cargo' 'nodejs' 'npm' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('6fbb3f6a4adcb93e192b6b8e7cd8af9f4663db56525355dfde401fadfd4691db'
            '8b193f7946318f58b2aecb63c0fff6d87a270b52245b21c84a50959c57da6b86')
_srcdir="PoE2-PriceCheck-$pkgver"

prepare() {
  cd "$_srcdir"
  npm ci
  cd src-tauri
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
  cd "$_srcdir"
  export RUSTUP_TOOLCHAIN=stable
  npm run tauri build -- --no-bundle
}

package() {
  cd "$_srcdir"
  install -Dm755 "src-tauri/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "src-tauri/icons/128x128.png" \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
  install -Dm644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
