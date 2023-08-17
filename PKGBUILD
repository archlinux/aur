# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=agree
pkgver=0.1.0
pkgrel=1
pkgdesc="A CLI application that implements multi-key-turn security via Shamir's Secret Sharing"
url='https://github.com/replicadse/agree'
license=('MIT')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nix-community/nurl/archive/refs/tags/v$pkgver.tar.gz")
source=("$pkgname-$pkgver.tar.gz::https://github.com/replicadse/agree/archive/refs/tags/$pkgver.tar.gz"
        "$pkgname-$pkgver-manpages.tar.gz::https://github.com/replicadse/agree/releases/download/$pkgver/docs-manpages.tar.gz"
        "$pkgname-$pkgver-shell-completion.tar.gz::https://github.com/replicadse/agree/releases/download/$pkgver/shell-completion.tar.gz")
sha256sums=('01aad4ff6a3006465b3ac50b3f3727fc3030a2f9357d349684e9946e7de95e8a'
            'd98525c14bde342e3ff99952bf95698186c7ee893624beb59b4b1922f5878043'
            '3253806e195aae6873c8b4b1d97d30ae2f393458cc8f976dd0bc2ce18ad3bf75')
b2sums=('fb203a757b716d6065c8314f6d3ba2693c77ada150648ebd53fc703f712dad86a52a58f55eefeea5d18a560cb15ea5bdf7c4231e04fee77059458810ebb7f854'
        '75259ef6b4e8893b2195397350fba29d3221a83c03f888b4a3b2965e125444ad7732aef47098d7ff1bebd7acf5fd951a0a5d8e716d2733d1aec7881edc414b39'
        'a37f38ce880aaa5fbcb02e5749ae43acb9152e3054f8103f4ebdd0a7754c004cf7753c76e67204f486895bd98923fede3b8a06ec05ad29702e07286e5e871643')

case $CARCH in
  x86_64|i686|aarch64)
    _target="$CARCH-unknown-linux-gnu" ;;
  arm)
    _target="arm-unknown-linux-gnueabi" ;;
esac

prepare() {
  for f in _neomake neomake.*; do
    sed -i -s 's/neomake/agree/' "$f"
  done

  cd "$pkgname-$pkgver"

  cargo fetch --locked --target $_target
}

build() {
  cd "$pkgname-$pkgver"

  CARGO_TARGET_DIR='target' \
    cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" \
    target/release/agree

  install -Dm0644 -t "$pkgdir/usr/share/man/man1" "$srcdir"/*.1

  install -Dm0644 "$srcdir/neomake.bash" "$pkgdir/usr/share/bash-completion/completions/agree"
  install -Dm0644 "$srcdir/_neomake" "$pkgdir/usr/share/zsh/site-functions/_agree"
  install -Dm0644 "$srcdir/neomake.fish" "$pkgdir/usr/share/fish/vendor_completions.d/agree.fish"

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
