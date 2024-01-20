# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=espanso-gui
_app_id=io.unobserved.espansoGUI
pkgver=23.10
pkgrel=1
pkgdesc="GUI frontend for espanso"
arch=('x86_64')
url="https://github.com/unobserved-io/espanso-gui"
license=('GPL-3.0-or-later')
depends=('espanso' 'gtk3' 'hicolor-icon-theme')
makedepends=('cargo' 'meson')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a0ba09756ea2fe97e2b07569ba8cd2938e0c40826c02f4a93efc1e62aa3fa472')

prepare() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  cd "$pkgname-$pkgver"
  appstream-util validate-relax --nonet "assets/linux/${_app_id}.appdata.xml" || :
  desktop-file-validate "assets/linux/${_app_id}.desktop"
}

package() {
  meson install -C build --destdir "$pkgdir"
}
