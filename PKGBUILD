# Maintainer: l1a <634380+l1a@users.noreply.github.com>
pkgname=retch
pkgver=0.8.0
pkgrel=1
pkgdesc="A fast, feature-rich system information fetcher written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/l1a/retch"
license=('GPL3')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('709047019e2d9937ca532a02fffcf7eb9caf1107dcd96d722aec9d925c9af9a2')

prepare() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo build --release --frozen

  # The man page is NOT regenerated here: docs/retch.1 is committed and ships in the release
  # tarball already carrying the correct .TH footer for this tag (verified for v0.6.23:
  # `.TH "RETCH" "1" "August 2026" "retch 0.6.23" ...`). package() installs that file directly.
  #
  # The mandown+sed pipeline this replaces was broken in two independent ways, both silent:
  #   1. `sed -e 's/\\fB\\fB/\\fB/g'` never matched anything on any platform — GNU sed reads
  #      `\\f` as the form-feed escape, not backslash-then-f, and groff output contains no form
  #      feeds. Same defect the Justfile carried until retch v0.6.16, fixed there by matching
  #      the backslash as `[\]` and carrying it out through a capture group.
  #   2. `\$DATE` and `\$pkgver` are *literal* inside a bash double-quoted string, so the .TH
  #      replacement wrote the dollar signs through verbatim and the installed page's footer
  #      read `$DATE` / `retch $pkgver` rather than the date and version.
  # Regenerating also made the packaged page depend on which mandown build ran, which is what
  # made retch's own `just pr` man-regen check flip between machines.
}

check() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  
  # Install binary
  install -Dm755 "target/release/retch" "$pkgdir/usr/bin/retch"
  
  # Install the committed man page as shipped in the tarball (see build()).
  install -Dm644 "docs/retch.1" "$pkgdir/usr/share/man/man1/retch.1"
  
  # Install shell completions
  install -d "$pkgdir/usr/share/bash-completion/completions"
  install -d "$pkgdir/usr/share/zsh/site-functions"
  install -d "$pkgdir/usr/share/fish/vendor_completions.d"
  
  "$pkgdir/usr/bin/retch" --completions bash > "$pkgdir/usr/share/bash-completion/completions/retch"
  "$pkgdir/usr/bin/retch" --completions zsh > "$pkgdir/usr/share/zsh/site-functions/_retch"
  "$pkgdir/usr/bin/retch" --completions fish > "$pkgdir/usr/share/fish/vendor_completions.d/retch.fish"
  
  # Install license
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  # Install documentation
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
