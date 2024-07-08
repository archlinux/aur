# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Wenxuan <wenxuangm@gmail.com>

pkgname=code-minimap
pkgver=0.6.7
pkgrel=1
pkgdesc='High performance code minimap render'
arch=(x86_64)
url=https://github.com/wfxr/code-minimap
license=('Apache-2.0 OR MIT')
depends=(gcc-libs)
makedepends=(
  git
  rust
)
source=("git+$url.git#tag=v$pkgver")
b2sums=('bbeda1b573ca22ac1a9e2bc1e792ff9068459d8044f9cba2b42e9d221f1755306134168496b0c0d56731c5ad8140b7fd612b690494de885ef9b353eec9414f74')

prepare() {
  cd $pkgname
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgname
  SHELL_COMPLETIONS_DIR=completions cargo build --release --locked --offline
}

check() {
  cd $pkgname
  cargo test --locked --offline
}
package() {
  cd $pkgname
  install -Dt "$pkgdir"/usr/bin target/release/$pkgname
  install -Dm644 -t "$pkgdir"/usr/share/fish/vendor_completions.d \
    completions/fish/$pkgname.fish
  install -Dm644 -t "$pkgdir"/usr/share/zsh/site-functions \
    completions/zsh/_$pkgname
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE-MIT
}
