# Maintainer: Max Harmathy <harmathy@alumni.tum.de>
pkgname=openstack_cli
pkgver=0.7.1
pkgrel=1
pkgdesc="CLI for the OpenStack written in Rust"
arch=('x86_64')
url="https://github.com/gtema/openstack"
license=('Apache-2.0')
depends=()
makedepends=('cargo')
options=('!lto')
source=("git+$url.git#tag=$pkgname-v$pkgver")
sha256sums=('24f91b67c0c8ac0bc2bc6fd1c4fa11142695097e621c90c2edc38b3eae5ab44f')

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

