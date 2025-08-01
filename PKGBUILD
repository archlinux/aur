# Maintainer: Max Harmathy <harmathy@alumni.tum.de>
pkgname=openstack_cli
pkgver=0.13.0
pkgrel=1
pkgdesc="CLI for the OpenStack written in Rust"
arch=('x86_64')
url="https://github.com/gtema/openstack"
license=('Apache-2.0')
depends=(
  'gcc-libs'
  'glibc'
)
makedepends=(
  'cargo'
  'git'
)
conflicts=('osc')
options=('!lto')
source=("git+$url.git#tag=$pkgname-v$pkgver")
sha256sums=('2bc66f86f7b0e5542cf75db0e8248b032b10a186401fae14436bd3c7fe4f7f46')

build() {
  cd openstack
  export CARGO_HOME="$srcdir/cargo-home"
  cargo build --release --bin osc
}

package() {
  cd openstack
  install -Dm755 -t "$pkgdir/usr/bin" target/release/osc

  # bash completion
  install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
  target/release/osc completion bash > "$pkgdir/usr/share/bash-completion/completions/osc"

  # fish completion
  install -dm 755 "$pkgdir/usr/share/fish/completions/"
  target/release/osc completion fish > "$pkgdir/usr/share/fish/completions/osc.fish"

  # zsh completion
  install -dm 755 "$pkgdir/usr/share/zsh/site-functions"
  target/release/osc completion zsh >  "$pkgdir/usr/share/zsh/site-functions/_osc"
}

