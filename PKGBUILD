# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=scls
pkgver=1.0.5
pkgrel=1
pkgdesc="Allow to use common word completion and snippets for Helix editor"
url="https://github.com/d1y/scls"
license=(MIT)
arch=(x86_64)
makedepends=(cargo)
conflicts=(simple-completion-language-server-git simple-completion-language-server)
provides=(simple-completion-language-server-git simple-completion-language-server)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('49d009731f8366707e116f59bf673c06de5e0df00bf055a764d0e8d06740bcd3')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo update time
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --offline --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 -t "$pkgdir/usr/bin" \
  	"target/release/simple-completion-language-server"
}
