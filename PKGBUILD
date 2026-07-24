#!/bin/sh
# Maintainer: Aidan Timson (Timmo) <aidan@timmo.dev>
pkgname=home-assistant-tui-git
pkgver=0.1.0.r56.g6e67c60
pkgrel=1
pkgdesc="Terminal UI for Home Assistant (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/timmo001/home-assistant-tui"
license=('Apache-2.0')
makedepends=('git' 'bun' 'nodejs')
depends=('glibc' 'icu')
provides=('home-assistant-tui')
conflicts=('home-assistant-tui' 'home-assistant-tui-bin')
options=('!strip' '!debug')
source=("$pkgname::git+https://github.com/timmo001/home-assistant-tui.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  local version
  version=$(git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')
  if [ -n "$version" ]; then
    printf '%s' "$version"
  else
    printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

build() {
  cd "$pkgname"
  bun install --frozen-lockfile
  bun build src/index.ts --compile --outfile home-assistant-tui
  ./home-assistant-tui completions bash > home-assistant-tui.bash
  ./home-assistant-tui completions fish > home-assistant-tui.fish
  ./home-assistant-tui completions zsh > _home-assistant-tui
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 home-assistant-tui "$pkgdir/usr/bin/home-assistant-tui"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 home-assistant-tui.bash "$pkgdir/usr/share/bash-completion/completions/home-assistant-tui"
  install -Dm644 home-assistant-tui.fish "$pkgdir/usr/share/fish/vendor_completions.d/home-assistant-tui.fish"
  install -Dm644 _home-assistant-tui "$pkgdir/usr/share/zsh/site-functions/_home-assistant-tui"
}
