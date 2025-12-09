# Maintainer: ilovemikael <itsmeguys2247 at gmail dot com>
pkgname=ripgrep-git
pkgver=15.1.0.r4.57c190d5
pkgrel=1
pkgdesc="A search tool that combines the usability of The Silver Searcher with the raw speed of grep."
arch=('i686' 'x86_64')
url="https://github.com/BurntSushi/ripgrep"
license=('UNLICENSE' 'MIT')
provides=("ripgrep")
makedepends=('cargo' 'git')
optdepends=('fish: fish completions' 'zsh: zsh completions')
depends=('pcre2')
conflicts=('ripgrep')
source=("$pkgname::git+https://github.com/BurntSushi/ripgrep")
sha1sums=('SKIP')

pkgver() {
  cd "$pkgname"
  local tag=$(git tag --sort=-v:refname | grep '^[0-9]' | head -1)
  local commits_since=$(git rev-list $tag..HEAD --count)
  echo "$tag.r$commits_since.$(git log --pretty=format:'%h' -n 1)"
}


build() {
  cd "$pkgname"

  cargo build --release --features pcre2
}

check() {
  cd "$pkgname"

  cargo test --release --features pcre2
}


package() {
  cd "$pkgname"
  install -Dm755 "target/release/rg" "$pkgdir/usr/bin/rg"

  mkdir -vp "$pkgdir/usr/share/zsh/site-functions"
  target/release/rg --generate complete-zsh > "$pkgdir/usr/share/zsh/site-functions/_rg"

  mkdir -vp "$pkgdir/usr/share/bash-completion/completions"
  target/release/rg --generate complete-bash > "$pkgdir/usr/share/bash-completion/completions/rg"

  mkdir -vp "$pkgdir/usr/share/fish/vendor_completions.d"
  target/release/rg --generate complete-fish > "$pkgdir/usr/share/fish/vendor_completions.d/rg.fish"

  mkdir -vp "$pkgdir/usr/share/man/man1"
  target/release/rg --generate man > "$pkgdir/usr/share/man/man1/rg.1"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 "UNLICENSE" "$pkgdir/usr/share/licenses/${pkgname}/UNLICENSE"
}
