# Maintainer: Meliodas888 <marticolelmolina@gmail.com>
pkgname=poe2-price-check-git
_pkgname=poe2-price-check
pkgver=0.1.0
pkgrel=1
pkgdesc="Path of Exile 2 price checker for Wayland: live trade listings and poe.ninja economy data (git)"
arch=('x86_64')
# ring builds C sources; makepkg's default -flto=auto makes them LTO bitcode that
# rust-lld cannot link (undefined ring_core_* symbols).
options=('!lto')
url="https://github.com/Meliodas8/PoE2-PriceCheck"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'hicolor-icon-theme')
optdepends=('wl-clipboard: item copy from the game (Price Check tab)')
makedepends=('git' 'cargo' 'nodejs' 'npm' 'pkgconf')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git"
        "$_pkgname.desktop")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$_pkgname"
  npm ci
  cd src-tauri
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  npm run tauri build -- --no-bundle
}

package() {
  cd "$_pkgname"
  install -Dm755 "src-tauri/target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "src-tauri/icons/128x128.png" \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/$_pkgname.png"
  install -Dm644 "$srcdir/$_pkgname.desktop" \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
