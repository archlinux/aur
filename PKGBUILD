# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: th1nhhdk <th1nhhdk@tutanota.com>
# Contributor: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=gnome-obfuscate
pkgver=0.0.9
pkgrel=1
pkgdesc="Censor private information."
arch=('x86_64')
url="https://gitlab.gnome.org/World/obfuscate"
license=('GPL3')
depends=('libadwaita')
makedepends=('cargo' 'git' 'meson')
checkdepends=('appstream-glib')
_commit=dbe45dc431d8deb8e1c715a1d9194368505e41a5  # tags/0.0.9^0
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
