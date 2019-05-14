# Maintainer: Chris Nixon <chris.nixon@sigma.me.uk>
pkgname=ripgrep-git
pkgver=11.0.1.r8.5ce2d73
pkgrel=1
pkgdesc="A search tool that combines the usability of The Silver Searcher with the raw speed of grep."
arch=('i686' 'x86_64')
url="https://github.com/BurntSushi/ripgrep"
license=('UNLICENSE' 'MIT')
provides=("ripgrep")
makedepends=('cargo' 'git' 'asciidoc')
optdepends=('fish: fish completions')
depends=('pcre2')
conflicts=('ripgrep')
source=("$pkgname::git+https://github.com/BurntSushi/ripgrep")
sha1sums=('SKIP')

build() {
  cd "$pkgname"
  if command -v rustup > /dev/null 2>&1; then
    RUSTFLAGS="-C target-cpu=native" rustup run nightly \
      cargo build --release --features pcre2
  elif rustc --version | grep -q nightly; then
    RUSTFLAGS="-C target-cpu=native" \
      cargo build --release --features pcre2
  else
    cargo build --release --features pcre2
  fi
}

pkgver() {
  cd "$pkgname"
  local tag=$(git tag --sort=-v:refname | grep '^[0-9]' | head -1)
  local commits_since=$(git rev-list $tag..HEAD --count)
  echo "$tag.r$commits_since.$(git log --pretty=format:'%h' -n 1)"
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/rg" "$pkgdir/usr/bin/rg"

  install -Dm644 "complete/_rg" "$pkgdir/usr/share/zsh/site-functions/_rg"
  install -Dm644 "target/release/build/ripgrep-"*/out/rg.bash "$pkgdir/usr/share/bash-completion/completions/rg"

  install -Dm644 "target/release/build/ripgrep-"*/out/rg.1 "$pkgdir/usr/share/man/man1/rg.1"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 "UNLICENSE" "$pkgdir/usr/share/licenses/${pkgname}/UNLICENSE"
}
