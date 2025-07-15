# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=espanso-gui
_app_id=io.unobserved.espansoGUI
pkgver=24.7
pkgrel=1
pkgdesc="GUI frontend for espanso"
arch=('x86_64')
url="https://github.com/unobserved-io/espanso-gui"
license=('GPL-3.0-or-later')
depends=(
  'espanso'
  'hicolor-icon-theme'
)
makedepends=(
  'cargo'
  'meson'
)
checkdepends=('appstream')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('041646c7af49163dbfc9377a41ce8836e0c3191a9f5ee68cba2a7f26282aec07')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  cd "$pkgname-$pkgver"
  appstreamcli validate --no-net "assets/linux/${_app_id}.appdata.xml"
  desktop-file-validate "assets/linux/${_app_id}.desktop"
}

package() {
  meson install -C build --destdir "$pkgdir"
}
