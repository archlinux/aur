# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Grzegorz Koperwas <admin@grzegorzkoperwas.site>

pkgname=swww
pkgver=0.8.2
pkgrel=2
pkgdesc="A Solution to your Wayland Wallpaper Woes"
arch=(x86_64 aarch64)
url="https://github.com/LGFae/swww"
license=(GPL-3.0-only)
depends=(
  gcc-libs
  glibc
  libxkbcommon
  lz4
)
makedepends=(
  cargo
  scdoc
)
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6733cda771a0e635dbd00f7aef78ed60f1ccdf640647ecfe02d0cdfdef996b68')

_archive="$pkgname-$pkgver"

prepare() {
  cd "$_archive"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_archive"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features

  # manpages
  ./doc/gen.sh
}

check() {
  cd "$_archive"

  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$_archive"

  install -Dm755 -t "$pkgdir/usr/bin" \
    target/release/swww \
    target/release/swww-daemon

  install -Dm644 completions/swww.bash "$pkgdir/usr/share/bash-completion/completions/swww"
  install -Dm644 completions/swww.fish "$pkgdir/usr/share/fish/vendor_completions.d/swww.fish"
  install -Dm644 completions/_swww "$pkgdir/usr/share/zsh/site-functions/_swww"

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md

  # manpages
  install -Dm644 -t "$pkgdir/usr/share/man/man1" ./doc/generated/*.1
}
