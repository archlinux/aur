# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kaare Jenssen <kaare at jenssen dot it>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>

pkgname=fd-git
pkgver=8.2.0.r92.g3ba90dd
pkgrel=1
pkgdesc='A simple, fast and user-friendly alternative to find.'
arch=('i686' 'x86_64')
url='https://github.com/sharkdp/fd'
license=('APACHE' 'MIT')
depends=('gcc-libs')
makedepends=('git' 'cargo')
provides=('fd')
conflicts=('fd')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  git -C "$pkgname" describe --long --tags | sed 's/v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cd "$pkgname"
  cargo build --release --frozen --all-features
}

check() {
  export RUSTUP_TOOLCHAIN=stable

  cd "$pkgname"
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname"
  install -Dm755 target/release/fd -t "$pkgdir/usr/bin/"
  install -Dm644 target/release/build/fd-find-*/out/fd.bash "$pkgdir/usr/share/bash-completion/completions/fd"
  install -Dm644 target/release/build/fd-find-*/out/fd.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm644 contrib/completion/_fd -t "$pkgdir/usr/share/zsh/site-functions/"
  install -Dm644 doc/fd.1 -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 LICENSE-{APACHE,MIT} -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
