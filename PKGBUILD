# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=mergestat
pkgver=0.5.3
pkgrel=1
pkgdesc="Query git repositories with SQL"
arch=('x86_64')
url="https://app.mergestat.com/w/public"
license=('MIT')
depends=('libgit2')
makedepends=('git' 'go')
options=('!lto')
_commit='4d10da58cdc3f770846192c734645fd0add03f05'
source=("$pkgname::git+https://github.com/mergestat/mergestat.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # download dependencies
  go mod download
}

build() {
  cd "$pkgname"

  make

  # generate shell completions
  for shell in bash fish zsh; do
    ./.build/mergestat completion "$shell" > ".build/$shell.completion"
  done
}

check() {
  cd "$pkgname"

  make test
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" .build/mergestat

  # shared library
  install -vDm644 -t "$pkgdir/usr/lib" .build/libmergestat.so

  # shell completions
  install -vDm644 .build/bash.completion "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -vDm644 .build/fish.completion "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
  install -vDm644 .build/zsh.completion "$pkgdir/usr/share/zsh/site-functions/_$pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
