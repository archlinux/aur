# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=youki
pkgver=0.3.3
pkgrel=1
pkgdesc='A container runtime written in Rust'
arch=('x86_64')
url='https://containers.github.io/youki'
license=('Apache-2.0')
depends=('gcc-libs' 'libseccomp' 'dbus')
makedepends=('rust' 'git' 'dbus-glib' 'systemd')
optdepends=(
  'docker: run via docker'
  'podman: run via podman'
)
options=('!lto')
source=("git+https://github.com/containers/youki.git#tag=v$pkgver")
sha256sums=('8a675b03e839967ffee2992f45d5e17edc41ddbc5117247d26b71e1d1d01cddf')

prepare() {
  cd youki

  # create directory for build artifacts
  mkdir build

  # v0.3.2 lock file is out of sync
  cargo update

  # download dependencies
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
