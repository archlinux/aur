# Maintainer: Elizabeth Vatten Veiga <parajogapaladins@gmail.com>
pkgname=icebar-git
pkgver=r155.g9ed70de
pkgrel=1
pkgdesc="Lightweight Wayland status bar"
url="https://github.com/HaruNashii/Icebar"
license=('MIT')
makedepends=('git' 'rust' 'cargo')
depends=('libxcb' 'gcc-libs' 'libpulse' 'dbus' 'glibc' 'libxkbcommon' 'wayland')
arch=('x86_64')
source=("git+https://github.com/HaruNashii/Icebar.git")
options=('!debug')
sha256sums=('SKIP')
provides=('icebar')
conflicts=('icebar-git' 'icebar' 'icebar-bin')

pkgver() {
  cd "$srcdir/Icebar"
  printf "r%s.g%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/Icebar"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked
}

build() {
  cd "$srcdir/Icebar"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

# check() omitted; Reason: Upstream Project Doesn't Have Tests Yet

package() {
  cd "$srcdir/Icebar"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/icebar"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
