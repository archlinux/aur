# Maintainer: Seratym < {replace_by_handle} at proton dot me>
pkgname=dh-to-do
pkgver=3.4.0
pkgrel=1
pkgdesc='A to-do app with a floating reminder of the task you are on, simple lists, and easy time tracking'
arch=('x86_64')
url='https://digitalhabits.org/tools/to-do'
license=('CC-BY-NC-ND-3.0')
depends=('cairo' 'dbus' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme' 'libgcc' 'libsoup3' 'webkit2gtk-4.1')
makedepends=('cargo' 'nodejs' 'pnpm')
optdepends=('xorg-xwayland: for Wayland sessions where the app selects its X11 backend')
options=('!debug' '!lto')
source=(
  "$pkgname-$pkgver-source.tar.gz::https://github.com/digitalhabits/dh-to-do/archive/refs/tags/v$pkgver.tar.gz"
  "$pkgname.desktop"
)
sha256sums=('c42ef4fb40a94c9c17db187ed9def88a4c934afeba36d3173a68abf18349b57d'
            '924410004b2b07d3f5278663162fcf8bca79e2b440b79ce08945d2b2298f7a7d')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  pnpm install --frozen-lockfile
  cargo fetch --locked --target host-tuple \
    --manifest-path apps/todo/src-tauri/Cargo.toml
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR="$srcdir/target"
  pnpm --dir apps/todo app:build --no-bundle -- --frozen
}

package() {
  cd "$pkgname-$pkgver"
  local icons=apps/todo/src-tauri/icons

  install -Dm755 "$srcdir/target/release/digital-habits-todo" \
    "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$icons/32x32.png" \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
  install -Dm644 "$icons/128x128.png" \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
  install -Dm644 "$icons/128x128@2x.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
}
