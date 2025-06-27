# Maintainer: Ilya Zlobintsev <ilya.zl@protonmail.com>
pkgname=lact-git
pkgver=r779.4082728
pkgrel=1
license=("MIT")
pkgdesc="AMDGPU Controller application (git version)"
url="https://github.com/ilya-zlobintsev/LACT"
makedepends=("rust" "git" "make" "clang")
depends=("gtk4" "hwdata" "vulkan-tools" "ocl-icd")
conflicts=("lact" "lact-libadwaita")
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
  export CARGO_NET_GIT_FETCH_WITH_CLI="true"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "LACT"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export CARGO_NET_GIT_FETCH_WITH_CLI="true"
  cargo build -p lact --frozen --release
}

package() {
  cd "LACT"
  make PREFIX=/usr DESTDIR="$pkgdir/" install

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
