# Maintainer: Evan Sosenko <razorx@evansosenko.com>

pkgname=notion-cli-bin
pkgver=0.23.31
pkgrel=2
pkgdesc='Notion CLI (beta), using the official prebuilt binary'
arch=('x86_64' 'aarch64')
url='https://developers.notion.com'
license=('MIT')
provides=("notion-cli=$pkgver" "ntn=$pkgver")
conflicts=('notion-cli' 'ntn')
options=('!strip' '!debug')

_release="https://ntn.dev/releases/v$pkgver"
source_x86_64=("ntn-$pkgver-x86_64.tar.gz::$_release/ntn-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("ntn-$pkgver-aarch64.tar.gz::$_release/ntn-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('05158fa909a5f442df158f2a24c12ce4b1abb9f99046c3aedfb471b305d18c68')
sha256sums_aarch64=('0b833b776bfd4fb209f838f02956950f91c282deb54e035b7664abdc05b67544')

build() {
  local shell
  mkdir -p "$srcdir/completion-home"
  # Invoke ntn through PATH so clap doesn't embed the build path.
  for shell in bash zsh fish; do
    PATH="$srcdir/ntn-$CARCH-unknown-linux-musl:$PATH" HOME="$srcdir/completion-home" \
      ntn completions "$shell" > "$srcdir/ntn.$shell" || return 1
  done
}

package() {
  cd "$srcdir/ntn-$CARCH-unknown-linux-musl"
  install -Dm755 ntn "$pkgdir/usr/bin/ntn"
  install -Dm644 "$srcdir/ntn.bash" "$pkgdir/usr/share/bash-completion/completions/ntn"
  install -Dm644 "$srcdir/ntn.zsh" "$pkgdir/usr/share/zsh/site-functions/_ntn"
  install -Dm644 "$srcdir/ntn.fish" "$pkgdir/usr/share/fish/vendor_completions.d/ntn.fish"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
