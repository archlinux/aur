# Maintainer: hisbaan <hisbaan@gmail.com>
# https://github.com/hisbaan
# https://hisbaan.com

pkgname=trashy-git
pkgver=1.0.3.r47.8621895
pkgrel=1
pkgdesc='a cli system trash manager, alternative to rm and trash-cli'
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url='https://github.com/oberblastmeister/trashy'
license=('MIT' 'Apache')
depends_x86_64=('gcc-libs')
makedepends=('git' 'cargo' 'binutils')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/oberblastmeister/trashy.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s" "$(git describe --long | sed 's/v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cd "$srcdir/${pkgname%-git}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/${pkgname%-git}"

  CARGO_TARGET_DIR='target' \
    cargo build --frozen --release --all-features

  target/release/trashy completions zsh > _trashy.zsh
  target/release/trashy completions bash > trashy.bash
  target/release/trashy completions fish > trashy.fish
  target/release/trashy manpage > trashy.1
}

package() {
  cd "$srcdir/${pkgname%-git}"

  install -Dm0755 -t "$pkgdir/usr/bin" target/release/trashy

  install -Dm0644 _trashy.zsh "$pkgdir/usr/share/zsh/site-functions/_trashy"
  install -Dm0644 trashy.bash "$pkgdir/usr/share/bash-completion/completions/trashy"
  install -Dm0644 trashy.fish "$pkgdir/usr/share/fish/vendor_completions.d/trashy.fish"
  install -Dm0644 trashy.1 "$pkgdir/usr/share/man/man1/trashy.1"

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE-{APACHE,MIT}
}
