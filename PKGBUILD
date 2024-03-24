# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: th1nhhdk <th1nhhdk@tutanota.com>
# Contributor: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=gnome-obfuscate
pkgver=0.0.10
pkgrel=1
pkgdesc="Censor private information."
arch=('x86_64')
url="https://gitlab.gnome.org/World/obfuscate"
license=('GPL-3.0-or-later')
depends=('libadwaita')
makedepends=('cargo' 'git' 'meson')
checkdepends=('appstream')
_commit=08e4d8f60037402afbc8f61f1eeabc62c86bccf0  # tags/0.0.10^0
source=("git+https://gitlab.gnome.org/World/obfuscate.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd obfuscate
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd obfuscate
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  arch-meson obfuscate build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
