# Maintainer: Nick Dowsett <nickdowsett42@gmail.com>

pkgname=youtui
pkgver=0.0.30
pkgrel=1
pkgdesc="A simple TUI YouTube Music player written in Rust aiming to implement an Artist->Albums workflow for searching for music, and using discoverability principles for navigation."
url="https://github.com/nick42d/youtui"
arch=('x86_64' 'armv7h' 'aarch64')
license=('MIT')
depends=('alsa-lib')
optdepends=('yt-dlp: can be used as an alternative music downloader')
makedepends=('cargo' 'base-devel')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('8e7516e4353cc79cd86c5f9f1a86b388b74c27af1ce69019405a6f1b519073db')
# Workaround for Ring bug https://github.com/briansmith/ring/issues/1444
# More info: https://gitlab.archlinux.org/archlinux/packaging/packages/pacman/-/issues/20
options=(!lto)

prepare() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd $pkgname-$pkgver
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"

  mkdir -p "$pkgdir/usr/share/zsh/site-functions"
  target/release/$pkgname --generate-completions zsh > "$pkgdir/usr/share/zsh/site-functions/_$pkgname"

  mkdir -p "$pkgdir/usr/share/bash-completion/completions"
  target/release/$pkgname --generate-completions bash > "$pkgdir/usr/share/bash-completion/completions/$pkgname"

  mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d"
  target/release/$pkgname --generate-completions fish > "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
}
