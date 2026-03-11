# Maintainer: goshitsarch <goshitsarch@proton.me>
pkgname=gosh-dl-cli
pkgver=0.3.2
pkgrel=1
pkgdesc='Fast download manager with HTTP and BitTorrent support'
arch=('x86_64' 'aarch64')
url='https://github.com/goshitsarch-eng/gosh-dl-cli'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'cmake' 'perl')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e16d4c7c2fbd695f2730785645164797a69b3f7d78a98339e67979a89c3072f6')

prepare() {
  cd "gosh-dl-cli-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "gosh-dl-cli-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "gosh-dl-cli-$pkgver"
  install -Dm0755 "target/release/gosh" "$pkgdir/usr/bin/gosh"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Generate shell completions
  "$pkgdir/usr/bin/gosh" completions bash > gosh.bash
  "$pkgdir/usr/bin/gosh" completions zsh > _gosh
  "$pkgdir/usr/bin/gosh" completions fish > gosh.fish
  install -Dm0644 gosh.bash "$pkgdir/usr/share/bash-completion/completions/gosh"
  install -Dm0644 _gosh "$pkgdir/usr/share/zsh/site-functions/_gosh"
  install -Dm0644 gosh.fish "$pkgdir/usr/share/fish/vendor_completions.d/gosh.fish"
}
