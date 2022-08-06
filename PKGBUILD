# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=youki
pkgver=0.0.3
pkgrel=2
pkgdesc='A container runtime written in Rust'
arch=('x86_64')
url='https://containers.github.io/youki'
license=('Apache')
depends=('gcc-libs' 'libseccomp' 'dbus')
makedepends=('rust' 'git' 'dbus-glib' 'systemd')
optdepends=(
  'docker: run via docker'
  'podman: run via podman'
)
options=('!lto')
_commit='541bf4a26cc0c3ec397398ed5971f08285a24076'
source=("$pkgname::git+https://github.com/containers/youki.git#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd youki

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd youki/crates

  # create directory for build artifacts
  mkdir build

  # download dependencies
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd youki/crates

  cargo build --frozen --release

  # generate shell completions
  for shell in bash fish zsh; do
    ./target/release/youki completion --shell "$shell" > "build/$shell-completion"
  done
}

check() {
  cd youki/crates

  cargo test --frozen
}

package() {
  cd youki/crates

  install -vDm755 -t "$pkgdir/usr/bin" target/release/youki

  # shell completions
  install -vDm644 build/bash-completion "$pkgdir/usr/share/bash-completion/completions/youki"
  install -vDm644 build/fish-completion "$pkgdir/usr/share/fish/vendor_completions.d/youki.fish"
  install -vDm644 build/zsh-completion "$pkgdir/usr/share/zsh/site-functions/_youki"
}
