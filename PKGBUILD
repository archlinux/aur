# Maintainer: sachesi <xsachesi@pm.me>

# pkgver and sha256sums are filled in by .github/workflows/aur.yml for each release.
pkgname=chord
pkgver=0.1.0
pkgrel=1
pkgdesc='Text editor built with GTK 4, libadwaita and GtkSourceView'
arch=('x86_64' 'aarch64')
url='https://github.com/sachesi/chord'
license=('GPL-3.0-or-later')
depends=('gtk4>=1:4.22' 'libadwaita>=1:1.9' 'gtksourceview5' 'glib2' 'hicolor-icon-theme'
         'libgcc' 'glibc')
makedepends=('cargo' 'blueprint-compiler' 'just' 'gettext')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('cf13e0d321fa9af19eec50706ee08737c4e36be18d4dc34592129644ae0b0d76')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export CHORD_LOCALEDIR=/usr/share/locale
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
