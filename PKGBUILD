# Contributor: Benoît Zugmeyer <bzugmeyer@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=deno-git
pkgver=1.28.0.r8202.g7aa8e9c0351e
pkgrel=1
pkgdesc="A secure runtime for JavaScript and TypeScript"
arch=('x86_64')
url="https://deno.land"
provides=('deno')
conflicts=('deno')
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'python' 'cargo' 'nodejs')
source=("deno-git::git+https://github.com/denoland/deno")
md5sums=('SKIP')
options=('!makeflags')

pkgver() {
  cd $pkgname
  printf %s.r%s.g%s  $(git tag | cut -c2- |sort -n|tail -1) $(git rev-list --count HEAD) \
	 $(git log|head -1| cut -d" " -f2|cut -c1-12)
 }

prepare() {
  cd $pkgname
  git submodule update --init --recursive
}

build() {
  cd $pkgname
  cargo build --release 
}

check() {
  cd $pkgname
  ./target/release/deno run cli/tests/testdata/run/002_hello.ts
}

package() {
  cd $pkgname
  install -Dm755 target/release/deno "$pkgdir"/usr/bin/deno
  install -dm755 "$pkgdir"/usr/share/bash-completion/completions
  ./target/release/deno completions bash > "$pkgdir"/usr/share/bash-completion/completions/deno
  install -dm755 "$pkgdir"/usr/share/zsh/site-functions
  ./target/release/deno completions zsh > "$pkgdir"/usr/share/zsh/site-functions/_deno
  install -dm755 "$pkgdir"/usr/share/fish/vendor_functions.d
  ./target/release/deno completions fish > "$pkgdir"/usr/share/fish/vendor_functions.d/deno.fish
  install -Dm644 LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname/
}
