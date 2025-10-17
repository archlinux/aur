# Maintainer:  Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: KokaKiwi <kokakiwi+aur at kokakiwi dot net>
# Contributor: tee < teeaur at duck dot com >

pkgname=bkmr
pkgver=6.2.6
pkgrel=1
pkgdesc="A Unified CLI Tool for Bookmark, Snippet, and Knowledge Management"
url="https://github.com/sysid/$pkgname"
license=('BSD-3-Clause')
arch=('x86_64' 'i686' 'aarch64' 'arm')
depends=('gcc-libs' 'glibc' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7cdb4fd78b4a75995f0009529110d58246b301f2da00a616ba976c27d46c5ac3')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"

  case "$CARCH" in
  x86_64|i686|aarch64)
    _target="$CARCH-unknown-linux-gnu" ;;
  arm)
    _target="$CARCH-unknown-linux-gnueabi" ;;
    *)
    printf 'Architecture %s is not supported\n' "$CARCH" >&2
    exit 1 ;;
  esac

  cargo fetch --manifest-path $pkgname/Cargo.toml --target "$_target"
}

build() {
  cd "$pkgname-$pkgver"

  CARGO_TARGET_DIR='target' RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix $srcdir=src" cargo build --manifest-path $pkgname/Cargo.toml --frozen --release

  for _shell in bash fish zsh; do
    ./target/release/$pkgname completion "$_shell" > "_completion.$_shell" 2>/dev/null
  done
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" target/release/$pkgname

  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  install -Dm644 _completion.bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm644 _completion.fish "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
  install -Dm644 _completion.zsh  "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
