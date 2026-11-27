# Maintainer: agzes <agzes0@proton.me>
pkgname=totray
_pkgname=ToTray
pkgver=1.0.0
pkgrel=1
pkgdesc="AutoRun and Tray Manager for Hyprland."
arch=('x86_64')
url="https://github.com/Agzes/ToTray"
license=('MIT' 'ISC')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'libxkbcommon' 'dbus')
optdepends=(
    'zenity: file picker for config export/import'
    'kdialog: file picker for config export/import on KDE'
)
makedepends=('cargo' 'pkgconf')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v.$pkgver.tar.gz")
sha256sums=('82a2c384e038779142fecd073b6b0838b524e404ddfc24416ca22176d6769945')

prepare() {
  cd "$_pkgname-v.$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname-v.$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$_pkgname-v.$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release
}

package() {
  cd "$_pkgname-v.$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "assets/logo.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
  install -Dm644 "assets/logo.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "assets/icons/LUCIDE_LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LUCIDE_LICENSE"
}
