# Maintainer: Ilya Zlobintsev <ilya.zl@protonmail.com>
pkgname=lact-git
pkgver=r444.a8c2c60
pkgrel=1
license=("MIT")
pkgdesc="AMDGPU Controller application (git version)"
url="https://github.com/ilya-zlobintsev/LACT"
makedepends=("rust" "git" "make" "clang" "blueprint-compiler")
depends=("gtk4" "hwdata")
arch=("x86_64" "aarch64")
backup=('etc/lact/config.yaml')
source=("git+https://github.com/ilya-zlobintsev/LACT.git")
sha512sums=("SKIP")
provides=('lact')
install=lact.install

pkgver() {
  cd LACT
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "LACT"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "LACT"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build -p lact --frozen --release
}

package() {
  cd "LACT"
  make PREFIX=/usr DESTDIR="$pkgdir/" install

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
