# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=youki
pkgver=0.1.0
_commit='4dc30bf7c02be584eddfc182d4e96b7cbbb3474c'
pkgrel=1
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

  cargo build --frozen --release --bin youki

  # generate shell completions
  for shell in bash fish zsh; do
    ./target/release/youki completion --shell "$shell" > "build/$shell-completion"
  done
}

#check() {
#  cd youki
#
#  cargo test --frozen
#}

package() {
  cd youki

  install -vDm755 -t "$pkgdir/usr/bin" target/release/youki

  # shell completions
  install -vDm644 build/bash-completion "$pkgdir/usr/share/bash-completion/completions/youki"
  install -vDm644 build/fish-completion "$pkgdir/usr/share/fish/vendor_completions.d/youki.fish"
  install -vDm644 build/zsh-completion "$pkgdir/usr/share/zsh/site-functions/_youki"
}
