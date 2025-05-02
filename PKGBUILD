# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: KokaKiwi <kokakiwi+aur at kokakiwi dot net>
# Contributor: tee < teeaur at duck dot com >

pkgname=bkmr
pkgver=4.20.5
pkgrel=1
pkgdesc='A Unified CLI Tool for Bookmark, Snippet, and Knowledge Management'
url='https://github.com/sysid/bkmr'
license=('BSD-3-Clause')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs' 'openssl' 'python')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d6ccddc6313d32932e2c637d5f1497992eb6b98e61dd0cb8ffab34ebb0823057')
options=('!lto')

case $CARCH in
  x86_64|i686|aarch64)
    _target="$CARCH-unknown-linux-gnu" ;;
  arm)
    _target="arm-unknown-linux-gnueabi" ;;
esac

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --manifest-path bkmr/Cargo.toml --target $_target
}

build() {
  cd "$pkgname-$pkgver"

  CARGO_TARGET_DIR='target' RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix $srcdir=src" \
    cargo build --manifest-path bkmr/Cargo.toml --frozen --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" target/release/bkmr
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  ./target/release/bkmr completion bash > bkmr.sh 2>/dev/null
  install -Dm644 bkmr.sh "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  ./target/release/bkmr completion fish > fish.fish 2>/dev/null
  install -Dm644 fish.fish "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
  ./target/release/bkmr completion zsh > zsh.zsh 2>/dev/null
  install -Dm644 zsh.zsh "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
