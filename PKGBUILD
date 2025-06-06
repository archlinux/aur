# Maintainer: Romain Chardiny <romain.chardiny@gmail.com>
pkgname=floc-git
pkgver=0.2.0.r0.543c798
pkgrel=1
pkgdesc="Flo Compiler"
arch=("any")
url="https://github.com/romch007/floc"
license=('MIT')
depends=("llvm-libs" "gcc-libs")
provides=('floc')
makedepends=('git' 'rust' 'llvm' 'clang')
source=('git+https://github.com/romch007/floc.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/floc"

  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
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

  find . -name floc.bash -type f -exec install -Dm644 {} "$pkgdir/usr/share/bash-completion/completions/floc" \;
  find . -name _floc -type f -exec install -Dm644 {} "$pkgdir/usr/share/zsh/site-functions/_floc" \;
  find . -name sd.fish -type f -exec install -Dm644 {} "$pkgdir/usr/share/fish/vendor_completions/floc.fish" \;
  find . -name floc.1 -type f -exec install -Dm644 {} "$pkgdir/usr/share/man/man1/floc.1" \;
  gzip "$pkgdir/usr/share/man/man1/floc.1"
}
