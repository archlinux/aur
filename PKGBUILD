# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: th1nhhdk <th1nhhdk@tutanota.com>
# Contributor: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=gnome-obfuscate
pkgver=0.0.8
pkgrel=1
pkgdesc="Censor private information."
arch=('x86_64')
url="https://gitlab.gnome.org/World/obfuscate"
license=('GPL3')
depends=('libadwaita')
makedepends=('cargo' 'git' 'meson')
checkdepends=('appstream-glib')
_commit=4dd6b7cd322cff53394473d4426dd2f22c70b82d  # tags/0.0.8^0
source=("git+https://gitlab.gnome.org/World/obfuscate.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd obfuscate
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd obfuscate
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
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
