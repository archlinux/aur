# Maintainer: Elizabeth Vatten Veiga <parajogapaladins@gmail.com>
pkgname=icelauncher-git
pkgver=r29.g695e56c
pkgrel=1
pkgdesc="Lightweight Wayland App Launcher"
url="https://github.com/HaruNashii/Icelauncher"
license=('MIT')
makedepends=('git' 'rust' 'cargo')
depends=('libxcb' 'gcc-libs' 'glibc')
arch=('x86_64')
source=("git+https://github.com/HaruNashii/Icelauncher.git")
options=('!debug')
sha256sums=('SKIP')
provides=('icelauncher')
conflicts=('icelauncher-git' 'icelauncher' 'icelauncher-bin')

pkgver() {
  cd "$srcdir/Icelauncher"
  printf "r%s.g%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/Icelauncher"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked
}

build() {
  cd "$srcdir/Icelauncher"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

# check() omitted; Reason: Upstream Project Doesn't Have Tests Yet

package() {
  cd "$srcdir/Icelauncher"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/icelauncher"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
