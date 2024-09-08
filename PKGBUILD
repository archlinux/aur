# Maintainer: Bastien "neitsab" Traverse <neitsab@archlinux.org>

pkgname=nspawn-rust-git
pkgver=r48.696c9fc
pkgrel=1
pkgdesc='A wrapper around machinectl for easy-deployment of nspawn.org containers (rust_dev branch)'
url='https://github.com/nspawn/nspawn'
license=('GPL-3.0-only')
# depends=('gcc-libs' 'openssl')  # both are dependencies of `base` package
makedepends=('cargo' 'git')
provides=('nspawn')
conflicts=('nspawn')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("$pkgname::git+${url}.git#branch=rust_dev")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%-rust-git}"

  # Shell completions
  target/release/${pkgname%-rust-git} --autocomplete=bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/nspawn"
  target/release/${pkgname%-rust-git} --autocomplete=fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/nspawn.fish"
  target/release/${pkgname%-rust-git} --autocomplete=zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_nspawn"
}
