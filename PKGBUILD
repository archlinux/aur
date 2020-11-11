# Maintainer: Wenxuan <wenxuangm@gmail.com>

pkgname=code-minimap
pkgver=0.6.4
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
b2sums=('8b3e10a6222b7c6feb9151f83b37f4ca40adeac12b17fbb2d6a8ef75abfe1f7ed40cccf2ca8da0c9a3662e98804c8f2392c5fd98c2a586b70e0edfb76e7891cc')

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
