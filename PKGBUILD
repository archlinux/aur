# Maintainer: sachesi <xsachesi@pm.me>

# pkgver and sha256sums are filled in by .github/workflows/aur.yml for each release.
pkgname=tangent
pkgver=0.1.0
pkgrel=1
pkgdesc='GPU-rendered terminal for GTK 4 and libadwaita'
arch=('x86_64' 'aarch64')
url='https://github.com/sachesi/tangent'
license=('GPL-3.0-or-later')
# libglvnd: libEGL is loaded at run time, so nothing links against it.
depends=('gtk4>=1:4.22' 'libadwaita>=1:1.9' 'glib2' 'cairo' 'pango' 'graphene' 'libglvnd'
         'hicolor-icon-theme' 'libgcc' 'glibc')
makedepends=('cargo' 'blueprint-compiler' 'just' 'gettext')
optdepends=('xdg-terminal-exec: open Tangent from launchers that ask for a terminal')
conflicts=('tangent-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('16376e18e185b7637587a8e18c28cf703dc78623bbf8fae919d344c016b10d6d')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export TANGENT_LOCALEDIR=/usr/share/locale
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" just prefix=/usr install
}
