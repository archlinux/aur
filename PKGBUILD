# Maintainer: Justus Tartz <aur at jrtberlin dot de>
# https://aur.archlinux.org/packages/steam-boilr-gui
pkgname=steam-boilr-gui
_app_id=io.github.philipk.boilr
pkgver=1.9.1
pkgrel=1
pkgdesc="Synchronize games from other platforms into your Steam library"
arch=('x86_64')
url="https://github.com/PhilipK/BoilR"
license=('Apache' 'MIT')
depends=('fontconfig' 'gcc-libs' 'hicolor-icon-theme')
makedepends=('cargo' 'cmake')
checkdepends=('desktop-file-utils' 'appstream-glib')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v.$pkgver.tar.gz")
sha256sums=('763b27f2427464ca11d774ff1298cd44039c0248cfd8b81f51c6f25fbd515a72')

prepare() {
  cd "BoilR-v.$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"

  # boilr binary name conflicts with boilr, boilr-bin & boilr-git AUR packages
  sed -i 's/Exec=boilr/Exec=boilr-gui/g' "flatpak/${_app_id}.desktop"
}

build() {
  cd "BoilR-v.$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "BoilR-v.$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen

  appstream-util validate-relax --nonet "flatpak/${_app_id}.appdata.xml"
  desktop-file-validate "flatpak/${_app_id}.desktop"
}

package() {
  cd "BoilR-v.$pkgver"
  install -Dm755 target/release/boilr "$pkgdir/usr/bin/boilr-gui"
  install -Dm644 "flatpak/${_app_id}.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "flatpak/${_app_id}.appdata.xml" -t "$pkgdir/usr/share/appdata/"
  install -Dm644 LICENSE-MIT.txt -t "$pkgdir/usr/share/licenses/$pkgname/"

  for icon_size in 64 128 256; do
    install -Dm644 "resources/${icon_size}/${_app_id}.png" -t \
      "$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps/"
  done
  install -Dm644 "resources/${_app_id}.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/${_app_id}.png"
  install -Dm644 resources/logo32.png "$pkgdir/usr/share/icons/hicolor/96x96/apps/${_app_id}.png"
}

