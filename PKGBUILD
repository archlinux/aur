# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=espanso-gui
_app_id=io.unobserved.espansoGUI
pkgver=2023.09.15
pkgrel=1
pkgdesc="GUI frontend for espanso"
arch=('x86_64')
url="https://github.com/unobserved-io/espanso-gui"
license=('GPL3')
depends=('espanso' 'gtk3' 'hicolor-icon-theme')
makedepends=('cargo' 'meson')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('232ac6af4fcdc64d4e7ff98eee84dbae26e069a36574ceb467ced3f7f5989a71')

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
  appstream-util validate-relax --nonet "assets/linux/${_app_id}.appdata.xml"
  desktop-file-validate "assets/linux/${_app_id}.desktop"
}

package() {
  meson install -C build --destdir "$pkgdir"
}
