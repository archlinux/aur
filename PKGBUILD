# Maintainer: Vaishnav Sabari Girish <vaishnav.sabari.girish@gmail.com>
pkgname=tmail
pkgver=1.0.2
pkgrel=1
pkgdesc='A fast terminal email client with a spatial conversation map (IMAP/SMTP, Maildir)'
arch=('x86_64' 'aarch64')
url='https://github.com/tuna4ll/tmail'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
optdepends=('gnupg: message signing and encryption'
  'gnome-keyring: password storage in the system keyring'
  'kitty: inline images in HTML mail'
  'wezterm: inline images in HTML mail'
  'foot: inline images in HTML mail')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c3cf4ef7eb0142bd722586cc530beac81be8346d02b7decdfac45bf4e8ba101c')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  # Man page and shell completions come from the binary itself
  "target/release/$pkgname" man | install -Dm644 /dev/stdin "$pkgdir/usr/share/man/man1/$pkgname.1"
  "target/release/$pkgname" completions bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  "target/release/$pkgname" completions zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
  "target/release/$pkgname" completions fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 docs/configuration.md "$pkgdir/usr/share/doc/$pkgname/configuration.md"
  install -Dm644 docs/scripting.md "$pkgdir/usr/share/doc/$pkgname/scripting.md"
}
