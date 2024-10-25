# Maintainer: izzqz <v@izzqz.me>
pkgname=rip2-git
pkgver=0.9.0
pkgrel=1
pkgdesc="A safe and ergonomic alternative to rm"
arch=('i686' 'x86_64')
url="https://github.com/MilesCranmer/rip2"
license=("GPL-3.0-or-later")
provides=("rip")
makedepends=('cargo' 'git')
optdepends=(
  'fish: fish completions'
  'zsh: zsh completions'
)
depends=()
conflicts=('rip')
source=("$pkgname-$pkgver::git+https://github.com/MilesCranmer/rip2")
sha1sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked --all-features
}

check() {
  cd "$pkgname-$pkgver"

  cargo test --release --locked --all-features
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/rip" "$pkgdir/usr/bin/rip"

  install -d \
    "$pkgdir/usr/share/bash-completion/completions" \
    "$pkgdir/usr/share/fish/vendor_completions.d" \
    "$pkgdir/usr/share/zsh/site-functions"

  target/release/rip completions bash > "$pkgdir/usr/share/bash-completion/completions/rip"
  target/release/rip completions fish > "$pkgdir/usr/share/fish/vendor_completions.d/rip.fish"
  target/release/rip completions zsh > "$pkgdir/usr/share/zsh/site-functions/_rip"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
