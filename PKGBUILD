# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=agree
pkgver=0.2.0
pkgrel=1
pkgdesc="A CLI application that implements multi-key-turn security via Shamir's Secret Sharing"
url='https://github.com/replicadse/agree'
license=('MIT')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/replicadse/agree/archive/refs/tags/$pkgver.tar.gz"
        "$pkgname-$pkgver-manpages.tar.gz::https://github.com/replicadse/agree/releases/download/$pkgver/docs-manpages.tar.gz"
        "$pkgname-$pkgver-shell-completion.tar.gz::https://github.com/replicadse/agree/releases/download/$pkgver/shell-completion.tar.gz")
sha256sums=('b6e3e2ddabf128e3fc9def63b430cf023e1550ea3ec7fcfbb4b2045f6f9ec121'
            '24fcba938d6f476077b18fc2c74ce36befb2da83bdf407bdb731127e7f0aeba5'
            'e5ab7d30309605f4512a074ac2466ca2ba58dc3c4ee24841e31e9ee98599072e')
b2sums=('b23f4744e55b084a080953ba14f6a9de83371c0ff8254759f731cfe7db16ebfb7ea99a7ab945ecc32b3ae09cce0d95cb16b322bb2c0031074a651c73eee4eea9'
        '048db1cb5c36aa537edd3ba236160994af406983e1aa92cfbee7cacfc31ca436f2c0696f068dda3b53c75ecab681caeb794a031f3da6ea5d99d01c82b164cdbb'
        '07dfbf39ec0e9a46f6156aaf0b2092fddb5ee4e695e96458572ec641ae8639a14526a1cd58ecbc9eb19cf7fb1656467633f00f6819a15455c404ca72bf546b64')
options=(!lto)

case $CARCH in
  x86_64|i686|aarch64)
    _target="$CARCH-unknown-linux-gnu" ;;
  arm)
    _target="arm-unknown-linux-gnueabi" ;;
esac

prepare() {
  sed -i -s 's/neomake/agree/' _neomake neomake.*

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
