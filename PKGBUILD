_basename=cosmic-comp
pkgname=cosmic-comp-git
pkgver=r56.5657a77
pkgrel=1
pkgdesc="Pop!_OS Wayland compositor written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/$_basename"
license=('GPL3')
depends=('wayland')
makedepends=('cargo')
source=(git+https://github.com/pop-os/$_basename.git)
sha256sums=('SKIP')

pkgver() {
  cd "$_basename"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$_basename"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_basename"
  export RUSTUP_TOOLCHAIN=stable
  make
}

package() {
  cd "$_basename"
  sed -i "s|$_basename-bin \$(BIN)|$_basename-bin $pkgdir/usr/bin/$_basename|g" Makefile

  make BIN="/usr/bin/$_basename" DESTDIR="$pkgdir" install
}
