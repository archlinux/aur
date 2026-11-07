# Maintainer: Arisa Snowbell <arisa.snowbell+aur at gmail.com>
pkgname=shiny-mirrors
pkgver=1.0.0
pkgrel=1
pkgdesc="An alternative to reflector, written in Rust! A tool to find the best mirrors for you!"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/Arisa_Snowbell/shiny-mirrors"
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')
backup=("etc/$pkgname.toml")
install="$pkgname.install"
source=("git+$url.git#tag=v$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('E2C998FA1F7B651E45B20CDC56AA2C2801F619D7')
options=(!lto)

prepare() {
  cd "$srcdir/$pkgname"
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$srcdir/$pkgname"
  unset CARGO_TARGET_DIR
  cargo build --frozen --release --no-default-features --features arch
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "target/gen/_$pkgname" -t "$pkgdir/usr/share/zsh/site-functions/"
  install -Dm644 "target/gen/$pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm644 "target/gen/$pkgname.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm644 "$pkgname/man/$pkgname.1" -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 "conf/$pkgname.toml" -t "$pkgdir/etc/"
  install -Dm644 "$pkgname/systemd/$pkgname.service" -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 "$pkgname/systemd/$pkgname.timer" -t "$pkgdir/usr/lib/systemd/system/"
}
