# Maintainer: Romain Chardiny <romain.chardiny@gmail.com>
pkgname=floc-git
pkgver=r144.8e6e9b6
pkgrel=1
pkgdesc="Flo Compiler"
arch=("any")
url="https://github.com/romch007/floc"
license=('MIT')
depends=("llvm-libs" "gcc-libs")
optdepends=('clang: linking support')
provides=('floc')
makedepends=('git' 'rust' 'llvm')
source=('git+https://github.com/romch007/floc.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/floc"

# Git, no tags available
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/floc"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/floc"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked --offline
}

package() {
  cd "$srcdir/floc"

  install -Dm755 target/release/floc "$pkgdir"/usr/bin/floc

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/floc/LICENSE

  find . -name floc.bash -type f -exec install -Dm644 {} "$pkgdir/usr/share/bash-completions/completions/floc" \;
  find . -name _floc -type f -exec install -Dm644 {} "$pkgdir/usr/share/zsh/site-functions/_floc" \;
  find . -name sd.fish -type f -exec install -Dm644 {} "$pkgdir/usr/share/fish/vendor_completions/floc.fish" \;
}
