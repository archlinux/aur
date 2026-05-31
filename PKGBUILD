# Maintainer: Dan Zavadin <daniil.zavadin@gmail.com>
pkgname=dionysus-git
pkgver=0.0.0.r0.g0000000
pkgrel=1
pkgdesc="Simple GTK4 application launcher for Wayland"
arch=('x86_64')
url="https://github.com/dzavadindev/dionysus"
license=('GPL-3.0-or-later')
provides=('dionysus')
conflicts=('dionysus')

depends=('gtk4' 'hicolor-icon-theme')
makedepends=('git' 'cargo' 'rust')
options=(!debug)

source=("git+https://github.com/dzavadindev/dionysus.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/dionysus"
  git describe --long --tags --abbrev=7 2>/dev/null \
    | sed 's/^v//; s/-/.r/; s/-/./' \
    || printf "0.0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/dionysus"
  cargo build --release --locked
}

check() {
  cd "$srcdir/dionysus"
  cargo test --release --locked
}

package() {
  cd "$srcdir/dionysus"

  install -Dm755 target/release/dionysus "$pkgdir/usr/bin/dionysus"
}
