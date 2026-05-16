# Maintainer: Jon Kinney
pkgname=tensaku
pkgver=0.21.0
pkgrel=1
pkgdesc='Modern screenshot annotation tool for Wayland'
arch=('x86_64')
url='https://github.com/jondkinney/tensaku'
license=('MPL-2.0')
depends=('gtk4' 'libadwaita' 'libepoxy' 'fontconfig')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('12dd309b97f9e14759d3769d39535a01d9433ee1dbc3db55eb8e843f3c6edf07')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --features ci-release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/tensaku "$pkgdir/usr/bin/tensaku"
  install -Dm644 tensaku.desktop "$pkgdir/usr/share/applications/tensaku.desktop"
  install -Dm644 assets/tensaku.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/tensaku.svg"
  install -Dm644 man/tensaku.1 "$pkgdir/usr/share/man/man1/tensaku.1"
  install -Dm644 completions/tensaku.bash "$pkgdir/usr/share/bash-completion/completions/tensaku"
  install -Dm644 completions/tensaku.fish "$pkgdir/usr/share/fish/vendor_completions.d/tensaku.fish"
  install -Dm644 completions/_tensaku "$pkgdir/usr/share/zsh/site-functions/_tensaku"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
