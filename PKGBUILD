# Maintainer: Ersin Can Karaca <[canersinkaraca@gmail.com]>
pkgname=lapse-git
pkgver=0.1.0
pkgrel=1
pkgdesc="Native screen recording application in Rust for Wayland/X11"
arch=('x86_64')
url="https://github.com/canersin/lapse"
license=('custom')
depends=('gtk3' 'wayland')
makedepends=('cargo' 'git')
source=("git+https://github.com/canersin/lapse.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/lapse"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/lapse"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$srcdir/lapse"
  install -Dm755 "target/release/lapse" "$pkgdir/usr/bin/lapse"
  install -Dm644 "assets/lapse.desktop" "$pkgdir/usr/share/applications/lapse.desktop"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
