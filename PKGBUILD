# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=youki
pkgver=0.0.2
pkgrel=1
pkgdesc="A container runtime written in Rust"
arch=('x86_64')
url="https://containers.github.io/youki"
license=('Apache')
depends=('gcc-libs' 'libseccomp' 'dbus' 'docker')
makedepends=('rust' 'git' 'dbus-glib' 'systemd')
options=('!lto')
_commit='0f662dd9794f54f42ec26ed569efd3ba016555b9'
source=("$pkgname::git+https://github.com/containers/youki.git#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd youki

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd youki

  # create directory for build artifacts
  mkdir build

  # download dependencies
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd youki

  cargo build --frozen --release

  # generate shell completions
  for shell in bash fish zsh; do
    ./target/$CARCH-unknown-linux-gnu/release/youki completion --shell "$shell" > "build/$shell-completion"
  done
}

check() {
  cd youki

  cargo test --frozen
}

package() {
  cd youki

  install -vDm755 -t "$pkgdir/usr/bin" "target/$CARCH-unknown-linux-gnu/release/youki"

  # shell completions
  install -vDm644 build/bash-completion "$pkgdir/usr/share/bash-completion/completions/youki"
  install -vDm644 build/fish-completion "$pkgdir/usr/share/fish/vendor_completions.d/youki.fish"
  install -vDm644 build/zsh-completion "$pkgdir/usr/share/zsh/site-functions/_youki"
}
