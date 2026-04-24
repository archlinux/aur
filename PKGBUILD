# Maintainer: Thiago <killown.matrix@gmail.com>
pkgname=flux-filemanager-git
_pkgname=flux
pkgver=0.1.0.r196.g44fbf0b
pkgrel=1
pkgdesc="Modern and simple file manager written in Rust with Libadwaita"
arch=('x86_64')
url="https://github.com/killown/flux"
license=('MIT')
depends=('libadwaita' 'gtk4' 'dconf' 'sqlite')
makedepends=('rust' 'cargo' 'git' 'clang' 'make')
provides=('flux-fm' 'flux')
conflicts=('flux-fm' 'flux')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  (
    set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-\)g/r\1/;s/-/./g' ||
      printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$_pkgname"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_pkgname"

  export CARGO_HOME="$srcdir/cargo-home"

  export LIBSQLITE3_SYS_USE_PKG_CONFIG=1

  export LDFLAGS="${LDFLAGS/--as-needed/}"

  cargo build --release --frozen
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
