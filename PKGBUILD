# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: mocihan <ly50247@126.com>
# Contributor: Fredy García <frealgagu at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=just-git
pkgver=0.9.4.r879.g2eebdbb2
pkgrel=1
pkgdesc="Just a command runner"
arch=('i686' 'x86_64')
url="https://just.systems/"
license=('CC0-1.0')
depends=('glibc' 'libgcc')
makedepends=('git' 'cargo')
provides=("just=$pkgver")
conflicts=('just')
source=("git+https://github.com/casey/just.git")
sha256sums=('SKIP')


prepare() {
  cd "just"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

pkgver() {
  cd "just"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

check() {
  cd "just"

  #cargo test \
  #  --frozen
}

package() {
  cd "just"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path .

  install -d "$pkgdir/usr/share/man/man1"
  "$pkgdir/usr/bin/just" --man > "$pkgdir/usr/share/man/man1/just.1"
  install -Dm644 {README,GRAMMAR}.md -t "$pkgdir/usr/share/doc/just"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/just"

  install -Dm644 "completions/just.bash" "$pkgdir/usr/share/bash-completion/completions/just"
  install -Dm644 "completions/just.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d"
  install -Dm644 "completions/just.zsh" "$pkgdir/usr/share/zsh/site-functions/_just"
}
