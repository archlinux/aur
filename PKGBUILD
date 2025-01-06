# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Wenxuan <wenxuangm@gmail.com>

pkgname=code-minimap
pkgver=0.6.8
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
b2sums=('84248f8660ba9ea377823fb71a7c2bbec36398fc7fe51deb8d6e48c4182946e525365463ba9fb6f02847a43d8719ff3040e47655174b399bc38dfc4ec7f00878')

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
